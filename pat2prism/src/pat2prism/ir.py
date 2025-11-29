"""
Intermediate Representation (IR) for PRISM model generation.
Converts AST to a flat, PRISM-friendly representation.
"""

from dataclasses import dataclass, field
from typing import List, Optional, Dict, Set, Tuple, Any


@dataclass
class Guard:
    """Guard condition on a transition"""
    condition: str  # Expression string
    

@dataclass
class Update:
    """State update on a transition"""
    variable: str
    expression: str
    probability: float = 1.0  # For stochastic models


@dataclass
class Transition:
    """Transition between states"""
    from_state: int
    to_state: int
    label: str  # Action name (send, recv, call, internal)
    channel: Optional[str] = None  # For send/recv
    message: Optional[str] = None  # For send/recv
    fields: List[str] = field(default_factory=list)  # Message fields
    guard: Optional[Guard] = None
    updates: List[Update] = field(default_factory=list)
    priority: int = 0


@dataclass
class ProcessModule:
    """Flattened process for PRISM module"""
    name: str
    states: List[int]
    initial_state: int = 0
    transitions: List[Transition] = field(default_factory=list)
    variables: Dict[str, str] = field(default_factory=dict)  # var_name -> type_str
    synced_channels: Set[str] = field(default_factory=set)  # Channels this process uses
    
    def add_transition(self, trans: Transition):
        """Add a transition"""
        self.transitions.append(trans)
    
    def get_transitions_from(self, state: int) -> List[Transition]:
        """Get all transitions from a state"""
        return [t for t in self.transitions if t.from_state == state]


@dataclass
class SystemComposition:
    """System-level composition"""
    modules: List[ProcessModule]
    shared_channels: Set[str] = field(default_factory=set)


@dataclass
class Spec:
    """Complete IR specification ready for PRISM generation"""
    channels: List[Dict[str, Any]] = field(default_factory=list)
    # channels format: [{'name': 'ComSC', 'buffer_size': 0}, ...]
    
    processes: List[ProcessModule] = field(default_factory=list)
    # Flattened process modules
    
    variables: Dict[str, str] = field(default_factory=dict)
    # Global variables and their types
    
    def get_process(self, name: str) -> Optional[ProcessModule]:
        """Look up a process module by name"""
        for p in self.processes:
            if p.name == name:
                return p
        return None
    
    def get_channel_index(self, name: str) -> int:
        """Get the index of a channel (for message encoding)"""
        for i, ch in enumerate(self.channels):
            if ch['name'] == name:
                return i
        return -1
    
    @property
    def message_names(self) -> List[str]:
        """Collect all unique message names from all processes"""
        messages = set()
        for proc in self.processes:
            for trans in proc.transitions:
                if trans.message:
                    messages.add(trans.message)
        # Always include NO_MSG as first
        result = ['NO_MSG']
        result.extend(sorted(messages))
        return result
