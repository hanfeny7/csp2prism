"""
ANTLR Parse Tree to AST/IR Converter
Builds AST from ANTLR parse tree, then converts to IR for PRISM generation.
Simplified to work with current ANTLR generated parser.
"""

from typing import List, Optional, Dict, Set, Any
from gen.PATParser import PATParser
from gen.PATVisitor import PATVisitor

from .csp_ast import (
    Specification, ProcessDefinition, ChannelDeclaration, TypeDeclaration, Assertion,
    Process, SkipProcess, ActionProcess, SequenceProcess, ParallelProcess, 
    ChoiceProcess, GuardedProcess, CallProcess, BlockProcess, HidingProcess,
    Action, SendAction, ReceiveAction, AssignmentAction, CallAction, InternalAction,
    Expr, NumberExpr, IdentExpr, ArrayAccessExpr, BinaryOpExpr, UnaryOpExpr,
    FunctionCallExpr, BoolLiteralExpr, RandomExpr
)

from .ir import Spec, ProcessModule, Transition, Guard, Update
from .error_handler import ErrorCollector, safe_visit, safe_get_text, safe_get_int


class SimpleVisitor(PATVisitor):
    """Simplified ANTLR visitor that processes parse tree"""
    
    def __init__(self, error_collector: Optional[ErrorCollector] = None):
        self.current_spec = Specification()
        self.error_collector = error_collector or ErrorCollector()
    
    # Top-level specification
    def visitSpec(self, ctx: PATParser.SpecContext) -> Specification:
        """Visit the top-level specification"""
        spec = Specification()
        if hasattr(ctx, 'declaration'):
            decl_list = ctx.declaration() if callable(ctx.declaration) else [ctx.declaration()]
            if decl_list:
                for decl_ctx in decl_list:
                    if decl_ctx:
                        result = self.visit(decl_ctx)
                        self._add_to_spec(spec, result)
        return spec
    
    def _add_to_spec(self, spec: Specification, item: Any):
        """Add different item types to specification"""
        if isinstance(item, ChannelDeclaration):
            spec.channels.append(item)
        elif isinstance(item, TypeDeclaration):
            spec.types.append(item)
        elif isinstance(item, ProcessDefinition):
            spec.processes.append(item)
        elif isinstance(item, Assertion):
            spec.assertions.append(item)
    
    def visitChannelDecl(self, ctx: PATParser.ChannelDeclContext) -> ChannelDeclaration:
        """Visit channel declaration: channel NAME [SIZE] ;"""
        name = ctx.IDENT().getText()
        buffer_size = 0
        if hasattr(ctx, 'NUMBER') and ctx.NUMBER():
            buffer_size = int(ctx.NUMBER().getText())
        return ChannelDeclaration(name=name, buffer_size=buffer_size)
    
    def visitTypeDecl(self, ctx: PATParser.TypeDeclContext) -> Optional[TypeDeclaration]:
        """Visit type/enum declaration"""
        # Handle anonymous enums: 'enum { ... }' has no IDENT
        ident_node = ctx.IDENT() if hasattr(ctx, 'IDENT') and ctx.IDENT() else None
        if ident_node is None:
            # Anonymous enum/type - skip for now (generates internal name if needed)
            return None
        
        name = ident_node.getText()
        # Determine kind: var or enum
        kind = 'var'
        enum_values = []
        
        if hasattr(ctx, 'VAR') and ctx.VAR():
            kind = 'var'
        elif hasattr(ctx, 'ENUM') and ctx.ENUM():
            kind = 'enum'
            # Extract enum values from text
            text = ctx.getText()
            if '{' in text and '}' in text:
                enum_text = text[text.find('{')+1:text.find('}')]
                enum_values = [v.strip() for v in enum_text.split(',') if v.strip()]

        # Attempt to capture an initializer/value if present
        value = None
        range_min = None
        range_max = None
        
        try:
            text = ctx.getText()
            if '=' in text:
                # crude extraction of rhs (may be compacted by ANTLR getText)
                rhs = text.split('=', 1)[1]
                # strip trailing '}' or ';'
                rhs = rhs.rstrip(';}').strip()
                value = rhs
                
                # Try to infer range for integer values
                if value.isdigit():
                    int_val = int(value)
                    range_min = 0
                    range_max = max(10000, int_val * 2)  # Use reasonable upper bound
                elif value.lower() in ('true', 'false'):
                    kind = 'bool'
        except Exception:
            value = None

        return TypeDeclaration(name=name, kind=kind, value=value, 
                             enum_values=enum_values, range_min=range_min, range_max=range_max)
    
    def visitProcessDecl(self, ctx: PATParser.ProcessDeclContext) -> ProcessDefinition:
        """Visit process declaration: NAME ( [PARAMS] ) = BODY ;"""
        name = ctx.IDENT().getText()
        params = []
        if hasattr(ctx, 'paramList') and ctx.paramList():
            params = self.visit(ctx.paramList())
        
        body = None
        if hasattr(ctx, 'processBody') and ctx.processBody():
            body = self.visit(ctx.processBody())
        
        return ProcessDefinition(name=name, parameters=params, body=body)
    
    def visitParamList(self, ctx: PATParser.ParamListContext) -> List[str]:
        """Visit parameter list"""
        params = []
        idents = ctx.IDENT()
        if isinstance(idents, list):
            for ident in idents:
                params.append(ident.getText())
        else:
            params.append(idents.getText())
        return params
    
    def visitProcessBody(self, ctx: PATParser.ProcessBodyContext) -> Process:
        """Visit process body"""
        if hasattr(ctx, 'parallelComposition') and ctx.parallelComposition():
            return self.visit(ctx.parallelComposition())
        return SkipProcess()
    
    def visitParallelComposition(self, ctx: PATParser.ParallelCompositionContext) -> Process:
        """Handle parallel composition: proc || proc || proc"""
        seqs = []
        if hasattr(ctx, 'sequentialComposition'):
            seq_list = ctx.sequentialComposition()
            if isinstance(seq_list, list):
                for seq_ctx in seq_list:
                    seqs.append(self.visit(seq_ctx))
            else:
                seqs.append(self.visit(seq_list))
        
        if not seqs:
            return SkipProcess()
        if len(seqs) == 1:
            return seqs[0]
        
        return ParallelProcess(operator='||', processes=seqs)
    
    def visitSequentialComposition(self, ctx: PATParser.SequentialCompositionContext) -> Process:
        """Handle sequential composition: proc -> proc -> proc"""
        procs = []
        if hasattr(ctx, 'primaryProcess'):
            prim_list = ctx.primaryProcess()
            if isinstance(prim_list, list):
                for prim_ctx in prim_list:
                    procs.append(self.visit(prim_ctx))
            else:
                procs.append(self.visit(prim_list))
        
        if not procs:
            return SkipProcess()
        if len(procs) == 1:
            return procs[0]
        
        return SequenceProcess(processes=procs)
    
    def visitPrimaryProcess(self, ctx: PATParser.PrimaryProcessContext) -> Process:
        """Handle primary process"""
        if hasattr(ctx, 'action') and ctx.action():
            return ActionProcess(action=self.visit(ctx.action()))
        elif hasattr(ctx, 'skipProcess') and ctx.skipProcess():
            return SkipProcess()
        elif hasattr(ctx, 'guardedProcess') and ctx.guardedProcess():
            return self.visit(ctx.guardedProcess())
        elif hasattr(ctx, 'processCall') and ctx.processCall():
            return self.visit(ctx.processCall())
        elif hasattr(ctx, 'processBody') and ctx.processBody():
            return self.visit(ctx.processBody())
        elif hasattr(ctx, 'choiceProcess') and ctx.choiceProcess():
            return self.visit(ctx.choiceProcess())
        elif hasattr(ctx, 'blockProcess') and ctx.blockProcess():
            return self.visit(ctx.blockProcess())
        return SkipProcess()
    
    def visitSkipProcess(self, ctx: PATParser.SkipProcessContext) -> Process:
        """Handle Skip process"""
        return SkipProcess()
    
    def visitAction(self, ctx: PATParser.ActionContext) -> Action:
        """Handle action"""
        if hasattr(ctx, 'communicationAction') and ctx.communicationAction():
            return self.visit(ctx.communicationAction())
        elif hasattr(ctx, 'assignmentAction') and ctx.assignmentAction():
            return self.visit(ctx.assignmentAction())
        elif hasattr(ctx, 'internalAction') and ctx.internalAction():
            return self.visit(ctx.internalAction())
        return InternalAction()
    
    def visitCommunicationAction(self, ctx: PATParser.CommunicationActionContext) -> Action:
        """Handle communication action: channel! msg or channel? msg"""
        channel = ctx.channelName().getText()
        message = ctx.message().getText()
        fields = []
        
        if hasattr(ctx, 'fieldList') and ctx.fieldList():
            field_text = ctx.fieldList().getText()
            fields = [f.strip('.') for f in field_text.split('.') if f.strip()]
        
        # Check if SEND (!) or RECV (?)
        text = ctx.getText()
        if '!' in text:
            return SendAction(channel=channel, message=message, fields=fields)
        else:
            return ReceiveAction(channel=channel, message=message, fields=fields)
    
    def visitAssignmentAction(self, ctx: PATParser.AssignmentActionContext) -> AssignmentAction:
        """Handle assignment: var = expr or var[idx] = expr"""
        var = ctx.IDENT().getText()
        
        # Get all expressions
        exprs = ctx.expr()
        if isinstance(exprs, list):
            if len(exprs) >= 2:
                # var[idx] = expr
                index = self._expr_to_ast(exprs[0])
                value = self._expr_to_ast(exprs[1])
                return AssignmentAction(variable=var, index=index, value=value)
            elif len(exprs) == 1:
                # var = expr
                value = self._expr_to_ast(exprs[0])
                return AssignmentAction(variable=var, index=None, value=value)
        else:
            # Single expression
            if exprs:
                value = self._expr_to_ast(exprs)
                return AssignmentAction(variable=var, index=None, value=value)
        
        return AssignmentAction(variable=var, index=None, value=NumberExpr(value=0))
    
    def visitInternalAction(self, ctx: PATParser.InternalActionContext) -> Action:
        """Handle internal action: call(...) or {...}"""
        text = ctx.getText()
        
        if text.startswith('call'):
            func_name = ctx.IDENT().getText() if hasattr(ctx, 'IDENT') and ctx.IDENT() else 'call'
            return CallAction(function=func_name, args=[])
        else:
            if hasattr(ctx, 'processBody') and ctx.processBody():
                self.visit(ctx.processBody())
            return InternalAction()
    
    def visitGuardedProcess(self, ctx: PATParser.GuardedProcessContext) -> GuardedProcess:
        """Handle guarded process: [expr] -> proc"""
        condition = self._expr_to_ast(ctx.expr())
        process = self.visit(ctx.primaryProcess())
        return GuardedProcess(condition=condition, process=process)
    
    def visitProcessCall(self, ctx: PATParser.ProcessCallContext) -> CallProcess:
        """Handle process call: name or name(args)"""
        name = ctx.IDENT().getText()
        args = []
        
        if hasattr(ctx, 'argList') and ctx.argList():
            arg_list = ctx.argList()
            expr_list = arg_list.expr()
            if isinstance(expr_list, list):
                for arg_ctx in expr_list:
                    args.append(self._expr_to_ast(arg_ctx))
            else:
                args.append(self._expr_to_ast(expr_list))
        
        return CallProcess(name=name, args=args)
    
    def visitChoiceProcess(self, ctx: PATParser.ChoiceProcessContext) -> ChoiceProcess:
        """Handle choice process: proc [] proc [] proc"""
        procs = []
        
        # Get all primaryBase options
        if hasattr(ctx, 'primaryBase'):
            base_list = ctx.primaryBase()
            if not isinstance(base_list, list):
                base_list = [base_list]
            
            for base_ctx in base_list:
                if hasattr(base_ctx, 'action') and base_ctx.action():
                    procs.append(ActionProcess(action=self.visit(base_ctx.action())))
                elif hasattr(base_ctx, 'skipProcess') and base_ctx.skipProcess():
                    procs.append(SkipProcess())
                elif hasattr(base_ctx, 'guardedProcess') and base_ctx.guardedProcess():
                    procs.append(self.visit(base_ctx.guardedProcess()))
                elif hasattr(base_ctx, 'processCall') and base_ctx.processCall():
                    procs.append(self.visit(base_ctx.processCall()))
                elif hasattr(base_ctx, 'processBody') and base_ctx.processBody():
                    procs.append(self.visit(base_ctx.processBody()))
                elif hasattr(base_ctx, 'blockProcess') and base_ctx.blockProcess():
                    procs.append(self.visit(base_ctx.blockProcess()))
        
        return ChoiceProcess(processes=procs) if procs else SkipProcess()
    
    def visitBlockProcess(self, ctx: PATParser.BlockProcessContext) -> BlockProcess:
        """Handle block process: { procBody }"""
        proc = None
        if hasattr(ctx, 'processBody') and ctx.processBody():
            proc = self.visit(ctx.processBody())
        return BlockProcess(process=proc)
    
    def visitAssertDecl(self, ctx: PATParser.AssertDeclContext) -> Assertion:
        """Handle assertion"""
        expr = self._expr_to_ast(ctx.expr())
        return Assertion(property=expr)
    
    # Expression handling
    def _expr_to_ast(self, ctx) -> Expr:
        """Convert expression context to AST"""
        if ctx is None:
            return NumberExpr(value=0)
        
        # Navigate through expression hierarchy
        if hasattr(ctx, 'orExpr') and ctx.orExpr():
            return self._or_expr_to_ast(ctx.orExpr())
        
        if hasattr(ctx, 'primaryExpr') and ctx.primaryExpr():
            return self._primary_expr_to_ast(ctx.primaryExpr())
        
        return self._primary_expr_to_ast(ctx)
    
    def _or_expr_to_ast(self, ctx) -> Expr:
        """Handle OR expression"""
        if not hasattr(ctx, 'andExpr'):
            return NumberExpr(value=0)
        
        and_list = ctx.andExpr()
        if not isinstance(and_list, list):
            and_list = [and_list]
        
        if not and_list:
            return NumberExpr(value=0)
        
        left = self._and_expr_to_ast(and_list[0])
        
        for i in range(1, len(and_list)):
            right = self._and_expr_to_ast(and_list[i])
            left = BinaryOpExpr(operator='||', left=left, right=right)
        
        return left
    
    def _and_expr_to_ast(self, ctx) -> Expr:
        """Handle AND expression"""
        if not hasattr(ctx, 'comparisonExpr'):
            return NumberExpr(value=0)
        
        comp_list = ctx.comparisonExpr()
        if not isinstance(comp_list, list):
            comp_list = [comp_list]
        
        if not comp_list:
            return NumberExpr(value=0)
        
        left = self._comparison_expr_to_ast(comp_list[0])
        
        for i in range(1, len(comp_list)):
            right = self._comparison_expr_to_ast(comp_list[i])
            left = BinaryOpExpr(operator='&&', left=left, right=right)
        
        return left
    
    def _comparison_expr_to_ast(self, ctx) -> Expr:
        """Handle comparison expression"""
        if not hasattr(ctx, 'additiveExpr'):
            return NumberExpr(value=0)
        
        add_list = ctx.additiveExpr()
        if not isinstance(add_list, list):
            add_list = [add_list]
        
        if not add_list:
            return NumberExpr(value=0)
        
        left = self._additive_expr_to_ast(add_list[0])
        
        for i in range(1, len(add_list)):
            right = self._additive_expr_to_ast(add_list[i])
            left = BinaryOpExpr(operator='==', left=left, right=right)
        
        return left
    
    def _additive_expr_to_ast(self, ctx) -> Expr:
        """Handle additive expression"""
        if not hasattr(ctx, 'multiplicativeExpr'):
            return NumberExpr(value=0)
        
        mult_list = ctx.multiplicativeExpr()
        if not isinstance(mult_list, list):
            mult_list = [mult_list]
        
        if not mult_list:
            return NumberExpr(value=0)
        
        left = self._multiplicative_expr_to_ast(mult_list[0])
        
        for i in range(1, len(mult_list)):
            right = self._multiplicative_expr_to_ast(mult_list[i])
            left = BinaryOpExpr(operator='+', left=left, right=right)
        
        return left
    
    def _multiplicative_expr_to_ast(self, ctx) -> Expr:
        """Handle multiplicative expression"""
        if not hasattr(ctx, 'unaryExpr'):
            return NumberExpr(value=0)
        
        unary_list = ctx.unaryExpr()
        if not isinstance(unary_list, list):
            unary_list = [unary_list]
        
        if not unary_list:
            return NumberExpr(value=0)
        
        left = self._unary_expr_to_ast(unary_list[0])
        
        for i in range(1, len(unary_list)):
            right = self._unary_expr_to_ast(unary_list[i])
            left = BinaryOpExpr(operator='*', left=left, right=right)
        
        return left
    
    def _unary_expr_to_ast(self, ctx) -> Expr:
        """Handle unary expression"""
        if ctx is None:
            return NumberExpr(value=0)
        
        text = ctx.getText()
        
        if text.startswith('!') or text.startswith('-'):
            op = text[0]
            if hasattr(ctx, 'unaryExpr') and ctx.unaryExpr():
                operand = self._unary_expr_to_ast(ctx.unaryExpr())
            elif hasattr(ctx, 'primaryExpr') and ctx.primaryExpr():
                operand = self._primary_expr_to_ast(ctx.primaryExpr())
            else:
                operand = NumberExpr(value=0)
            return UnaryOpExpr(operator=op, operand=operand)
        
        if hasattr(ctx, 'primaryExpr') and ctx.primaryExpr():
            return self._primary_expr_to_ast(ctx.primaryExpr())
        
        return NumberExpr(value=0)
    
    def _primary_expr_to_ast(self, ctx) -> Expr:
        """Handle primary expression"""
        if ctx is None:
            return NumberExpr(value=0)
        
        text = ctx.getText()
        
        # Check for NUMBER
        if hasattr(ctx, 'NUMBER') and ctx.NUMBER():
            return NumberExpr(value=int(ctx.NUMBER().getText()))
        
        # Check for boolean
        if text in ('true', 'false'):
            return BoolLiteralExpr(value=text == 'true')
        
        # Check for random
        if 'random' in text:
            if hasattr(ctx, 'expr') and ctx.expr():
                expr_list = ctx.expr()
                if isinstance(expr_list, list) and expr_list:
                    max_expr = self._expr_to_ast(expr_list[0])
                else:
                    max_expr = self._expr_to_ast(expr_list)
                return RandomExpr(max_val=max_expr)
        
        # Check for identifier, function call, or array access
        if hasattr(ctx, 'IDENT') and ctx.IDENT():
            name = ctx.IDENT().getText()
            
            # Function call
            if hasattr(ctx, 'argList') and ctx.argList():
                args = []
                arg_list = ctx.argList()
                expr_list = arg_list.expr()
                if isinstance(expr_list, list):
                    for arg_ctx in expr_list:
                        args.append(self._expr_to_ast(arg_ctx))
                else:
                    args.append(self._expr_to_ast(expr_list))
                return FunctionCallExpr(name=name, args=args)
            
            # Array access
            if hasattr(ctx, 'expr') and ctx.expr():
                expr_list = ctx.expr()
                if isinstance(expr_list, list) and expr_list:
                    index = self._expr_to_ast(expr_list[0])
                elif expr_list:
                    index = self._expr_to_ast(expr_list)
                else:
                    index = NumberExpr(value=0)
                return ArrayAccessExpr(array=IdentExpr(name=name), index=index)
            
            # Simple identifier
            return IdentExpr(name=name)
        
        # Parenthesized expression
        if hasattr(ctx, 'expr') and ctx.expr():
            expr_list = ctx.expr()
            if isinstance(expr_list, list) and expr_list:
                return self._expr_to_ast(expr_list[0])
            elif expr_list:
                return self._expr_to_ast(expr_list)
        
        return NumberExpr(value=0)


