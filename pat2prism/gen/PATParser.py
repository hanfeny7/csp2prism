# Generated from grammar/PAT.g4 by ANTLR 4.13.1
# encoding: utf-8
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
	from typing import TextIO
else:
	from typing.io import TextIO

def serializedATN():
    return [
        4,1,45,334,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,
        2,14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,
        7,20,2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,
        2,27,7,27,2,28,7,28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,1,0,
        5,0,68,8,0,10,0,12,0,71,9,0,1,0,1,0,1,1,1,1,1,1,1,1,3,1,79,8,1,1,
        2,1,2,1,2,3,2,84,8,2,1,2,1,2,1,3,1,3,1,3,1,3,5,3,92,8,3,10,3,12,
        3,95,9,3,1,3,1,3,1,4,1,4,1,4,3,4,102,8,4,1,4,1,4,1,4,1,4,1,4,1,5,
        1,5,1,5,5,5,112,8,5,10,5,12,5,115,9,5,1,6,1,6,1,7,1,7,1,7,5,7,122,
        8,7,10,7,12,7,125,9,7,1,8,1,8,1,8,5,8,130,8,8,10,8,12,8,133,9,8,
        1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,3,9,145,8,9,1,10,1,10,1,
        10,1,10,1,10,3,10,152,8,10,1,11,1,11,1,11,3,11,157,8,11,1,12,1,12,
        1,12,1,12,3,12,163,8,12,1,13,1,13,1,14,1,14,1,15,1,15,4,15,171,8,
        15,11,15,12,15,172,1,16,1,16,1,16,1,16,1,16,3,16,180,8,16,1,16,1,
        16,1,16,1,17,1,17,1,17,1,17,1,17,5,17,190,8,17,10,17,12,17,193,9,
        17,1,17,1,17,1,17,1,17,1,17,3,17,200,8,17,1,18,1,18,1,18,1,18,1,
        18,1,18,1,19,1,19,1,19,3,19,211,8,19,1,19,3,19,214,8,19,1,20,1,20,
        1,20,5,20,219,8,20,10,20,12,20,222,9,20,1,21,1,21,1,21,4,21,227,
        8,21,11,21,12,21,228,1,22,1,22,1,22,1,22,1,22,1,22,1,22,1,22,1,22,
        3,22,240,8,22,1,23,1,23,3,23,244,8,23,1,23,1,23,1,24,1,24,1,24,1,
        24,1,24,1,24,1,24,1,24,1,24,1,24,3,24,258,8,24,1,25,1,25,1,26,1,
        26,1,26,5,26,265,8,26,10,26,12,26,268,9,26,1,27,1,27,1,27,5,27,273,
        8,27,10,27,12,27,276,9,27,1,28,1,28,1,28,5,28,281,8,28,10,28,12,
        28,284,9,28,1,29,1,29,1,29,5,29,289,8,29,10,29,12,29,292,9,29,1,
        30,1,30,1,30,5,30,297,8,30,10,30,12,30,300,9,30,1,31,1,31,1,31,3,
        31,305,8,31,1,32,1,32,1,32,1,32,1,32,1,32,3,32,313,8,32,1,32,1,32,
        1,32,3,32,318,8,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,
        1,32,1,32,1,32,3,32,332,8,32,1,32,0,0,33,0,2,4,6,8,10,12,14,16,18,
        20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,
        64,0,8,1,0,36,37,2,0,26,26,34,34,2,0,27,27,30,30,1,0,8,9,1,0,10,
        15,1,0,19,20,1,0,21,23,2,0,18,18,20,20,350,0,69,1,0,0,0,2,78,1,0,
        0,0,4,80,1,0,0,0,6,87,1,0,0,0,8,98,1,0,0,0,10,108,1,0,0,0,12,116,
        1,0,0,0,14,118,1,0,0,0,16,126,1,0,0,0,18,144,1,0,0,0,20,151,1,0,
        0,0,22,156,1,0,0,0,24,158,1,0,0,0,26,164,1,0,0,0,28,166,1,0,0,0,
        30,170,1,0,0,0,32,174,1,0,0,0,34,199,1,0,0,0,36,201,1,0,0,0,38,207,
        1,0,0,0,40,215,1,0,0,0,42,223,1,0,0,0,44,239,1,0,0,0,46,241,1,0,
        0,0,48,257,1,0,0,0,50,259,1,0,0,0,52,261,1,0,0,0,54,269,1,0,0,0,
        56,277,1,0,0,0,58,285,1,0,0,0,60,293,1,0,0,0,62,304,1,0,0,0,64,331,
        1,0,0,0,66,68,3,2,1,0,67,66,1,0,0,0,68,71,1,0,0,0,69,67,1,0,0,0,
        69,70,1,0,0,0,70,72,1,0,0,0,71,69,1,0,0,0,72,73,5,0,0,1,73,1,1,0,
        0,0,74,79,3,4,2,0,75,79,3,8,4,0,76,79,3,6,3,0,77,79,3,48,24,0,78,
        74,1,0,0,0,78,75,1,0,0,0,78,76,1,0,0,0,78,77,1,0,0,0,79,3,1,0,0,
        0,80,81,5,35,0,0,81,83,5,42,0,0,82,84,5,41,0,0,83,82,1,0,0,0,83,
        84,1,0,0,0,84,85,1,0,0,0,85,86,5,30,0,0,86,5,1,0,0,0,87,88,7,0,0,
        0,88,89,5,42,0,0,89,93,7,1,0,0,90,92,8,2,0,0,91,90,1,0,0,0,92,95,
        1,0,0,0,93,91,1,0,0,0,93,94,1,0,0,0,94,96,1,0,0,0,95,93,1,0,0,0,
        96,97,7,2,0,0,97,7,1,0,0,0,98,99,5,42,0,0,99,101,5,24,0,0,100,102,
        3,10,5,0,101,100,1,0,0,0,101,102,1,0,0,0,102,103,1,0,0,0,103,104,
        5,25,0,0,104,105,5,34,0,0,105,106,3,12,6,0,106,107,5,30,0,0,107,
        9,1,0,0,0,108,113,5,42,0,0,109,110,5,31,0,0,110,112,5,42,0,0,111,
        109,1,0,0,0,112,115,1,0,0,0,113,111,1,0,0,0,113,114,1,0,0,0,114,
        11,1,0,0,0,115,113,1,0,0,0,116,117,3,14,7,0,117,13,1,0,0,0,118,123,
        3,16,8,0,119,120,5,6,0,0,120,122,3,16,8,0,121,119,1,0,0,0,122,125,
        1,0,0,0,123,121,1,0,0,0,123,124,1,0,0,0,124,15,1,0,0,0,125,123,1,
        0,0,0,126,131,3,18,9,0,127,128,5,5,0,0,128,130,3,18,9,0,129,127,
        1,0,0,0,130,133,1,0,0,0,131,129,1,0,0,0,131,132,1,0,0,0,132,17,1,
        0,0,0,133,131,1,0,0,0,134,145,3,22,11,0,135,145,3,20,10,0,136,145,
        3,36,18,0,137,145,3,38,19,0,138,139,5,24,0,0,139,140,3,12,6,0,140,
        141,5,25,0,0,141,145,1,0,0,0,142,145,3,42,21,0,143,145,3,46,23,0,
        144,134,1,0,0,0,144,135,1,0,0,0,144,136,1,0,0,0,144,137,1,0,0,0,
        144,138,1,0,0,0,144,142,1,0,0,0,144,143,1,0,0,0,145,19,1,0,0,0,146,
        147,5,1,0,0,147,148,5,24,0,0,148,152,5,25,0,0,149,152,5,1,0,0,150,
        152,5,2,0,0,151,146,1,0,0,0,151,149,1,0,0,0,151,150,1,0,0,0,152,
        21,1,0,0,0,153,157,3,24,12,0,154,157,3,32,16,0,155,157,3,34,17,0,
        156,153,1,0,0,0,156,154,1,0,0,0,156,155,1,0,0,0,157,23,1,0,0,0,158,
        159,3,26,13,0,159,160,7,3,0,0,160,162,3,28,14,0,161,163,3,30,15,
        0,162,161,1,0,0,0,162,163,1,0,0,0,163,25,1,0,0,0,164,165,5,42,0,
        0,165,27,1,0,0,0,166,167,5,42,0,0,167,29,1,0,0,0,168,169,5,32,0,
        0,169,171,5,42,0,0,170,168,1,0,0,0,171,172,1,0,0,0,172,170,1,0,0,
        0,172,173,1,0,0,0,173,31,1,0,0,0,174,179,5,42,0,0,175,176,5,28,0,
        0,176,177,3,50,25,0,177,178,5,29,0,0,178,180,1,0,0,0,179,175,1,0,
        0,0,179,180,1,0,0,0,180,181,1,0,0,0,181,182,5,34,0,0,182,183,3,50,
        25,0,183,33,1,0,0,0,184,185,5,39,0,0,185,186,5,24,0,0,186,191,5,
        42,0,0,187,188,5,31,0,0,188,190,3,50,25,0,189,187,1,0,0,0,190,193,
        1,0,0,0,191,189,1,0,0,0,191,192,1,0,0,0,192,194,1,0,0,0,193,191,
        1,0,0,0,194,200,5,25,0,0,195,196,5,26,0,0,196,197,3,12,6,0,197,198,
        5,27,0,0,198,200,1,0,0,0,199,184,1,0,0,0,199,195,1,0,0,0,200,35,
        1,0,0,0,201,202,5,28,0,0,202,203,3,50,25,0,203,204,5,29,0,0,204,
        205,5,5,0,0,205,206,3,18,9,0,206,37,1,0,0,0,207,213,5,42,0,0,208,
        210,5,24,0,0,209,211,3,40,20,0,210,209,1,0,0,0,210,211,1,0,0,0,211,
        212,1,0,0,0,212,214,5,25,0,0,213,208,1,0,0,0,213,214,1,0,0,0,214,
        39,1,0,0,0,215,220,3,50,25,0,216,217,5,31,0,0,217,219,3,50,25,0,
        218,216,1,0,0,0,219,222,1,0,0,0,220,218,1,0,0,0,220,221,1,0,0,0,
        221,41,1,0,0,0,222,220,1,0,0,0,223,226,3,44,22,0,224,225,5,7,0,0,
        225,227,3,44,22,0,226,224,1,0,0,0,227,228,1,0,0,0,228,226,1,0,0,
        0,228,229,1,0,0,0,229,43,1,0,0,0,230,240,3,22,11,0,231,240,3,20,
        10,0,232,240,3,36,18,0,233,240,3,38,19,0,234,235,5,24,0,0,235,236,
        3,12,6,0,236,237,5,25,0,0,237,240,1,0,0,0,238,240,3,46,23,0,239,
        230,1,0,0,0,239,231,1,0,0,0,239,232,1,0,0,0,239,233,1,0,0,0,239,
        234,1,0,0,0,239,238,1,0,0,0,240,45,1,0,0,0,241,243,5,26,0,0,242,
        244,3,12,6,0,243,242,1,0,0,0,243,244,1,0,0,0,244,245,1,0,0,0,245,
        246,5,27,0,0,246,47,1,0,0,0,247,248,5,38,0,0,248,249,3,50,25,0,249,
        250,5,30,0,0,250,258,1,0,0,0,251,252,5,38,0,0,252,253,5,24,0,0,253,
        254,3,50,25,0,254,255,5,25,0,0,255,256,5,30,0,0,256,258,1,0,0,0,
        257,247,1,0,0,0,257,251,1,0,0,0,258,49,1,0,0,0,259,260,3,52,26,0,
        260,51,1,0,0,0,261,266,3,54,27,0,262,263,5,6,0,0,263,265,3,54,27,
        0,264,262,1,0,0,0,265,268,1,0,0,0,266,264,1,0,0,0,266,267,1,0,0,
        0,267,53,1,0,0,0,268,266,1,0,0,0,269,274,3,56,28,0,270,271,5,16,
        0,0,271,273,3,56,28,0,272,270,1,0,0,0,273,276,1,0,0,0,274,272,1,
        0,0,0,274,275,1,0,0,0,275,55,1,0,0,0,276,274,1,0,0,0,277,282,3,58,
        29,0,278,279,7,4,0,0,279,281,3,58,29,0,280,278,1,0,0,0,281,284,1,
        0,0,0,282,280,1,0,0,0,282,283,1,0,0,0,283,57,1,0,0,0,284,282,1,0,
        0,0,285,290,3,60,30,0,286,287,7,5,0,0,287,289,3,60,30,0,288,286,
        1,0,0,0,289,292,1,0,0,0,290,288,1,0,0,0,290,291,1,0,0,0,291,59,1,
        0,0,0,292,290,1,0,0,0,293,298,3,62,31,0,294,295,7,6,0,0,295,297,
        3,62,31,0,296,294,1,0,0,0,297,300,1,0,0,0,298,296,1,0,0,0,298,299,
        1,0,0,0,299,61,1,0,0,0,300,298,1,0,0,0,301,302,7,7,0,0,302,305,3,
        62,31,0,303,305,3,64,32,0,304,301,1,0,0,0,304,303,1,0,0,0,305,63,
        1,0,0,0,306,332,5,41,0,0,307,312,5,42,0,0,308,309,5,28,0,0,309,310,
        3,50,25,0,310,311,5,29,0,0,311,313,1,0,0,0,312,308,1,0,0,0,312,313,
        1,0,0,0,313,332,1,0,0,0,314,315,5,42,0,0,315,317,5,24,0,0,316,318,
        3,40,20,0,317,316,1,0,0,0,317,318,1,0,0,0,318,319,1,0,0,0,319,332,
        5,25,0,0,320,321,5,40,0,0,321,322,5,28,0,0,322,323,3,50,25,0,323,
        324,5,29,0,0,324,332,1,0,0,0,325,326,5,24,0,0,326,327,3,50,25,0,
        327,328,5,25,0,0,328,332,1,0,0,0,329,332,5,3,0,0,330,332,5,4,0,0,
        331,306,1,0,0,0,331,307,1,0,0,0,331,314,1,0,0,0,331,320,1,0,0,0,
        331,325,1,0,0,0,331,329,1,0,0,0,331,330,1,0,0,0,332,65,1,0,0,0,32,
        69,78,83,93,101,113,123,131,144,151,156,162,172,179,191,199,210,
        213,220,228,239,243,257,266,274,282,290,298,304,312,317,331
    ]

