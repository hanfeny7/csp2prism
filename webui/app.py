#!/usr/bin/env python3
"""
Enhanced Web UI for pat2prism tool
Provides visual interface for PAT to PRISM conversion with code cleaning
"""
import sys
import os
import re
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'pat2prism'))

from flask import Flask, render_template, request, jsonify, send_from_directory
from flask_cors import CORS
from antlr4 import InputStream, CommonTokenStream
from gen.PATLexer import PATLexer
from gen.PATParser import PATParser
from src.pat2prism.pat_visitor import SimpleVisitor
from src.pat2prism.ir_builder_enhanced import EnhancedIRBuilder
from src.pat2prism.prism_generator_enhanced import render_prism_enhanced
from src.pat2prism.error_handler import ErrorCollector

app = Flask(__name__)
CORS(app)


def clean_pat_code(pat_code):
    """Clean and normalize PAT code to make it compatible with the tool"""
    lines = pat_code.split('\n')
    cleaned_lines = []
    
    # Track which process definitions are system-level (parallel composition only)
    system_processes = set()
    
    # First pass: identify system processes
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        # Look for process definitions like: System() = P1() || P2();
        if '=' in line and '||' in line and '()' in line:
            match = re.match(r'(\w+)\s*\(\s*\)\s*=\s*(.+)', line)
            if match:
                proc_name = match.group(1)
                body = match.group(2).strip().rstrip(';')
                # Check if body is pure parallel composition
                if '||' in body and all(part.strip().endswith('()') for part in body.split('||')):
                    system_processes.add(proc_name)
        i += 1
    
    # Second pass: clean code
    for line in lines:
        original_line = line
        line_stripped = line.strip()
        
        # Skip empty lines
        if not line_stripped:
            cleaned_lines.append('')
            continue
        
        # Comment out system-level process definitions
        process_match = re.match(r'(\w+)\s*\(\s*\)\s*=', line_stripped)
        if process_match and process_match.group(1) in system_processes:
            cleaned_lines.append('// [System Process] ' + line_stripped)
            continue
        
        # Convert #define to var declarations
        if line_stripped.startswith('#define'):
            match = re.match(r'#define\s+(\w+)\s+(.+)', line_stripped)
            if match:
                var_name = match.group(1)
                value = match.group(2).rstrip(';').strip()
                if '(' not in value:  # Simple value, not macro function
                    cleaned_lines.append(f'var {var_name} = {value};')
                    continue
        
        # Remove/comment out preprocessor directives
        if line_stripped.startswith('#'):
            cleaned_lines.append('// ' + line_stripped)
            continue
        
        # Fix channel declarations
        if line_stripped.startswith('channel'):
            match = re.match(r'channel\s+(\w+)\s*(\d*)\s*;?', line_stripped)
            if match:
                ch_name = match.group(1)
                ch_size = match.group(2) if match.group(2) else '0'
                cleaned_lines.append(f'channel {ch_name} {ch_size};')
                continue
        
        # Handle array initializations (convert to simple value)
        if 'var' in line_stripped and '[' in line_stripped and ']' in line_stripped:
            # Replace array [a,b,c] with first value a
            match = re.match(r'(var\s+\w+\s*=\s*)\[([^\]]+)\]', line_stripped)
            if match:
                prefix = match.group(1)
                array_content = match.group(2)
                first_val = array_content.split(',')[0].strip()
                cleaned_lines.append(f'{prefix}{first_val};  // Simplified from array')
                continue
        
        # Simplify complex if-else blocks to avoid parser issues
        # Keep the original structure but add comments
        if 'if' in line_stripped and '{' in line_stripped:
            # Parser struggles with nested if-else, but let it try
            cleaned_lines.append(line_stripped)
            continue
        
        # Ensure statements end with semicolon
        if line_stripped.startswith(('var', 'enum')) and not line_stripped.endswith((';', '}')):
            line_stripped += ';'
        
        cleaned_lines.append(line_stripped if line == line_stripped else line)
    
    return '\n'.join(cleaned_lines)


