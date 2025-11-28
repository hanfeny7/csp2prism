"""
Enhanced IR Builder with improved support for:
- Proper PRISM type declarations
- Message field extraction
- Synchronization labels for send/recv
"""

from typing import Set, Dict, Optional
from .csp_ast import (
    Specification, ProcessDefinition, Process,
    SkipProcess, ActionProcess, SequenceProcess, ParallelProcess,
    ChoiceProcess, GuardedProcess, CallProcess, BlockProcess,
    SendAction, ReceiveAction, AssignmentAction, CallAction,
    Expr, NumberExpr, IdentExpr, BinaryOpExpr, UnaryOpExpr,
    FunctionCallExpr, BoolLiteralExpr, RandomExpr, ArrayAccessExpr
)
from .ir import Spec, ProcessModule, Transition, Guard, Update
from .error_handler import ErrorCollector


class EnhancedIRBuilder:
    """
    Enhanced IR builder with better support for security protocol modeling
    """
    
    def __init__(self, error_collector: Optional[ErrorCollector] = None):
        self.message_set: Set[str] = set()
        self.state_counter = 0
        self.error_collector = error_collector or ErrorCollector()
        self.message_fields: Dict[str, Set[str]] = {}  # msg_name -> set of fields
    
    def build_ir(self, spec: Specification) -> Spec:
        """Build IR from AST specification"""
        ir_spec = Spec()
        
        # Convert channels
        for ch in spec.channels:
            ir_spec.channels.append({
                'name': ch.name,
                'buffer_size': ch.buffer_size
            })
        
        # Convert global variables (types/enums) from declarations
        for type_decl in spec.types:
            if type_decl and type_decl.name:
                prism_type = self._build_prism_type(type_decl)
                if prism_type:
                    ir_spec.variables[type_decl.name] = prism_type
        
        # First pass: collect all message fields from all processes
        for proc_def in spec.processes:
            self._collect_message_fields(proc_def.body)
        
        # Create global variables for message fields
        for msg_name, fields in self.message_fields.items():
            for field in fields:
                var_name = f"{msg_name}_{field}"
                if var_name not in ir_spec.variables:
                    # Infer type based on field name patterns
                    if field.startswith('N_') or 'nonce' in field.lower():
                        ir_spec.variables[var_name] = "[0..10000] init 0  // nonce field"
                    elif field.startswith('ID_'):
                        ir_spec.variables[var_name] = "[0..100] init 0  // ID field"
                    elif 'MAC' in field or 'mac' in field:
                        ir_spec.variables[var_name] = "[0..1000] init 0  // MAC field"
                    elif 'key' in field.lower() or field.startswith('K_'):
                        ir_spec.variables[var_name] = "[0..10000] init 0  // key field"
                    else:
                        ir_spec.variables[var_name] = "[0..1000] init 0  // message field"
        
        # Convert processes (filter out system-level parallel compositions)
        for proc_def in spec.processes:
            # Skip processes that are just top-level parallel compositions (e.g., System())
            if self._is_system_process(proc_def):
                continue
            
            module = self._process_to_module(proc_def)
            if module and self._has_meaningful_transitions(module):
                ir_spec.processes.append(module)
        
        return ir_spec
    
    def _is_system_process(self, proc_def: ProcessDefinition) -> bool:
        """Check if process is a system-level parallel composition (should be skipped)"""
        if not proc_def.body:
            return True
        
        # Check if the entire body is just a parallel composition or call process
        body = proc_def.body
        
        # Direct parallel composition: System() = P1() || P2() || P3()
        if isinstance(body, ParallelProcess):
            # Check if all sub-processes are just process calls
            all_calls = all(isinstance(p, CallProcess) for p in body.processes)
            if all_calls:
                return True
        
        # Single call to another process: Wrapper() = ActualProcess()
        if isinstance(body, CallProcess):
            return True
        
        return False
    
    def _has_meaningful_transitions(self, module: ProcessModule) -> bool:
        """Check if module has actual protocol logic (not just empty/call states)"""
        if not module.transitions:
            return False
        
        # Check if there are any real actions (not just function calls)
        for trans in module.transitions:
            # Has synchronization label (send/receive)
            if trans.label and 'sync_' in trans.label:
                return True
            # Has guard or updates
            if trans.guard or trans.updates:
                return True
        
        # If only function call transitions, likely not a real protocol process
        return False
    
    def _collect_message_fields(self, proc: Process):
        """Recursively collect all message fields from process"""
        if proc is None:
            return
        
        if isinstance(proc, ActionProcess):
            action = proc.action
            if isinstance(action, (SendAction, ReceiveAction)):
                if action.message and action.fields:
                    if action.message not in self.message_fields:
                        self.message_fields[action.message] = set()
                    self.message_fields[action.message].update(action.fields)
        
        elif isinstance(proc, SequenceProcess):
            for sub_proc in proc.processes:
                self._collect_message_fields(sub_proc)
        
        elif isinstance(proc, ParallelProcess):
            for sub_proc in proc.processes:
                self._collect_message_fields(sub_proc)
        
        elif isinstance(proc, ChoiceProcess):
            for sub_proc in proc.processes:
                self._collect_message_fields(sub_proc)
        
        elif isinstance(proc, GuardedProcess):
            self._collect_message_fields(proc.process)
        
        elif isinstance(proc, BlockProcess):
            self._collect_message_fields(proc.process)
    
    def _build_prism_type(self, type_decl) -> str:
        """Convert PAT type declaration to PRISM type string with correct syntax"""
        if not type_decl or not type_decl.name:
            return None
        
        # Handle enum types
        if type_decl.kind == 'enum':
            if hasattr(type_decl, 'enum_values') and len(type_decl.enum_values) > 0:
                max_val = len(type_decl.enum_values) - 1
                enum_comment = ', '.join(type_decl.enum_values[:3])
                if len(type_decl.enum_values) > 3:
                    enum_comment += '...'
                return f"[0..{max_val}] init 0  // {enum_comment}"
            else:
                return "[0..10] init 0  // enum"
        
        # Handle boolean
        if type_decl.kind == 'bool' or (type_decl.value and type_decl.value.lower() in ('true', 'false')):
            init_val = type_decl.value.lower() if type_decl.value else 'false'
            return f"bool init {init_val}"
        
        # Handle integer/var with explicit value
        if type_decl.value:
            val_str = type_decl.value.strip()
            if val_str.isdigit():
                int_val = int(val_str)
                # Use explicit range if available
                if hasattr(type_decl, 'range_min') and type_decl.range_min is not None:
                    return f"[{type_decl.range_min}..{type_decl.range_max}] init {int_val}"
                else:
                    # Infer reasonable range
                    max_range = max(10000, int_val * 2)
                    return f"[0..{max_range}] init {int_val}"
            else:
                return "[0..1000] init 0  // TODO: specify range"
        
        # Default fallback
        return "[0..1000] init 0  // var"
    
    def _process_to_module(self, proc_def: ProcessDefinition) -> Optional[ProcessModule]:
        """Convert a process definition to a PRISM module"""
        self.state_counter = 0
        module = ProcessModule(name=proc_def.name, states=[])
        
        if proc_def.body:
            start_state = self.state_counter
            self.state_counter += 1
            end_state = self._process_to_transitions(proc_def.body, start_state, module)
            module.states = list(range(start_state, end_state + 1))
        
        return module
    
    def _process_to_transitions(self, proc: Process, from_state: int, module: ProcessModule) -> int:
        """Convert process to transitions, return final state"""
        
        if isinstance(proc, SkipProcess):
            return from_state
        
        elif isinstance(proc, ActionProcess):
            to_state = self.state_counter
            self.state_counter += 1
            self._action_to_transition(proc.action, from_state, to_state, module)
            return to_state
        
        elif isinstance(proc, SequenceProcess):
            current = from_state
            for sub_proc in proc.processes:
                current = self._process_to_transitions(sub_proc, current, module)
            return current
        
        elif isinstance(proc, ParallelProcess):
            # Simple interleaving for now
            current = from_state
            for sub_proc in proc.processes:
                current = self._process_to_transitions(sub_proc, current, module)
            return current
        
        elif isinstance(proc, ChoiceProcess):
            # Each branch starts from from_state, ends at different states
            end_states = []
            for choice_proc in proc.processes:
                end = self._process_to_transitions(choice_proc, from_state, module)
                end_states.append(end)
            
            # Merge all end states to a common continuation state
            if len(end_states) > 1:
                merge_state = self.state_counter
                self.state_counter += 1
                for end_state in end_states:
                    module.add_transition(Transition(
                        from_state=end_state,
                        to_state=merge_state,
                        label='merge'
                    ))
                return merge_state
            elif len(end_states) == 1:
                return end_states[0]
            else:
                return from_state
        
        elif isinstance(proc, GuardedProcess):
            to_state = self.state_counter
            self.state_counter += 1
            
            trans = Transition(
                from_state=from_state,
                to_state=to_state,
                label='guarded',
                guard=Guard(condition=self._expr_to_string(proc.condition))
            )
            module.add_transition(trans)
            
            return self._process_to_transitions(proc.process, to_state, module)
        
        elif isinstance(proc, CallProcess):
            to_state = self.state_counter
            self.state_counter += 1
            module.add_transition(Transition(
                from_state=from_state,
                to_state=to_state,
                label=f'call_{proc.name}'
            ))
            return to_state
        
        elif isinstance(proc, BlockProcess):
            if proc.process:
                return self._process_to_transitions(proc.process, from_state, module)
            return from_state
        
        return from_state
    
    def _action_to_transition(self, action, from_state: int, to_state: int, module: ProcessModule):
        """Convert an action to a transition with proper synchronization labels"""
        
        if isinstance(action, SendAction):
            if action.message:
                self.message_set.add(action.message)
            
            # Generate updates for message fields
            updates = []
            for field in action.fields:
                var_name = f"{action.message}_{field}"
                # Create update to set message field (using existing variable or 0)
                updates.append(Update(
                    variable=var_name,
                    expression=field  # Will be resolved later
                ))
            
            # Use synchronization label for send
            sync_label = f"sync_{action.channel}_{action.message}"
            
            module.add_transition(Transition(
                from_state=from_state,
                to_state=to_state,
                label=sync_label,
                channel=action.channel,
                message=action.message,
                fields=action.fields,
                updates=updates
            ))
        
        elif isinstance(action, ReceiveAction):
            if action.message:
                self.message_set.add(action.message)
            
            # Generate updates to read message fields into local variables
            updates = []
            for field in action.fields:
                src_var = f"{action.message}_{field}"
                # Create update to read from channel variable
                updates.append(Update(
                    variable=field,
                    expression=src_var
                ))
            
            # Use same synchronization label as corresponding send
            sync_label = f"sync_{action.channel}_{action.message}"
            
            module.add_transition(Transition(
                from_state=from_state,
                to_state=to_state,
                label=sync_label,
                channel=action.channel,
                message=action.message,
                fields=action.fields,
                updates=updates
            ))
        
        elif isinstance(action, AssignmentAction):
            module.add_transition(Transition(
                from_state=from_state,
                to_state=to_state,
                label=f'assign_{action.variable}',
                updates=[Update(
                    variable=action.variable,
                    expression=self._expr_to_string(action.value)
                )]
            ))
        
        elif isinstance(action, CallAction):
            # Function calls become labeled transitions (no logic yet)
            module.add_transition(Transition(
                from_state=from_state,
                to_state=to_state,
                label=f'call_{action.function}'
            ))
        
        else:
            # Internal action
            module.add_transition(Transition(
                from_state=from_state,
                to_state=to_state,
                label='internal'
            ))
    
    def _expr_to_string(self, expr: Expr) -> str:
        """Convert expression to string representation"""
        if isinstance(expr, NumberExpr):
            return str(expr.value)
        elif isinstance(expr, IdentExpr):
            return expr.name
        elif isinstance(expr, BoolLiteralExpr):
            return 'true' if expr.value else 'false'
        elif isinstance(expr, BinaryOpExpr):
            left = self._expr_to_string(expr.left)
            right = self._expr_to_string(expr.right)
            return f'({left} {expr.operator} {right})'
        elif isinstance(expr, UnaryOpExpr):
            op_str = self._expr_to_string(expr.operand)
            return f'{expr.operator}{op_str}'
        elif isinstance(expr, FunctionCallExpr):
            args = ', '.join(self._expr_to_string(a) for a in expr.args)
            return f'{expr.name}({args})'
        elif isinstance(expr, ArrayAccessExpr):
            array = self._expr_to_string(expr.array)
            index = self._expr_to_string(expr.index)
            return f'{array}[{index}]'
        elif isinstance(expr, RandomExpr):
            max_val = self._expr_to_string(expr.max_val)
            return f'random[{max_val}]'
        return '0'
