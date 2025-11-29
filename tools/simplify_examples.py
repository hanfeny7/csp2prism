#!/usr/bin/env python3
import re
from pathlib import Path

SRC_DIR = Path('pat2prism/examples')

def simplify(text: str) -> str:
    t = text
    # remove #assert lines
    t = re.sub(r'^\s*#assert.*$', '', t, flags=re.MULTILINE)
    # convert simple defines: #define NAME VALUE;  -> var NAME = VALUE;
    t = re.sub(r'^\s*#define\s+([A-Za-z_][A-Za-z0-9_]*)\s+([^;\n\{]+);', r'var \1 = \2;', t, flags=re.MULTILINE)
    # remove function-like defines with body entirely: #define F(...) { ... };
    t = re.sub(r'#define\s+[A-Za-z_][A-Za-z0-9_]*\s*\([^)]*\)\s*\{.*?\};', '', t, flags=re.DOTALL)
    # change array declarations var name[NUM] = [...] -> var name = [...]
    t = re.sub(r'var\s+([A-Za-z_][A-Za-z0-9_]*)\s*\[\s*\d+\s*\]\s*=\s*', r'var \1 = ', t)
    # replace identifier 'random' with 'random_var'
    t = re.sub(r'\brandom\b', 'random_var', t)
    # remove semicolon immediately after enum closing brace '};' -> '}'
    t = re.sub(r'\}\s*;', '}', t)
    # simplify single-statement blocks like {call(...);} -> call(...)
    t = re.sub(r'\{\s*(call\([^}]+\));?\s*\}', r'\1', t)
    # simplify blocks containing single assignment { x = y; } -> x = y
    t = re.sub(r'\{\s*([A-Za-z_][A-Za-z0-9_]*\s*=\s*[^;]+);?\s*\}', r'\1', t)
    # remove leftover empty lines
    t = '\n'.join([ln for ln in t.splitlines() if ln.strip() != ''])
    return t

def main():
    files = sorted(SRC_DIR.glob('*.pat'))
    for f in files:
        if f.name.endswith('_simplified.pat'):
            continue
        out = SRC_DIR / (f.stem + '_simplified.pat')
        print(f'Processing {f} -> {out}')
        txt = f.read_text(encoding='utf-8')
        simplified = simplify(txt)
        out.write_text(simplified, encoding='utf-8')

if __name__ == '__main__':
    main()