def convert_pat_to_prism(pat_code, options=None):
    """Convert PAT code to PRISM code"""
    if options is None:
        options = {}
    
    error_collector = ErrorCollector()
    
    try:
        # Parse PAT code
        input_stream = InputStream(pat_code)
        lexer = PATLexer(input_stream)
        token_stream = CommonTokenStream(lexer)
        parser = PATParser(token_stream)
        parse_tree = parser.spec()
        
        # Build AST
        visitor = SimpleVisitor(error_collector)
        ast_spec = visitor.visitSpec(parse_tree)
        
        # Build IR with enhanced builder
        ir_builder = EnhancedIRBuilder(error_collector)
        ir_spec = ir_builder.build_ir(ast_spec)
        
        # Generate PRISM code
        prism_code = render_prism_enhanced(ir_spec, opts={
            'nonce_size': options.get('nonce_size', 10000),
            'p_flip': options.get('p_flip', 0.02),
            'inject_intruder': options.get('inject_intruder', False)
        })
        
        # Collect statistics
        message_fields_dict = {}
        if hasattr(ir_builder, 'message_fields'):
            # Convert set values to lists for JSON serialization
            for msg_type, field_set in ir_builder.message_fields.items():
                message_fields_dict[msg_type] = list(field_set) if isinstance(field_set, set) else field_set
        
        stats = {
            'processes': len(ir_spec.processes),
            'channels': len(ir_spec.channels),
            'variables': len(ir_spec.variables),
            'message_fields': message_fields_dict
        }
        
        errors = [{'message': e.message, 'context': e.context or ''} for e in error_collector.errors]
        warnings = [{'message': w.message, 'context': w.context or ''} for w in error_collector.warnings]
        
        return prism_code, errors, warnings, stats
        
    except Exception as e:
        import traceback
        return None, [{'message': str(e), 'context': traceback.format_exc()}], [], {}


@app.route('/')
def index():
    """Main page"""
    return render_template('index.html')


@app.route('/api/convert', methods=['POST'])
def api_convert():
    """API endpoint for PAT to PRISM conversion"""
    try:
        data = request.json
        pat_code = data.get('pat_code', '')
        options = data.get('options', {})
        
        if not pat_code.strip():
            return jsonify({'success': False, 'error': 'PAT code is empty'})
        
        prism_code, errors, warnings, stats = convert_pat_to_prism(pat_code, options)
        
        return jsonify({
            'success': prism_code is not None,
            'prism_code': prism_code or '',
            'errors': errors,
            'warnings': warnings,
            'stats': stats
        })
    except Exception as e:
        import traceback
        return jsonify({
            'success': False,
            'error': str(e),
            'traceback': traceback.format_exc(),
            'prism_code': '',
            'errors': [{'message': str(e), 'context': 'API Error'}],
            'warnings': [],
            'stats': {}
        }), 500


@app.route('/api/clean', methods=['POST'])
def api_clean():
    """API endpoint for cleaning PAT code"""
    try:
        data = request.json
        pat_code = data.get('pat_code', '')
        
        if not pat_code.strip():
            return jsonify({'success': False, 'error': 'PAT code is empty'})
        
        cleaned_code = clean_pat_code(pat_code)
        
        return jsonify({'success': True, 'cleaned_code': cleaned_code})
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500


@app.route('/api/examples', methods=['GET'])
def api_examples():
    """Get example PAT files"""
    examples_dir = os.path.join(os.path.dirname(__file__), '..', 'pat2prism', 'examples')
    examples = []
    
    if os.path.exists(examples_dir):
        for filename in sorted(os.listdir(examples_dir)):
            if filename.endswith('.pat'):
                filepath = os.path.join(examples_dir, filename)
                try:
                    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                        content = f.read()
                        examples.append({'name': filename, 'content': content})
                except:
                    continue
    
    return jsonify({'success': True, 'examples': examples})


if __name__ == '__main__':
    print("=" * 70)
    print("PAT2PRISM - Process Analysis Toolkit to PRISM Converter")
    print("=" * 70)
    print("Server starting at: http://localhost:5000")
    print("Network access at:  http://0.0.0.0:5000")
    print("")
    print("Features:")
    print("  • Visual code editor with dual-pane layout")
    print("  • Automatic message field extraction")
    print("  • PAT code cleaning and normalization")
    print("  • Real-time syntax validation")
    print("")
    print("Press Ctrl+C to stop the server")
    print("=" * 70)
    app.run(debug=True, host='0.0.0.0', port=5000)
