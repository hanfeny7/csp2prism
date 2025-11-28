from antlr4 import *
from gen.PATLexer import PATLexer
from gen.PATParser import PATParser
from src.pat2prism.pat_visitor import MyPATVisitor

input_stream = FileStream("examples/coap_eap_module.pat")

lexer = PATLexer(input_stream)
token_stream = CommonTokenStream(lexer)

parser = PATParser(token_stream)
tree = parser.spec()   

visitor = MyPATVisitor()
modules = visitor.visit(tree)

for module_name, module in modules.items():
    prism_code = module.to_prism()
    output_file = f"out/{module_name}.pm"
    with open(output_file, "w") as f:
        f.write(prism_code)
    print(f"[+] Wrote module {module_name} to {output_file}")