class PATParser ( Parser ):

    grammarFileName = "PAT.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'Skip'", "'SKIP'", "'true'", "'false'", 
                     "'->'", "<INVALID>", "'[]'", "'!'", "'?'", "'=='", 
                     "'!='", "'<'", "'>'", "'<='", "'>='", "'&&'", "'or'", 
                     "'not'", "'+'", "'-'", "'*'", "'/'", "'%'", "'('", 
                     "')'", "'{'", "'}'", "'['", "']'", "';'", "','", "'.'", 
                     "':'", "'='", "'channel'", "'var'", "'enum'", "'assert'", 
                     "'call'", "'random'" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "ARROW", "PAR_OP", "CHOICE_OP", "SEND", 
                      "RECV", "EQ", "NE", "LT", "GT", "LE", "GE", "AND", 
                      "OR", "NOT", "PLUS", "MINUS", "MULT", "DIV", "MOD", 
                      "LPAREN", "RPAREN", "LBRACE", "RBRACE", "LBRACK", 
                      "RBRACK", "SEMICOLON", "COMMA", "DOT", "COLON", "ASSIGN", 
                      "CHANNEL", "VAR", "ENUM", "ASSERT", "CALL", "RANDOM", 
                      "NUMBER", "IDENT", "LINE_COMMENT", "BLOCK_COMMENT", 
                      "WS" ]

    RULE_spec = 0
    RULE_declaration = 1
    RULE_channelDecl = 2
    RULE_typeDecl = 3
    RULE_processDecl = 4
    RULE_paramList = 5
    RULE_processBody = 6
    RULE_parallelComposition = 7
    RULE_sequentialComposition = 8
    RULE_primaryProcess = 9
    RULE_skipProcess = 10
    RULE_action = 11
    RULE_communicationAction = 12
    RULE_channelName = 13
    RULE_message = 14
    RULE_fieldList = 15
    RULE_assignmentAction = 16
    RULE_internalAction = 17
    RULE_guardedProcess = 18
    RULE_processCall = 19
    RULE_argList = 20
    RULE_choiceProcess = 21
    RULE_primaryBase = 22
    RULE_blockProcess = 23
    RULE_assertDecl = 24
    RULE_expr = 25
    RULE_orExpr = 26
    RULE_andExpr = 27
    RULE_comparisonExpr = 28
    RULE_additiveExpr = 29
    RULE_multiplicativeExpr = 30
    RULE_unaryExpr = 31
    RULE_primaryExpr = 32

    ruleNames =  [ "spec", "declaration", "channelDecl", "typeDecl", "processDecl", 
                   "paramList", "processBody", "parallelComposition", "sequentialComposition", 
                   "primaryProcess", "skipProcess", "action", "communicationAction", 
                   "channelName", "message", "fieldList", "assignmentAction", 
                   "internalAction", "guardedProcess", "processCall", "argList", 
                   "choiceProcess", "primaryBase", "blockProcess", "assertDecl", 
                   "expr", "orExpr", "andExpr", "comparisonExpr", "additiveExpr", 
                   "multiplicativeExpr", "unaryExpr", "primaryExpr" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    T__2=3
    T__3=4
    ARROW=5
    PAR_OP=6
    CHOICE_OP=7
    SEND=8
    RECV=9
    EQ=10
    NE=11
    LT=12
    GT=13
    LE=14
    GE=15
    AND=16
    OR=17
    NOT=18
    PLUS=19
    MINUS=20
    MULT=21
    DIV=22
    MOD=23
    LPAREN=24
    RPAREN=25
    LBRACE=26
    RBRACE=27
    LBRACK=28
    RBRACK=29
    SEMICOLON=30
    COMMA=31
    DOT=32
    COLON=33
    ASSIGN=34
    CHANNEL=35
    VAR=36
    ENUM=37
    ASSERT=38
    CALL=39
    RANDOM=40
    NUMBER=41
    IDENT=42
    LINE_COMMENT=43
    BLOCK_COMMENT=44
    WS=45

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.13.1")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class SpecContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def EOF(self):
            return self.getToken(PATParser.EOF, 0)

        def declaration(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.DeclarationContext)
            else:
                return self.getTypedRuleContext(PATParser.DeclarationContext,i)


        def getRuleIndex(self):
            return PATParser.RULE_spec

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterSpec" ):
                listener.enterSpec(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitSpec" ):
                listener.exitSpec(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitSpec" ):
                return visitor.visitSpec(self)
            else:
                return visitor.visitChildren(self)




    def spec(self):

        localctx = PATParser.SpecContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_spec)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 69
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 4913442586624) != 0):
                self.state = 66
                self.declaration()
                self.state = 71
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 72
            self.match(PATParser.EOF)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class DeclarationContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def channelDecl(self):
            return self.getTypedRuleContext(PATParser.ChannelDeclContext,0)


        def processDecl(self):
            return self.getTypedRuleContext(PATParser.ProcessDeclContext,0)


        def typeDecl(self):
            return self.getTypedRuleContext(PATParser.TypeDeclContext,0)


        def assertDecl(self):
            return self.getTypedRuleContext(PATParser.AssertDeclContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_declaration

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterDeclaration" ):
                listener.enterDeclaration(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitDeclaration" ):
                listener.exitDeclaration(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitDeclaration" ):
                return visitor.visitDeclaration(self)
            else:
                return visitor.visitChildren(self)




    def declaration(self):

        localctx = PATParser.DeclarationContext(self, self._ctx, self.state)
        self.enterRule(localctx, 2, self.RULE_declaration)
        try:
            self.state = 78
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [35]:
                self.enterOuterAlt(localctx, 1)
                self.state = 74
                self.channelDecl()
                pass
            elif token in [42]:
                self.enterOuterAlt(localctx, 2)
                self.state = 75
                self.processDecl()
                pass
            elif token in [36, 37]:
                self.enterOuterAlt(localctx, 3)
                self.state = 76
                self.typeDecl()
                pass
            elif token in [38]:
                self.enterOuterAlt(localctx, 4)
                self.state = 77
                self.assertDecl()
                pass
            else:
                raise NoViableAltException(self)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ChannelDeclContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def CHANNEL(self):
            return self.getToken(PATParser.CHANNEL, 0)

        def IDENT(self):
            return self.getToken(PATParser.IDENT, 0)

        def SEMICOLON(self):
            return self.getToken(PATParser.SEMICOLON, 0)

        def NUMBER(self):
            return self.getToken(PATParser.NUMBER, 0)

        def getRuleIndex(self):
            return PATParser.RULE_channelDecl

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterChannelDecl" ):
                listener.enterChannelDecl(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitChannelDecl" ):
                listener.exitChannelDecl(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitChannelDecl" ):
                return visitor.visitChannelDecl(self)
            else:
                return visitor.visitChildren(self)




    def channelDecl(self):

        localctx = PATParser.ChannelDeclContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_channelDecl)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 80
            self.match(PATParser.CHANNEL)
            self.state = 81
            self.match(PATParser.IDENT)
            self.state = 83
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==41:
                self.state = 82
                self.match(PATParser.NUMBER)


            self.state = 85
            self.match(PATParser.SEMICOLON)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class TypeDeclContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENT(self):
            return self.getToken(PATParser.IDENT, 0)

        def VAR(self):
            return self.getToken(PATParser.VAR, 0)

        def ENUM(self):
            return self.getToken(PATParser.ENUM, 0)

        def ASSIGN(self):
            return self.getToken(PATParser.ASSIGN, 0)

        def LBRACE(self):
            return self.getToken(PATParser.LBRACE, 0)

        def SEMICOLON(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.SEMICOLON)
            else:
                return self.getToken(PATParser.SEMICOLON, i)

        def RBRACE(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.RBRACE)
            else:
                return self.getToken(PATParser.RBRACE, i)

        def getRuleIndex(self):
            return PATParser.RULE_typeDecl

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTypeDecl" ):
                listener.enterTypeDecl(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTypeDecl" ):
                listener.exitTypeDecl(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitTypeDecl" ):
                return visitor.visitTypeDecl(self)
            else:
                return visitor.visitChildren(self)




    def typeDecl(self):

        localctx = PATParser.TypeDeclContext(self, self._ctx, self.state)
        self.enterRule(localctx, 6, self.RULE_typeDecl)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 87
            _la = self._input.LA(1)
            if not(_la==36 or _la==37):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 88
            self.match(PATParser.IDENT)
            self.state = 89
            _la = self._input.LA(1)
            if not(_la==26 or _la==34):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 93
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 70367536218110) != 0):
                self.state = 90
                _la = self._input.LA(1)
                if _la <= 0 or _la==27 or _la==30:
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 95
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 96
            _la = self._input.LA(1)
            if not(_la==27 or _la==30):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ProcessDeclContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENT(self):
            return self.getToken(PATParser.IDENT, 0)

        def LPAREN(self):
            return self.getToken(PATParser.LPAREN, 0)

        def RPAREN(self):
            return self.getToken(PATParser.RPAREN, 0)

        def ASSIGN(self):
            return self.getToken(PATParser.ASSIGN, 0)

        def processBody(self):
            return self.getTypedRuleContext(PATParser.ProcessBodyContext,0)


        def SEMICOLON(self):
            return self.getToken(PATParser.SEMICOLON, 0)

        def paramList(self):
            return self.getTypedRuleContext(PATParser.ParamListContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_processDecl

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterProcessDecl" ):
                listener.enterProcessDecl(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitProcessDecl" ):
                listener.exitProcessDecl(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitProcessDecl" ):
                return visitor.visitProcessDecl(self)
            else:
                return visitor.visitChildren(self)




    def processDecl(self):

        localctx = PATParser.ProcessDeclContext(self, self._ctx, self.state)
        self.enterRule(localctx, 8, self.RULE_processDecl)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 98
            self.match(PATParser.IDENT)
            self.state = 99
            self.match(PATParser.LPAREN)
            self.state = 101
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==42:
                self.state = 100
                self.paramList()


            self.state = 103
            self.match(PATParser.RPAREN)
            self.state = 104
            self.match(PATParser.ASSIGN)
            self.state = 105
            self.processBody()
            self.state = 106
            self.match(PATParser.SEMICOLON)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ParamListContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENT(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.IDENT)
            else:
                return self.getToken(PATParser.IDENT, i)

        def COMMA(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.COMMA)
            else:
                return self.getToken(PATParser.COMMA, i)

        def getRuleIndex(self):
            return PATParser.RULE_paramList

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterParamList" ):
                listener.enterParamList(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitParamList" ):
                listener.exitParamList(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitParamList" ):
                return visitor.visitParamList(self)
            else:
                return visitor.visitChildren(self)




    def paramList(self):

        localctx = PATParser.ParamListContext(self, self._ctx, self.state)
        self.enterRule(localctx, 10, self.RULE_paramList)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 108
            self.match(PATParser.IDENT)
            self.state = 113
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==31:
                self.state = 109
                self.match(PATParser.COMMA)
                self.state = 110
                self.match(PATParser.IDENT)
                self.state = 115
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ProcessBodyContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def parallelComposition(self):
            return self.getTypedRuleContext(PATParser.ParallelCompositionContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_processBody

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterProcessBody" ):
                listener.enterProcessBody(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitProcessBody" ):
                listener.exitProcessBody(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitProcessBody" ):
                return visitor.visitProcessBody(self)
            else:
                return visitor.visitChildren(self)




    def processBody(self):

        localctx = PATParser.ProcessBodyContext(self, self._ctx, self.state)
        self.enterRule(localctx, 12, self.RULE_processBody)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 116
            self.parallelComposition()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ParallelCompositionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def sequentialComposition(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.SequentialCompositionContext)
            else:
                return self.getTypedRuleContext(PATParser.SequentialCompositionContext,i)


        def PAR_OP(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.PAR_OP)
            else:
                return self.getToken(PATParser.PAR_OP, i)

        def getRuleIndex(self):
            return PATParser.RULE_parallelComposition

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterParallelComposition" ):
                listener.enterParallelComposition(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitParallelComposition" ):
                listener.exitParallelComposition(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitParallelComposition" ):
                return visitor.visitParallelComposition(self)
            else:
                return visitor.visitChildren(self)




    def parallelComposition(self):

        localctx = PATParser.ParallelCompositionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 14, self.RULE_parallelComposition)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 118
            self.sequentialComposition()
            self.state = 123
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==6:
                self.state = 119
                self.match(PATParser.PAR_OP)
                self.state = 120
                self.sequentialComposition()
                self.state = 125
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class SequentialCompositionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def primaryProcess(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.PrimaryProcessContext)
            else:
                return self.getTypedRuleContext(PATParser.PrimaryProcessContext,i)


        def ARROW(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.ARROW)
            else:
                return self.getToken(PATParser.ARROW, i)

        def getRuleIndex(self):
            return PATParser.RULE_sequentialComposition

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterSequentialComposition" ):
                listener.enterSequentialComposition(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitSequentialComposition" ):
                listener.exitSequentialComposition(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitSequentialComposition" ):
                return visitor.visitSequentialComposition(self)
            else:
                return visitor.visitChildren(self)




    def sequentialComposition(self):

        localctx = PATParser.SequentialCompositionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 16, self.RULE_sequentialComposition)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 126
            self.primaryProcess()
            self.state = 131
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==5:
                self.state = 127
                self.match(PATParser.ARROW)
                self.state = 128
                self.primaryProcess()
                self.state = 133
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class PrimaryProcessContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def action(self):
            return self.getTypedRuleContext(PATParser.ActionContext,0)


        def skipProcess(self):
            return self.getTypedRuleContext(PATParser.SkipProcessContext,0)


        def guardedProcess(self):
            return self.getTypedRuleContext(PATParser.GuardedProcessContext,0)


        def processCall(self):
            return self.getTypedRuleContext(PATParser.ProcessCallContext,0)


        def LPAREN(self):
            return self.getToken(PATParser.LPAREN, 0)

        def processBody(self):
            return self.getTypedRuleContext(PATParser.ProcessBodyContext,0)


        def RPAREN(self):
            return self.getToken(PATParser.RPAREN, 0)

        def choiceProcess(self):
            return self.getTypedRuleContext(PATParser.ChoiceProcessContext,0)


        def blockProcess(self):
            return self.getTypedRuleContext(PATParser.BlockProcessContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_primaryProcess

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterPrimaryProcess" ):
                listener.enterPrimaryProcess(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitPrimaryProcess" ):
                listener.exitPrimaryProcess(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitPrimaryProcess" ):
                return visitor.visitPrimaryProcess(self)
            else:
                return visitor.visitChildren(self)




    def primaryProcess(self):

        localctx = PATParser.PrimaryProcessContext(self, self._ctx, self.state)
        self.enterRule(localctx, 18, self.RULE_primaryProcess)
        try:
            self.state = 144
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,8,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 134
                self.action()
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 135
                self.skipProcess()
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 136
                self.guardedProcess()
                pass

            elif la_ == 4:
                self.enterOuterAlt(localctx, 4)
                self.state = 137
                self.processCall()
                pass

            elif la_ == 5:
                self.enterOuterAlt(localctx, 5)
                self.state = 138
                self.match(PATParser.LPAREN)
                self.state = 139
                self.processBody()
                self.state = 140
                self.match(PATParser.RPAREN)
                pass

            elif la_ == 6:
                self.enterOuterAlt(localctx, 6)
                self.state = 142
                self.choiceProcess()
                pass

            elif la_ == 7:
                self.enterOuterAlt(localctx, 7)
                self.state = 143
                self.blockProcess()
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class SkipProcessContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def LPAREN(self):
            return self.getToken(PATParser.LPAREN, 0)

        def RPAREN(self):
            return self.getToken(PATParser.RPAREN, 0)

        def getRuleIndex(self):
            return PATParser.RULE_skipProcess

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterSkipProcess" ):
                listener.enterSkipProcess(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitSkipProcess" ):
                listener.exitSkipProcess(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitSkipProcess" ):
                return visitor.visitSkipProcess(self)
            else:
                return visitor.visitChildren(self)




    def skipProcess(self):

        localctx = PATParser.SkipProcessContext(self, self._ctx, self.state)
        self.enterRule(localctx, 20, self.RULE_skipProcess)
        try:
            self.state = 151
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,9,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 146
                self.match(PATParser.T__0)
                self.state = 147
                self.match(PATParser.LPAREN)
                self.state = 148
                self.match(PATParser.RPAREN)
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 149
                self.match(PATParser.T__0)
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 150
                self.match(PATParser.T__1)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ActionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def communicationAction(self):
            return self.getTypedRuleContext(PATParser.CommunicationActionContext,0)


        def assignmentAction(self):
            return self.getTypedRuleContext(PATParser.AssignmentActionContext,0)


        def internalAction(self):
            return self.getTypedRuleContext(PATParser.InternalActionContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_action

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAction" ):
                listener.enterAction(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAction" ):
                listener.exitAction(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitAction" ):
                return visitor.visitAction(self)
            else:
                return visitor.visitChildren(self)




    def action(self):

        localctx = PATParser.ActionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 22, self.RULE_action)
        try:
            self.state = 156
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,10,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 153
                self.communicationAction()
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 154
                self.assignmentAction()
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 155
                self.internalAction()
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class CommunicationActionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def channelName(self):
            return self.getTypedRuleContext(PATParser.ChannelNameContext,0)


        def message(self):
            return self.getTypedRuleContext(PATParser.MessageContext,0)


        def SEND(self):
            return self.getToken(PATParser.SEND, 0)

        def RECV(self):
            return self.getToken(PATParser.RECV, 0)

        def fieldList(self):
            return self.getTypedRuleContext(PATParser.FieldListContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_communicationAction

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterCommunicationAction" ):
                listener.enterCommunicationAction(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitCommunicationAction" ):
                listener.exitCommunicationAction(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitCommunicationAction" ):
                return visitor.visitCommunicationAction(self)
            else:
                return visitor.visitChildren(self)




    def communicationAction(self):

        localctx = PATParser.CommunicationActionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 24, self.RULE_communicationAction)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 158
            self.channelName()
            self.state = 159
            _la = self._input.LA(1)
            if not(_la==8 or _la==9):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 160
            self.message()
            self.state = 162
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==32:
                self.state = 161
                self.fieldList()


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ChannelNameContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENT(self):
            return self.getToken(PATParser.IDENT, 0)

        def getRuleIndex(self):
            return PATParser.RULE_channelName

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterChannelName" ):
                listener.enterChannelName(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitChannelName" ):
                listener.exitChannelName(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitChannelName" ):
                return visitor.visitChannelName(self)
            else:
                return visitor.visitChildren(self)




    def channelName(self):

        localctx = PATParser.ChannelNameContext(self, self._ctx, self.state)
        self.enterRule(localctx, 26, self.RULE_channelName)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 164
            self.match(PATParser.IDENT)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class MessageContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENT(self):
            return self.getToken(PATParser.IDENT, 0)

        def getRuleIndex(self):
            return PATParser.RULE_message

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterMessage" ):
                listener.enterMessage(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitMessage" ):
                listener.exitMessage(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitMessage" ):
                return visitor.visitMessage(self)
            else:
                return visitor.visitChildren(self)




    def message(self):

        localctx = PATParser.MessageContext(self, self._ctx, self.state)
        self.enterRule(localctx, 28, self.RULE_message)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 166
            self.match(PATParser.IDENT)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class FieldListContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def DOT(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.DOT)
            else:
                return self.getToken(PATParser.DOT, i)

        def IDENT(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.IDENT)
            else:
                return self.getToken(PATParser.IDENT, i)

        def getRuleIndex(self):
            return PATParser.RULE_fieldList

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFieldList" ):
                listener.enterFieldList(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFieldList" ):
                listener.exitFieldList(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitFieldList" ):
                return visitor.visitFieldList(self)
            else:
                return visitor.visitChildren(self)




    def fieldList(self):

        localctx = PATParser.FieldListContext(self, self._ctx, self.state)
        self.enterRule(localctx, 30, self.RULE_fieldList)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 170 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 168
                self.match(PATParser.DOT)
                self.state = 169
                self.match(PATParser.IDENT)
                self.state = 172 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if not (_la==32):
                    break

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class AssignmentActionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENT(self):
            return self.getToken(PATParser.IDENT, 0)

        def ASSIGN(self):
            return self.getToken(PATParser.ASSIGN, 0)

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.ExprContext)
            else:
                return self.getTypedRuleContext(PATParser.ExprContext,i)


        def LBRACK(self):
            return self.getToken(PATParser.LBRACK, 0)

        def RBRACK(self):
            return self.getToken(PATParser.RBRACK, 0)

        def getRuleIndex(self):
            return PATParser.RULE_assignmentAction

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAssignmentAction" ):
                listener.enterAssignmentAction(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAssignmentAction" ):
                listener.exitAssignmentAction(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitAssignmentAction" ):
                return visitor.visitAssignmentAction(self)
            else:
                return visitor.visitChildren(self)




    def assignmentAction(self):

        localctx = PATParser.AssignmentActionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 32, self.RULE_assignmentAction)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 174
            self.match(PATParser.IDENT)
            self.state = 179
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==28:
                self.state = 175
                self.match(PATParser.LBRACK)
                self.state = 176
                self.expr()
                self.state = 177
                self.match(PATParser.RBRACK)


            self.state = 181
            self.match(PATParser.ASSIGN)
            self.state = 182
            self.expr()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class InternalActionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def CALL(self):
            return self.getToken(PATParser.CALL, 0)

        def LPAREN(self):
            return self.getToken(PATParser.LPAREN, 0)

        def IDENT(self):
            return self.getToken(PATParser.IDENT, 0)

        def RPAREN(self):
            return self.getToken(PATParser.RPAREN, 0)

        def COMMA(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.COMMA)
            else:
                return self.getToken(PATParser.COMMA, i)

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.ExprContext)
            else:
                return self.getTypedRuleContext(PATParser.ExprContext,i)


        def LBRACE(self):
            return self.getToken(PATParser.LBRACE, 0)

        def processBody(self):
            return self.getTypedRuleContext(PATParser.ProcessBodyContext,0)


        def RBRACE(self):
            return self.getToken(PATParser.RBRACE, 0)

        def getRuleIndex(self):
            return PATParser.RULE_internalAction

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterInternalAction" ):
                listener.enterInternalAction(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitInternalAction" ):
                listener.exitInternalAction(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitInternalAction" ):
                return visitor.visitInternalAction(self)
            else:
                return visitor.visitChildren(self)




    def internalAction(self):

        localctx = PATParser.InternalActionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 34, self.RULE_internalAction)
        self._la = 0 # Token type
        try:
            self.state = 199
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [39]:
                self.enterOuterAlt(localctx, 1)
                self.state = 184
                self.match(PATParser.CALL)
                self.state = 185
                self.match(PATParser.LPAREN)
                self.state = 186
                self.match(PATParser.IDENT)
                self.state = 191
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                while _la==31:
                    self.state = 187
                    self.match(PATParser.COMMA)
                    self.state = 188
                    self.expr()
                    self.state = 193
                    self._errHandler.sync(self)
                    _la = self._input.LA(1)

                self.state = 194
                self.match(PATParser.RPAREN)
                pass
            elif token in [26]:
                self.enterOuterAlt(localctx, 2)
                self.state = 195
                self.match(PATParser.LBRACE)
                self.state = 196
                self.processBody()
                self.state = 197
                self.match(PATParser.RBRACE)
                pass
            else:
                raise NoViableAltException(self)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class GuardedProcessContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def LBRACK(self):
            return self.getToken(PATParser.LBRACK, 0)

        def expr(self):
            return self.getTypedRuleContext(PATParser.ExprContext,0)


        def RBRACK(self):
            return self.getToken(PATParser.RBRACK, 0)

        def ARROW(self):
            return self.getToken(PATParser.ARROW, 0)

        def primaryProcess(self):
            return self.getTypedRuleContext(PATParser.PrimaryProcessContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_guardedProcess

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterGuardedProcess" ):
                listener.enterGuardedProcess(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitGuardedProcess" ):
                listener.exitGuardedProcess(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitGuardedProcess" ):
                return visitor.visitGuardedProcess(self)
            else:
                return visitor.visitChildren(self)




    def guardedProcess(self):

        localctx = PATParser.GuardedProcessContext(self, self._ctx, self.state)
        self.enterRule(localctx, 36, self.RULE_guardedProcess)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 201
            self.match(PATParser.LBRACK)
            self.state = 202
            self.expr()
            self.state = 203
            self.match(PATParser.RBRACK)
            self.state = 204
            self.match(PATParser.ARROW)
            self.state = 205
            self.primaryProcess()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ProcessCallContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENT(self):
            return self.getToken(PATParser.IDENT, 0)

        def LPAREN(self):
            return self.getToken(PATParser.LPAREN, 0)

        def RPAREN(self):
            return self.getToken(PATParser.RPAREN, 0)

        def argList(self):
            return self.getTypedRuleContext(PATParser.ArgListContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_processCall

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterProcessCall" ):
                listener.enterProcessCall(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitProcessCall" ):
                listener.exitProcessCall(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitProcessCall" ):
                return visitor.visitProcessCall(self)
            else:
                return visitor.visitChildren(self)




    def processCall(self):

        localctx = PATParser.ProcessCallContext(self, self._ctx, self.state)
        self.enterRule(localctx, 38, self.RULE_processCall)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 207
            self.match(PATParser.IDENT)
            self.state = 213
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==24:
                self.state = 208
                self.match(PATParser.LPAREN)
                self.state = 210
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if (((_la) & ~0x3f) == 0 and ((1 << _la) & 7696599482392) != 0):
                    self.state = 209
                    self.argList()


                self.state = 212
                self.match(PATParser.RPAREN)


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ArgListContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.ExprContext)
            else:
                return self.getTypedRuleContext(PATParser.ExprContext,i)


        def COMMA(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.COMMA)
            else:
                return self.getToken(PATParser.COMMA, i)

        def getRuleIndex(self):
            return PATParser.RULE_argList

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterArgList" ):
                listener.enterArgList(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitArgList" ):
                listener.exitArgList(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitArgList" ):
                return visitor.visitArgList(self)
            else:
                return visitor.visitChildren(self)




    def argList(self):

        localctx = PATParser.ArgListContext(self, self._ctx, self.state)
        self.enterRule(localctx, 40, self.RULE_argList)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 215
            self.expr()
            self.state = 220
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==31:
                self.state = 216
                self.match(PATParser.COMMA)
                self.state = 217
                self.expr()
                self.state = 222
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ChoiceProcessContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def primaryBase(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.PrimaryBaseContext)
            else:
                return self.getTypedRuleContext(PATParser.PrimaryBaseContext,i)


        def CHOICE_OP(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.CHOICE_OP)
            else:
                return self.getToken(PATParser.CHOICE_OP, i)

        def getRuleIndex(self):
            return PATParser.RULE_choiceProcess

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterChoiceProcess" ):
                listener.enterChoiceProcess(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitChoiceProcess" ):
                listener.exitChoiceProcess(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitChoiceProcess" ):
                return visitor.visitChoiceProcess(self)
            else:
                return visitor.visitChildren(self)




    def choiceProcess(self):

        localctx = PATParser.ChoiceProcessContext(self, self._ctx, self.state)
        self.enterRule(localctx, 42, self.RULE_choiceProcess)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 223
            self.primaryBase()
            self.state = 226 
            self._errHandler.sync(self)
            _alt = 1
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt == 1:
                    self.state = 224
                    self.match(PATParser.CHOICE_OP)
                    self.state = 225
                    self.primaryBase()

                else:
                    raise NoViableAltException(self)
                self.state = 228 
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,19,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class PrimaryBaseContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def action(self):
            return self.getTypedRuleContext(PATParser.ActionContext,0)


        def skipProcess(self):
            return self.getTypedRuleContext(PATParser.SkipProcessContext,0)


        def guardedProcess(self):
            return self.getTypedRuleContext(PATParser.GuardedProcessContext,0)


        def processCall(self):
            return self.getTypedRuleContext(PATParser.ProcessCallContext,0)


        def LPAREN(self):
            return self.getToken(PATParser.LPAREN, 0)

        def processBody(self):
            return self.getTypedRuleContext(PATParser.ProcessBodyContext,0)


        def RPAREN(self):
            return self.getToken(PATParser.RPAREN, 0)

        def blockProcess(self):
            return self.getTypedRuleContext(PATParser.BlockProcessContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_primaryBase

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterPrimaryBase" ):
                listener.enterPrimaryBase(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitPrimaryBase" ):
                listener.exitPrimaryBase(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitPrimaryBase" ):
                return visitor.visitPrimaryBase(self)
            else:
                return visitor.visitChildren(self)




    def primaryBase(self):

        localctx = PATParser.PrimaryBaseContext(self, self._ctx, self.state)
        self.enterRule(localctx, 44, self.RULE_primaryBase)
        try:
            self.state = 239
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,20,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 230
                self.action()
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 231
                self.skipProcess()
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 232
                self.guardedProcess()
                pass

            elif la_ == 4:
                self.enterOuterAlt(localctx, 4)
                self.state = 233
                self.processCall()
                pass

            elif la_ == 5:
                self.enterOuterAlt(localctx, 5)
                self.state = 234
                self.match(PATParser.LPAREN)
                self.state = 235
                self.processBody()
                self.state = 236
                self.match(PATParser.RPAREN)
                pass

            elif la_ == 6:
                self.enterOuterAlt(localctx, 6)
                self.state = 238
                self.blockProcess()
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class BlockProcessContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def LBRACE(self):
            return self.getToken(PATParser.LBRACE, 0)

        def RBRACE(self):
            return self.getToken(PATParser.RBRACE, 0)

        def processBody(self):
            return self.getTypedRuleContext(PATParser.ProcessBodyContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_blockProcess

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterBlockProcess" ):
                listener.enterBlockProcess(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitBlockProcess" ):
                listener.exitBlockProcess(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitBlockProcess" ):
                return visitor.visitBlockProcess(self)
            else:
                return visitor.visitChildren(self)




    def blockProcess(self):

        localctx = PATParser.BlockProcessContext(self, self._ctx, self.state)
        self.enterRule(localctx, 46, self.RULE_blockProcess)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 241
            self.match(PATParser.LBRACE)
            self.state = 243
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if (((_la) & ~0x3f) == 0 and ((1 << _la) & 4948154646534) != 0):
                self.state = 242
                self.processBody()


            self.state = 245
            self.match(PATParser.RBRACE)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class AssertDeclContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def ASSERT(self):
            return self.getToken(PATParser.ASSERT, 0)

        def expr(self):
            return self.getTypedRuleContext(PATParser.ExprContext,0)


        def SEMICOLON(self):
            return self.getToken(PATParser.SEMICOLON, 0)

        def LPAREN(self):
            return self.getToken(PATParser.LPAREN, 0)

        def RPAREN(self):
            return self.getToken(PATParser.RPAREN, 0)

        def getRuleIndex(self):
            return PATParser.RULE_assertDecl

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAssertDecl" ):
                listener.enterAssertDecl(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAssertDecl" ):
                listener.exitAssertDecl(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitAssertDecl" ):
                return visitor.visitAssertDecl(self)
            else:
                return visitor.visitChildren(self)




    def assertDecl(self):

        localctx = PATParser.AssertDeclContext(self, self._ctx, self.state)
        self.enterRule(localctx, 48, self.RULE_assertDecl)
        try:
            self.state = 257
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,22,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 247
                self.match(PATParser.ASSERT)
                self.state = 248
                self.expr()
                self.state = 249
                self.match(PATParser.SEMICOLON)
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 251
                self.match(PATParser.ASSERT)
                self.state = 252
                self.match(PATParser.LPAREN)
                self.state = 253
                self.expr()
                self.state = 254
                self.match(PATParser.RPAREN)
                self.state = 255
                self.match(PATParser.SEMICOLON)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def orExpr(self):
            return self.getTypedRuleContext(PATParser.OrExprContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_expr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterExpr" ):
                listener.enterExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitExpr" ):
                listener.exitExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitExpr" ):
                return visitor.visitExpr(self)
            else:
                return visitor.visitChildren(self)




    def expr(self):

        localctx = PATParser.ExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 50, self.RULE_expr)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 259
            self.orExpr()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class OrExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def andExpr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.AndExprContext)
            else:
                return self.getTypedRuleContext(PATParser.AndExprContext,i)


        def PAR_OP(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.PAR_OP)
            else:
                return self.getToken(PATParser.PAR_OP, i)

        def getRuleIndex(self):
            return PATParser.RULE_orExpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterOrExpr" ):
                listener.enterOrExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitOrExpr" ):
                listener.exitOrExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitOrExpr" ):
                return visitor.visitOrExpr(self)
            else:
                return visitor.visitChildren(self)




    def orExpr(self):

        localctx = PATParser.OrExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 52, self.RULE_orExpr)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 261
            self.andExpr()
            self.state = 266
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,23,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 262
                    self.match(PATParser.PAR_OP)
                    self.state = 263
                    self.andExpr() 
                self.state = 268
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,23,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class AndExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def comparisonExpr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.ComparisonExprContext)
            else:
                return self.getTypedRuleContext(PATParser.ComparisonExprContext,i)


        def AND(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.AND)
            else:
                return self.getToken(PATParser.AND, i)

        def getRuleIndex(self):
            return PATParser.RULE_andExpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAndExpr" ):
                listener.enterAndExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAndExpr" ):
                listener.exitAndExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitAndExpr" ):
                return visitor.visitAndExpr(self)
            else:
                return visitor.visitChildren(self)




    def andExpr(self):

        localctx = PATParser.AndExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 54, self.RULE_andExpr)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 269
            self.comparisonExpr()
            self.state = 274
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==16:
                self.state = 270
                self.match(PATParser.AND)
                self.state = 271
                self.comparisonExpr()
                self.state = 276
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ComparisonExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def additiveExpr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.AdditiveExprContext)
            else:
                return self.getTypedRuleContext(PATParser.AdditiveExprContext,i)


        def EQ(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.EQ)
            else:
                return self.getToken(PATParser.EQ, i)

        def NE(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.NE)
            else:
                return self.getToken(PATParser.NE, i)

        def LT(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.LT)
            else:
                return self.getToken(PATParser.LT, i)

        def GT(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.GT)
            else:
                return self.getToken(PATParser.GT, i)

        def LE(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.LE)
            else:
                return self.getToken(PATParser.LE, i)

        def GE(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.GE)
            else:
                return self.getToken(PATParser.GE, i)

        def getRuleIndex(self):
            return PATParser.RULE_comparisonExpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterComparisonExpr" ):
                listener.enterComparisonExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitComparisonExpr" ):
                listener.exitComparisonExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitComparisonExpr" ):
                return visitor.visitComparisonExpr(self)
            else:
                return visitor.visitChildren(self)




    def comparisonExpr(self):

        localctx = PATParser.ComparisonExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 56, self.RULE_comparisonExpr)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 277
            self.additiveExpr()
            self.state = 282
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 64512) != 0):
                self.state = 278
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 64512) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 279
                self.additiveExpr()
                self.state = 284
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class AdditiveExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def multiplicativeExpr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.MultiplicativeExprContext)
            else:
                return self.getTypedRuleContext(PATParser.MultiplicativeExprContext,i)


        def PLUS(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.PLUS)
            else:
                return self.getToken(PATParser.PLUS, i)

        def MINUS(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.MINUS)
            else:
                return self.getToken(PATParser.MINUS, i)

        def getRuleIndex(self):
            return PATParser.RULE_additiveExpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAdditiveExpr" ):
                listener.enterAdditiveExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAdditiveExpr" ):
                listener.exitAdditiveExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitAdditiveExpr" ):
                return visitor.visitAdditiveExpr(self)
            else:
                return visitor.visitChildren(self)




    def additiveExpr(self):

        localctx = PATParser.AdditiveExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 58, self.RULE_additiveExpr)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 285
            self.multiplicativeExpr()
            self.state = 290
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==19 or _la==20:
                self.state = 286
                _la = self._input.LA(1)
                if not(_la==19 or _la==20):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 287
                self.multiplicativeExpr()
                self.state = 292
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class MultiplicativeExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def unaryExpr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(PATParser.UnaryExprContext)
            else:
                return self.getTypedRuleContext(PATParser.UnaryExprContext,i)


        def MULT(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.MULT)
            else:
                return self.getToken(PATParser.MULT, i)

        def DIV(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.DIV)
            else:
                return self.getToken(PATParser.DIV, i)

        def MOD(self, i:int=None):
            if i is None:
                return self.getTokens(PATParser.MOD)
            else:
                return self.getToken(PATParser.MOD, i)

        def getRuleIndex(self):
            return PATParser.RULE_multiplicativeExpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterMultiplicativeExpr" ):
                listener.enterMultiplicativeExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitMultiplicativeExpr" ):
                listener.exitMultiplicativeExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitMultiplicativeExpr" ):
                return visitor.visitMultiplicativeExpr(self)
            else:
                return visitor.visitChildren(self)




    def multiplicativeExpr(self):

        localctx = PATParser.MultiplicativeExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 60, self.RULE_multiplicativeExpr)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 293
            self.unaryExpr()
            self.state = 298
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 14680064) != 0):
                self.state = 294
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 14680064) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 295
                self.unaryExpr()
                self.state = 300
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class UnaryExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def unaryExpr(self):
            return self.getTypedRuleContext(PATParser.UnaryExprContext,0)


        def NOT(self):
            return self.getToken(PATParser.NOT, 0)

        def MINUS(self):
            return self.getToken(PATParser.MINUS, 0)

        def primaryExpr(self):
            return self.getTypedRuleContext(PATParser.PrimaryExprContext,0)


        def getRuleIndex(self):
            return PATParser.RULE_unaryExpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterUnaryExpr" ):
                listener.enterUnaryExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitUnaryExpr" ):
                listener.exitUnaryExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitUnaryExpr" ):
                return visitor.visitUnaryExpr(self)
            else:
                return visitor.visitChildren(self)




    def unaryExpr(self):

        localctx = PATParser.UnaryExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 62, self.RULE_unaryExpr)
        self._la = 0 # Token type
        try:
            self.state = 304
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [18, 20]:
                self.enterOuterAlt(localctx, 1)
                self.state = 301
                _la = self._input.LA(1)
                if not(_la==18 or _la==20):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 302
                self.unaryExpr()
                pass
            elif token in [3, 4, 24, 40, 41, 42]:
                self.enterOuterAlt(localctx, 2)
                self.state = 303
                self.primaryExpr()
                pass
            else:
                raise NoViableAltException(self)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class PrimaryExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def NUMBER(self):
            return self.getToken(PATParser.NUMBER, 0)

        def IDENT(self):
            return self.getToken(PATParser.IDENT, 0)

        def LBRACK(self):
            return self.getToken(PATParser.LBRACK, 0)

        def expr(self):
            return self.getTypedRuleContext(PATParser.ExprContext,0)


        def RBRACK(self):
            return self.getToken(PATParser.RBRACK, 0)

        def LPAREN(self):
            return self.getToken(PATParser.LPAREN, 0)

        def RPAREN(self):
            return self.getToken(PATParser.RPAREN, 0)

        def argList(self):
            return self.getTypedRuleContext(PATParser.ArgListContext,0)


        def RANDOM(self):
            return self.getToken(PATParser.RANDOM, 0)

        def getRuleIndex(self):
            return PATParser.RULE_primaryExpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterPrimaryExpr" ):
                listener.enterPrimaryExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitPrimaryExpr" ):
                listener.exitPrimaryExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitPrimaryExpr" ):
                return visitor.visitPrimaryExpr(self)
            else:
                return visitor.visitChildren(self)




    def primaryExpr(self):

        localctx = PATParser.PrimaryExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 64, self.RULE_primaryExpr)
        self._la = 0 # Token type
        try:
            self.state = 331
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,31,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 306
                self.match(PATParser.NUMBER)
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 307
                self.match(PATParser.IDENT)
                self.state = 312
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if _la==28:
                    self.state = 308
                    self.match(PATParser.LBRACK)
                    self.state = 309
                    self.expr()
                    self.state = 310
                    self.match(PATParser.RBRACK)


                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 314
                self.match(PATParser.IDENT)
                self.state = 315
                self.match(PATParser.LPAREN)
                self.state = 317
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if (((_la) & ~0x3f) == 0 and ((1 << _la) & 7696599482392) != 0):
                    self.state = 316
                    self.argList()


                self.state = 319
                self.match(PATParser.RPAREN)
                pass

            elif la_ == 4:
                self.enterOuterAlt(localctx, 4)
                self.state = 320
                self.match(PATParser.RANDOM)
                self.state = 321
                self.match(PATParser.LBRACK)
                self.state = 322
                self.expr()
                self.state = 323
                self.match(PATParser.RBRACK)
                pass

            elif la_ == 5:
                self.enterOuterAlt(localctx, 5)
                self.state = 325
                self.match(PATParser.LPAREN)
                self.state = 326
                self.expr()
                self.state = 327
                self.match(PATParser.RPAREN)
                pass

            elif la_ == 6:
                self.enterOuterAlt(localctx, 6)
                self.state = 329
                self.match(PATParser.T__2)
                pass

            elif la_ == 7:
                self.enterOuterAlt(localctx, 7)
                self.state = 330
                self.match(PATParser.T__3)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