class IRBuilder:
    """
    Converts AST to Intermediate Representation (IR) for PRISM generation.
    Flattens process structure into state machines.
    """
    
    def __init__(self, error_collector: Optional[ErrorCollector] = None):
        self.message_set: Set[str] = set()
        self.state_counter = 0
        self.error_collector = error_collector or ErrorCollector()
    
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
        # This builds a generic map: var_name -> PRISM_type_declaration
        for type_decl in spec.types:
            if type_decl and type_decl.name:
                # Build PRISM-compatible type declaration
                prism_type = self._build_prism_type(type_decl)
                if prism_type:
                    ir_spec.variables[type_decl.name] = prism_type
        
        # Convert processes
        for proc_def in spec.processes:
            module = self._process_to_module(proc_def)
            if module:
                ir_spec.processes.append(module)
        
        return ir_spec
    
    def _build_prism_type(self, type_decl) -> str:
        """Convert PAT type declaration to PRISM type string with correct syntax"""
        if not type_decl or not type_decl.name:
            return None
        
        # Handle enum types
        if type_decl.kind == 'enum':
            if len(type_decl.enum_values) > 0:
                # Enum with explicit values: map to [0..N-1]
                max_val = len(type_decl.enum_values) - 1
                return f"[0..{max_val}] init 0  // {', '.join(type_decl.enum_values[:3])}..."
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
                # Infer reasonable range
                if type_decl.range_min is not None and type_decl.range_max is not None:
                    return f"[{type_decl.range_min}..{type_decl.range_max}] init {int_val}"
                else:
                    # Default range based on value
                    max_range = max(10000, int_val * 2)
                    return f"[0..{max_range}] init {int_val}"
            else:
                # Non-numeric value, treat as generic int
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
            # For now, handle simple interleaving
            current = from_state
            for sub_proc in proc.processes:
                current = self._process_to_transitions(sub_proc, current, module)
            return current
        
        elif isinstance(proc, ChoiceProcess):
            end_states = []
            to_state = self.state_counter
            self.state_counter += 1
            
            for choice_proc in proc.processes:
                end = self._process_to_transitions(choice_proc, to_state, module)
                end_states.append(end)
            
            merge_state = self.state_counter
            self.state_counter += 1
            for end_state in end_states:
                module.add_transition(Transition(
                    from_state=end_state,
                    to_state=merge_state,
                    label='internal'
                ))
            
            return merge_state
        
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
    
    def _action_to_transition(self, action: Action, from_state: int, to_state: int, module: ProcessModule):
        """Convert an action to a transition"""
        
        if isinstance(action, SendAction):
            if action.message:
                self.message_set.add(action.message)
            module.add_transition(Transition(
                from_state=from_state,
                to_state=to_state,
                label=f'send_{action.message}',
                channel=action.channel,
                message=action.message,
                fields=action.fields
            ))
        
        elif isinstance(action, ReceiveAction):
            if action.message:
                self.message_set.add(action.message)
            module.add_transition(Transition(
                from_state=from_state,
                to_state=to_state,
                label=f'recv_{action.message}',
                channel=action.channel,
                message=action.message,
                fields=action.fields
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
            module.add_transition(Transition(
                from_state=from_state,
                to_state=to_state,
                label=f'call_{action.function}'
            ))
        
        else:  # InternalAction
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


# Alias for backward compatibility
class ASTBuilder(SimpleVisitor):
    """Alias for SimpleVisitor for backward compatibility"""
    pass
