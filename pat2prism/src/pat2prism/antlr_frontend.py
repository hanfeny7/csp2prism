"""
ANTLR-based frontend with regex fallback.

- If you generated ANTLR parser into `gen/` (using antlr jar), this will import and use it.
- Otherwise it falls back to a regex-based parser that handles the PAT subset used here.
"""
from typing import List, Tuple
import re
import importlib
import sys

# Try to import generated ANTLR modules from gen.*
_HAS_ANTLR = False
try:
    # We expect generated files under package 'gen' added to sys.path or project root.
    # Typical generator: java -jar antlr-4.X-complete.jar -Dlanguage=Python3 -o gen grammar/PAT.g4
    gen_pkg = importlib.import_module('gen.PATLexer')
    gen_pkg = importlib.import_module('gen.PATParser')
    gen_pkg = importlib.import_module('gen.PATVisitor')
    from antlr4 import InputStream, CommonTokenStream, ParseTreeWalker
    from gen.PATLexer import PATLexer
    from gen.PATParser import PATParser
    from gen.PATVisitor import PATVisitor
    _HAS_ANTLR = True
except Exception:
    _HAS_ANTLR = False

# -------- regex fallback parser --------
def _regex_parse(text: str) -> List[Tuple]:
    CHANNEL_RE = re.compile(r'^\s*channel\s+([A-Za-z0-9_]+)\s+[0-9]+\s*;?\s*$', re.MULTILINE)
    PROCESS_RE = re.compile(r'^([A-Za-z0-9_]+)\s*\(\)\s*=\s*(.*?)\s*;\s*$', re.DOTALL | re.MULTILINE)
    SEND_RE = re.compile(r'([A-Za-z0-9_]+)!([A-Za-z0-9_\.]+)(?:\.([A-Za-z0-9_]+))?')
    RECV_RE = re.compile(r'([A-Za-z0-9_]+)\?([A-Za-z0-9_\.]+)(?:\.([A-Za-z0-9_]+))?')
    FUNC_CALL_RE = re.compile(r'call\s*\(\s*([A-Za-z0-9_]+)\s*,')
    ASSIGN_RE = re.compile(r'([A-Za-z0-9_]+)\s*=')

    parsed = []
    for ch in CHANNEL_RE.findall(text):
        parsed.append(('channel', ch))
    for m in PROCESS_RE.finditer(text):
        name = m.group(1).strip()
        body = m.group(2).strip()
        parts = [part.strip() for part in re.split(r'->', body) if part.strip()]
        steps = []
        for part in parts:
            s = SEND_RE.search(part)
            if s:
                steps.append(('send', s.group(1), s.group(2), s.group(3)))
                continue
            r = RECV_RE.search(part)
            if r:
                steps.append(('recv', r.group(1), r.group(2), r.group(3)))
                continue
            f = FUNC_CALL_RE.search(part)
            if f:
                steps.append(('call', f.group(1)))
                continue
            a = ASSIGN_RE.search(part)
            if a:
                steps.append(('assign', a.group(1)))
                continue
            steps.append(('nop', part[:80]))
        parsed.append(('process', name, steps))
    return parsed

# -------- ANTLR-based visitor builder --------
if _HAS_ANTLR:
    from antlr4 import InputStream, CommonTokenStream, ParseTreeWalker
    from gen.PATLexer import PATLexer
    from gen.PATParser import PATParser
    from gen.PATVisitor import PATVisitor

    class _TreeToTuplesVisitor(PATVisitor):
        """
        Visit the parse tree and construct the same tuple structure as regex fallback:
        [('channel', name), ('process', name, steps), ...]
        """
        def visitSpec(self, ctx):
            items = []
            for c in ctx.item():
                res = self.visit(c)
                if res is None:
                    continue
                if isinstance(res, list):
                    items.extend(res)
                else:
                    items.append(res)
            return items

        def visitChannelDecl(self, ctx):
            name = ctx.IDENT().getText()
            return ('channel', name)

        def visitProcessDecl(self, ctx):
            name = ctx.IDENT().getText()
            proc_body = ctx.procBody()
            steps = []
            # procBody: step (ARROW step)*
            first = proc_body.step(0)
            steps.extend(self._collect_steps(proc_body))
            return ('process', name, steps)

        def _collect_steps(self, proc_body_ctx):
            steps = []
            for i in range(0, len(proc_body_ctx.step())):
                sctx = proc_body_ctx.step(i)
                if sctx.sendStep():
                    ss = sctx.sendStep()
                    chan = ss.IDENT(0).getText()
                    msg = ss.IDENT(1).getText()
                    fld = None
                    if ss.maybeField() and ss.maybeField().IDENT():
                        fld = ss.maybeField().IDENT().getText()
                    steps.append(('send', chan, msg, fld))
                elif sctx.recvStep():
                    rs = sctx.recvStep()
                    chan = rs.IDENT(0).getText()
                    msg = rs.IDENT(1).getText()
                    fld = None
                    if rs.maybeField() and rs.maybeField().IDENT():
                        fld = rs.maybeField().IDENT().getText()
                    steps.append(('recv', chan, msg, fld))
                elif sctx.callStep():
                    cs = sctx.callStep()
                    # callStep: 'call' '(' IDENT (',' ...)? ')'
                    name = cs.IDENT().getText()
                    steps.append(('call', name))
                elif sctx.assignStep():
                    a = sctx.assignStep()
                    left = a.IDENT(0).getText()
                    right = a.IDENT(1).getText()
                    steps.append(('assign', left, right))
                elif sctx.nopStep():
                    n = sctx.nopStep()
                    steps.append(('nop', n.IDENT().getText()))
                else:
                    # general fallback
                    steps.append(('nop', sctx.getText()))
            return steps

    def parse_text(text: str) -> List[Tuple]:
        input_stream = InputStream(text)
        lexer = PATLexer(input_stream)
        stream = CommonTokenStream(lexer)
        parser = PATParser(stream)
        tree = parser.spec()
        visitor = _TreeToTuplesVisitor()
        return visitor.visit(tree)

    

else:
    def parse_text(text: str) -> List[Tuple]:
        return _regex_parse(text)
