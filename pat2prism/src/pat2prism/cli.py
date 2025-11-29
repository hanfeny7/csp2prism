"""
Command-line interface for pat2prism.
"""
import argparse
import sys
import re
import logging
from pathlib import Path
from antlr4 import InputStream, CommonTokenStream
from antlr4.error.ErrorListener import ErrorListener
from gen.PATLexer import PATLexer
from gen.PATParser import PATParser

from .pat_visitor import SimpleVisitor, IRBuilder
from .ir_builder_enhanced import EnhancedIRBuilder
from .prism_generator_enhanced import render_prism_enhanced
from .prism_generator_v2 import render_prism
from .error_handler import ErrorCollector

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(levelname)s: %(message)s'
)
logger = logging.getLogger(__name__)


class SyntaxErrorListener(ErrorListener):
    """Custom ANTLR error listener"""
    def __init__(self, error_collector: ErrorCollector):
        super().__init__()
        self.error_collector = error_collector
    
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        self.error_collector.add_error(
            f"Syntax error: {msg}",
            context=f"Line {line}:{column}",
            line=line,
            suggestion="Check PAT syntax near this location"
        )


def main(argv=None):
    parser = argparse.ArgumentParser(
        prog='pat2prism',
        description='Convert PAT security protocol models to PRISM',
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    parser.add_argument('-i', '--input', required=True, help='Input PAT file')
    parser.add_argument('-o', '--output', required=True, help='Output PRISM file')
    parser.add_argument('--nonce-size', type=int, default=2, help='Max nonce value')
    parser.add_argument('--p-flip', type=float, default=0.02, help='Bit flip probability')
    parser.add_argument('--inject-intruder', action='store_true', help='Add intruder module')
    parser.add_argument('--verbose', '-v', action='store_true', help='Enable verbose output')
    parser.add_argument('--strict', action='store_true', help='Fail on warnings')
    parser.add_argument('--continue-on-error', action='store_true', 
                       help='Continue processing despite errors (may produce incomplete output)')
    args = parser.parse_args(argv)
    
    # Configure logging level
    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)
    
    # Error collector
    error_collector = ErrorCollector()
    
    logger.info(f"Converting {args.input} -> {args.output}")

    try:
        # Read input file
        input_path = Path(args.input)
        if not input_path.exists():
            logger.error(f"Input file not found: {args.input}")
            return 1
        
        input_text = input_path.read_text(encoding='utf-8')
        logger.debug(f"Read {len(input_text)} characters from input file")

        # Simple pre-processing for common PAT extensions used in examples:
        # - Convert "#define NAME VALUE;" -> "var NAME = VALUE;"
        # - Remove function-like #define macros and other # directives
        # - Remove "#assert" lines
        def preprocess(text: str) -> str:
            out_lines = []
            skip_block = False
            skip_brace_depth = 0
            seen_proc = False
            for raw in text.splitlines():
                line = raw.strip()

                # detect start of process definitions to avoid dropping in-body assignments
                if not seen_proc and re.match(r'^[A-Za-z_][A-Za-z0-9_]*\s*\(.*\)\s*=\s*', line):
                    seen_proc = True

                if skip_block:
                    # track braces to find macro end robustly
                    skip_brace_depth += raw.count('{') - raw.count('}')
                    # if we see the terminating sequence '};' or brace depth <=0, end skip
                    if '};' in line or skip_brace_depth <= 0:
                        skip_block = False
                        skip_brace_depth = 0
                    continue

                if line.startswith('#define'):
                    # function-like macro: remove block until '};'
                    # function-like macro definition: skip the macro body entirely
                    if '(' in line and ')' in line:
                        # If macro has body starting on same line: begin skipping until matching '}'
                        if '{' in line and '}' in line:
                            # single-line macro with body: skip
                            continue
                        # start skipping subsequent lines until matching braces close
                        skip_block = True
                        skip_brace_depth = raw.count('{') - raw.count('}')
                        # if no braces on this line, expect following lines to contain body
                        continue
                    m = re.match(r"#define\s+([A-Za-z_][A-Za-z0-9_]*)\s+([^;]+);?", line)
                    if m:
                        name = m.group(1)
                        val = m.group(2).strip()
                        out_lines.append(f'var {name} = {val};')
                    else:
                        # unknown define, drop
                        continue
                elif line.startswith('#assert') or (line.startswith('#') and not line.startswith('#define')):
                    # drop asserts and other preprocessor lines for now
                    continue
                else:
                    # remove array-size in var declarations like: var random[4] = [...]; -> var random = [...];
                    if not seen_proc:
                        m_arr = re.match(r'^(\s*var\s+)([A-Za-z_][A-Za-z0-9_]*)\s*\[\s*\d+\s*\]\s*(=\s*.*)$', raw)
                        if m_arr:
                            raw = f"{m_arr.group(1)}{m_arr.group(2)} {m_arr.group(3)}"

                        # drop stray lines from removed macro bodies (e.g., standalone assignments outside processes)
                        if not seen_proc and re.match(r'^\s*[A-Za-z_][A-Za-z0-9_]*\s*=.*;$', raw):
                            # likely part of a macro body, skip
                            continue

                    # fix anonymous enum: 'enum { ... }' -> 'enum ANON_ENUM { ... }'
                    if line.startswith('enum {'):
                        raw = raw.replace('enum {', 'enum ANON_ENUM {', 1)

                    # Remove trailing semicolon inside enum braces: enum { ... }; -> enum { ... }
                    raw = re.sub(r'(\benum\s+[A-Za-z_][A-Za-z0-9_]*\s*\{[^}]+\});', r'\1', raw)

                    # Allow anonymous enum: 'enum { ... };' -> 'enum ANON_ENUM { ... };'
                    if re.match(r'^\s*enum\s*\{', line):
                        raw = re.sub(r'enum\s*\{', 'enum ANON_ENUM {', raw, count=1)

                    # In process body: convert if-blocks with curly braces to choice processes
                    # Pattern: if(cond) { ... } else { ... } -> [cond] -> ... [] skip -> ...
                    if seen_proc:
                        raw = re.sub(r'if\s*\(\s*([^)]+)\s*\)\s*\{', r'[(\1)] ->', raw)
                        raw = re.sub(r'\}\s*else\s*\{', r' [] {', raw)

                    # simplify single-call or single-assignment blocks: {call(...);} -> call(...)
                    # and {var = expr;} -> var = expr
                    raw_stripped = raw.strip()
                    m_call_block = re.match(r"^\{\s*call\((.*)\);\s*\}$", raw_stripped)
                    if m_call_block:
                        out_lines.append(f"call({m_call_block.group(1)})")
                    else:
                        m_assign_block = re.match(r"^\{\s*([A-Za-z_][A-Za-z0-9_]*\s*=\s*[^;]+);\s*\}$", raw_stripped)
                        if m_assign_block:
                            out_lines.append(m_assign_block.group(1))
                        else:
                            out_lines.append(raw)
            return '\n'.join(out_lines)

        processed = preprocess(input_text)
        # Replace plain identifier 'random' with 'random_var' to avoid
        # conflicts with older generated lexer that treats 'random' as a token.
        # This keeps the semantics (array/identifier) but ensures it's parsed as IDENT.
        processed = re.sub(r"\brandom\b", 'random_var', processed)

        # Parse with ANTLR and error handling
        logger.debug("Parsing PAT input...")
        input_stream = InputStream(processed)
        lexer = PATLexer(input_stream)
        lexer.removeErrorListeners()
        lexer.addErrorListener(SyntaxErrorListener(error_collector))
        
        stream = CommonTokenStream(lexer)
        parser = PATParser(stream)
        parser.removeErrorListeners()
        parser.addErrorListener(SyntaxErrorListener(error_collector))
        parse_tree = parser.spec()
        
        if error_collector.has_errors() and not args.continue_on_error:
            logger.error("Parsing failed with errors:")
            print(error_collector.get_report(), file=sys.stderr)
            return 1
        
        # Build AST
        logger.debug("Building AST...")
        builder = SimpleVisitor()
        if hasattr(builder, 'error_collector'):
            builder.error_collector = error_collector
        ast_spec = builder.visitSpec(parse_tree)
        
        if error_collector.has_errors() and not args.continue_on_error:
            logger.error("AST construction failed:")
            print(error_collector.get_report(), file=sys.stderr)
            return 1
        
        # Build IR using enhanced builder
        logger.debug("Building IR with enhanced builder...")
        try:
            ir_builder = EnhancedIRBuilder(error_collector)
            ir_spec = ir_builder.build_ir(ast_spec)
        except Exception as e:
            logger.warning(f"Enhanced IR builder failed: {e}, falling back to basic IR builder")
            ir_builder = IRBuilder(error_collector)
            ir_spec = ir_builder.build_ir(ast_spec)
        
        if error_collector.has_errors() and not args.continue_on_error:
            logger.error("IR construction failed:")
            print(error_collector.get_report(), file=sys.stderr)
            return 1
        
        # Generate PRISM using enhanced generator
        logger.debug("Generating PRISM code with enhanced template...")
        try:
            prism = render_prism_enhanced(ir_spec, opts=dict(
                nonce_size=args.nonce_size,
                p_flip=args.p_flip,
                inject_intruder=args.inject_intruder
            ))
        except Exception as e:
            logger.warning(f"Enhanced PRISM generation failed: {e}, trying fallback")
            try:
                prism = render_prism(ir_spec, opts=dict(
                    nonce_size=args.nonce_size,
                    p_flip=args.p_flip,
                    inject_intruder=args.inject_intruder
                ))
            except Exception as e2:
                error_collector.add_error(
                    f"PRISM code generation failed: {e2}",
                    suggestion="Check template or IR structure"
                )
                if not args.continue_on_error:
                    print(error_collector.get_report(), file=sys.stderr)
                    return 1
                prism = "// Generation failed\n"
        
        # Write output
        output_path = Path(args.output)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(prism, encoding='utf-8')
        
        # Final report
        logger.info(f"✓ PRISM model written to {args.output}")
        logger.info("Note: Generated PRISM model is a skeleton requiring manual refinement")
        logger.info("      Especially: function implementations, probabilistic models, and message field logic")
        
        if error_collector.warnings:
            logger.warning(f"{len(error_collector.warnings)} warning(s) generated")
            if args.verbose:
                print(error_collector.get_report())
        
        if error_collector.has_errors():
            logger.error(f"{len(error_collector.errors)} error(s) encountered")
            print(error_collector.get_report(), file=sys.stderr)
            if args.strict:
                return 1
        
        return 0
        
    except Exception as e:
        logger.error(f'Unexpected error: {e}')
        import traceback
        if args.verbose if 'args' in locals() else False:
            traceback.print_exc()
        return 1


if __name__ == '__main__':
    sys.exit(main())
