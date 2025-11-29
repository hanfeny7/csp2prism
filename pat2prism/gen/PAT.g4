grammar PAT;

// ===================================================================
// PAT (Process Algebra Toolkit) Grammar - Improved Version
// Supports: sequential composition, parallel composition, recursion,
// message passing, guards, and complex process structures
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

// ===== Type/Enum Declaration =====
typeDecl
    : ('var' | 'enum') IDENT ('=' | '{') (~(';' | '}'))* (';' | '}')
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
// 3. Primary process (action, skip, recursion, etc)

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
    | processCall
    | '(' processBody ')'
    | choiceProcess
    | blockProcess
    ;

skipProcess
    : 'Skip' '(' ')'
    | 'Skip'
    | 'SKIP'
    ;

// ===== Actions (communication and internal) =====
action
    : communicationAction
    | assignmentAction
    | internalAction
    ;

communicationAction
    : channelName (SEND | RECV) message fieldList?
    ;

channelName
    : IDENT
    ;

message
    : IDENT
    ;

fieldList
    : ('.' IDENT)+
    ;

assignmentAction
    : IDENT ('[' expr ']')? '=' expr
    ;

internalAction
    : 'call' '(' IDENT (',' expr)* ')'
    | '{' processBody '}'
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
    : 'assert' expr ';'
    | 'assert' '(' expr ')' ';'
    ;

// ===== Expressions with Proper Precedence =====
// Left-associative binary operators with standard precedence
expr
    : orExpr
    ;

orExpr
    : andExpr (PAR_OP andExpr)*
    ;

andExpr
    : comparisonExpr (AND comparisonExpr)*
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
    | 'random' '[' expr ']'
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
NOT: 'not';

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
RANDOM: 'random';

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

