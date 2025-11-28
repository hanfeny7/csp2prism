grammar PAT;

// ===================================================================
// PAT (Process Algebra Toolkit) Grammar - Extended Version
// Supports: sequential composition, parallel composition, recursion,
// message passing, guards, if-then-else, code blocks, and complex structures
// ===================================================================

// ===== Top-level specification =====
spec: declaration* EOF ;

declaration
    : channelDecl
    | processDecl
    | typeDecl
    | assertDecl
    ;

// ===== Channel Declaration =====
channelDecl
    : 'channel' IDENT NUMBER? ';'
    ;

// ===== Type/Enum Declaration (support anonymous enums) =====
typeDecl
    : ('var' | 'enum') IDENT? ('{' enumBody? '}' | '=' initExpr) ';'
    | ('var' | 'enum') IDENT ('[' NUMBER ']')? ('=' arrayInit)? ';'
    ;

enumBody
    : IDENT (',' IDENT)*
    ;

initExpr
    : expr
    | arrayInit
    ;

arrayInit
    : '[' exprList? ']'
    ;

exprList
    : expr (',' expr)*
    ;

// ===== Process Declaration with Parameters =====
processDecl
    : IDENT '(' paramList? ')' '=' processBody ';'
    ;

paramList
    : IDENT (',' IDENT)*
    ;

// ===== Process Body with Operators =====
// Operator precedence (from lowest to highest):
// 1. Parallel composition (||, |~)
// 2. Sequential composition (->)
// 3. Primary process (action, skip, recursion, guards, if-else, etc)

processBody
    : parallelComposition
    ;

parallelComposition
    : sequentialComposition (PAR_OP sequentialComposition)*
    ;

sequentialComposition
    : primaryProcess (ARROW primaryProcess)*
    ;

primaryProcess
    : action
    | skipProcess
    | guardedProcess
    | ifElseProcess
    | processCall
    | '(' processBody ')'
    | choiceProcess
    | blockProcess
    ;

skipProcess
    : 'Skip' '(' ')'
    | 'Skip'
    | 'SKIP'
    | 'skip'
    ;

// ===== If-Then-Else Process =====
ifElseProcess
    : 'if' '(' expr ')' '{' processBody '}' ('else' '{' processBody '}')?
    ;

// ===== Actions (communication and internal) =====
action
    : communicationAction
    | assignmentAction
    | internalAction
    ;

communicationAction
    : channelName (SEND | RECV) msgExpr
    ;

channelName
    : IDENT
    ;

msgExpr
    : IDENT ('.' IDENT)*
    ;

assignmentAction
    : IDENT ('[' expr ']')? '=' expr
    ;

internalAction
    : 'call' '(' IDENT (',' expr)* ')'
    | '{' codeStatement* '}'
    ;

codeStatement
    : assignmentAction ';'
    | ifStatement
    ;

ifStatement
    : 'if' '(' expr ')' '{' codeStatement* '}' ('else' '{' codeStatement* '}')?
    ;

// ===== Guarded Process =====
guardedProcess
    : '[' expr ']' ARROW primaryProcess
    ;

// ===== Process Call/Recursion =====
processCall
    : IDENT ('(' argList? ')')?
    ;

argList
    : expr (',' expr)*
    ;

// ===== Choice Process (non-deterministic) =====
choiceProcess
    : primaryBase (CHOICE_OP primaryBase)+
    ;

primaryBase
    : action
    | skipProcess
    | guardedProcess
    | ifElseProcess
    | processCall
    | '(' processBody ')'
    | blockProcess
    ;

// ===== Block Process =====
blockProcess
    : '{' processBody? '}'
    ;

// ===== Assertion =====
assertDecl
    : '#assert' expr ';'
    | 'assert' expr ';'
    | 'assert' '(' expr ')' ';'
    ;

// ===== Expressions with Proper Precedence =====
expr
    : orExpr
    ;

orExpr
    : andExpr (('||' | 'or') andExpr)*
    ;

andExpr
    : comparisonExpr (('&&' | 'and') comparisonExpr)*
    ;

comparisonExpr
    : additiveExpr ((EQ | NE | LT | GT | LE | GE) additiveExpr)*
    ;

additiveExpr
    : multiplicativeExpr ((PLUS | MINUS) multiplicativeExpr)*
    ;

multiplicativeExpr
    : unaryExpr ((MULT | DIV | MOD) unaryExpr)*
    ;

unaryExpr
    : (NOT | MINUS) unaryExpr
    | primaryExpr
    ;

primaryExpr
    : NUMBER
    | IDENT ('[' expr ']')?
    | IDENT '(' argList? ')'
    | '(' expr ')'
    | 'true'
    | 'false'
    ;

// ===== Lexer Rules =====
ARROW
    : '->'
    ;

PAR_OP
    : '||'
    | '|~'
    ;

CHOICE_OP
    : '[]'
    ;

// Communication operators
SEND: '!';
RECV: '?';

// Comparison operators
EQ: '==';
NE: '!=';
LT: '<';
GT: '>';
LE: '<=';
GE: '>=';

// Logical operators
AND: '&&';
OR: 'or';
NOT: '!';

// Arithmetic operators
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
MOD: '%';

// Delimiters
LPAREN: '(';
RPAREN: ')';
LBRACE: '{';
RBRACE: '}';
LBRACK: '[';
RBRACK: ']';

SEMICOLON: ';';
COMMA: ',';
DOT: '.';
COLON: ':';
ASSIGN: '=';

// Keywords
CHANNEL: 'channel';
VAR: 'var';
ENUM: 'enum';
ASSERT: 'assert';
CALL: 'call';

// Identifiers and numbers
NUMBER
    : [0-9]+
    ;

IDENT
    : [A-Za-z_][A-Za-z0-9_]*
    ;

// Comments
LINE_COMMENT
    : '//' ~[\r\n]* -> skip
    ;

BLOCK_COMMENT
    : '/*' .*? '*/' -> skip
    ;

// Whitespace
WS
    : [ \t\r\n]+ -> skip
    ;
