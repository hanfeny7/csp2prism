from antlr4 import *
from gen.PATLexer import PATLexer
from gen.PATParser import PATParser
from src.pat2prism.pat_visitor import MyPATVisitor

# 1. 读取 PAT 文件
input_stream = FileStream("examples/coap_eap_module.pat")

# 2. 词法分析
lexer = PATLexer(input_stream)
token_stream = CommonTokenStream(lexer)

# 3. 语法分析
parser = PATParser(token_stream)
tree = parser.spec()   # spec 是 PAT.g4 的顶层规则

# 4. Visitor 遍历 AST
visitor = MyPATVisitor()
modules = visitor.visit(tree)

# 5. 输出 PRISM MDP 模型
for module_name, module in modules.items():
    prism_code = module.to_prism()
    output_file = f"out/{module_name}.pm"
    with open(output_file, "w") as f:
        f.write(prism_code)
    print(f"[+] Wrote module {module_name} to {output_file}")
