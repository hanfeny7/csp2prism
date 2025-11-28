"""
Abstract Syntax Tree (AST) classes for PAT processes.
These represent the full structure of parsed PAT programs.
"""

from dataclasses import dataclass, field
from typing import List, Optional, Union


# ===== Base Expression Types =====
@dataclass
class Expr:
    """Base class for all expressions"""
    pass


@dataclass
class NumberExpr(Expr):
    """Numeric literal: 42, 0, 100, etc."""
    value: int


@dataclass
class IdentExpr(Expr):
    """Variable/constant reference: x, MAX_NONCE, etc."""
    name: str


@dataclass
class ArrayAccessExpr(Expr):
    """Array access: x[i], nonce[0], etc."""
    array: Expr
    index: Expr


@dataclass
class BinaryOpExpr(Expr):
    """Binary operation: a + b, x < 5, etc."""
    operator: str  # '+', '-', '*', '/', '%', '==', '!=', '<', '>', '<=', '>=', '&&', '||'
    left: Expr
    right: Expr


@dataclass
class UnaryOpExpr(Expr):
    """Unary operation: !x, -a, etc."""
    operator: str  # '!' or '-'
    operand: Expr


@dataclass
class FunctionCallExpr(Expr):
    """Function/process call: f(), foo(x, y), random[5], etc."""
    name: str
    args: List[Expr] = field(default_factory=list)


@dataclass
class BoolLiteralExpr(Expr):
    """Boolean literal: true, false"""
    value: bool


@dataclass
class RandomExpr(Expr):
    """Random value expression: random[10]"""
    max_val: Expr


# ===== Action Types =====
@dataclass
class Action:
    """Base class for actions"""
    pass


@dataclass
class SendAction(Action):
    """Send action: channel!message.field1.field2"""
    channel: str
    message: str
    fields: List[str] = field(default_factory=list)


@dataclass
class ReceiveAction(Action):
    """Receive action: channel?message.field1.field2"""
    channel: str
    message: str
    fields: List[str] = field(default_factory=list)


@dataclass
class AssignmentAction(Action):
    """Assignment action: var = expr or var[i] = expr"""
    variable: str
    index: Optional[Expr]
    value: Expr


@dataclass
class CallAction(Action):
    """Function/process call: call(func, arg1, arg2)"""
    function: str
    args: List[Expr] = field(default_factory=list)


@dataclass
class InternalAction(Action):
    """Internal/silent action: tau or subprocess block"""
    label: Optional[str] = None


# ===== Process Types =====
@dataclass
class Process:
    """Base class for all process expressions"""
    pass


@dataclass
class SkipProcess(Process):
    """Skip/SKIP - terminating process"""
    pass


@dataclass
class ActionProcess(Process):
    """Single action: chan!msg or var=expr"""
    action: Action


@dataclass
class SequenceProcess(Process):
    """Sequential composition: P1 -> P2 -> P3"""
    processes: List[Process]


@dataclass
class ParallelProcess(Process):
    """Parallel composition: P1 || P2 or P1 |~ P2"""
    operator: str  # '||' (interleaving) or '|~' (parallel prefix)
    processes: List[Process]


@dataclass
class ChoiceProcess(Process):
    """Non-deterministic choice: P1 [] P2 [] P3"""
    processes: List[Process]


@dataclass
class GuardedProcess(Process):
    """Guarded process: [condition] -> P"""
    condition: Expr
    process: Process


@dataclass
class CallProcess(Process):
    """Process call (recursion): ProcessName() or ProcessName(arg1, arg2)"""
    name: str
    args: List[Expr] = field(default_factory=list)


@dataclass
class BlockProcess(Process):
    """Block/scope: { P }"""
    process: Optional[Process] = None


@dataclass
class HidingProcess(Process):
    """Hiding operator: P \\ events"""
    process: Process
    hidden_events: List[str] = field(default_factory=list)


# ===== Process Definition =====
@dataclass
class ProcessDefinition:
    """Named process definition: ProcessName(param1, param2) = ProcessExpression"""
    name: str
    parameters: List[str] = field(default_factory=list)
    body: Optional[Process] = None


# ===== Channel Declaration =====
@dataclass
class ChannelDeclaration:
    """Channel declaration: channel ChName bufferSize;"""
    name: str
    buffer_size: int = 0


# ===== Type Declaration =====
@dataclass
class TypeDeclaration:
    """Type/variable/enum declaration"""
    name: str
    kind: str  # 'var', 'enum', 'bool', 'int'
    value: Optional[str] = None
    enum_values: List[str] = field(default_factory=list)  # For enum types
    range_min: Optional[int] = None  # For integer ranges
    range_max: Optional[int] = None


# ===== Assertion =====
@dataclass
class Assertion:
    """Assertion statement: assert property;"""
    property: Expr


# ===== Full Specification =====
@dataclass
class Specification:
    """Complete PAT program"""
    channels: List[ChannelDeclaration] = field(default_factory=list)
    types: List[TypeDeclaration] = field(default_factory=list)
    processes: List[ProcessDefinition] = field(default_factory=list)
    assertions: List[Assertion] = field(default_factory=list)
    
    def get_process(self, name: str) -> Optional[ProcessDefinition]:
        """Look up a process definition by name"""
        for p in self.processes:
            if p.name == name:
                return p
        return None
    
    def get_channel(self, name: str) -> Optional[ChannelDeclaration]:
        """Look up a channel declaration by name"""
        for c in self.channels:
            if c.name == name:
                return c
        return None
