"""
ANTLR Parse Tree to AST/IR Converter
Builds AST from ANTLR parse tree, then converts to IR for PRISM generation.
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


class ASTBuilder(PATVisitor):
    """Simplified ANTLR visitor that builds AST from parse tree."""
    """
    Builds AST from ANTLR parse tree.
    """
    
    def __init__(self):
        self.current_spec = Specification()
    
    def visitSpec(self, ctx: PATParser.SpecContext) -> Specification:
        """Visit top-level specification"""
        spec = Specification()
        for i in range(ctx.getChildCount()):
            child = ctx.getChild(i)
            if isinstance(child, PATParser.DeclarationContext):
                result = self.visit(child)
                if result:
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
        """Visit channel declaration"""
        name = ctx.IDENT().getText()
        buffer_size = 0
        if ctx.NUMBER():
            buffer_size = int(ctx.NUMBER().getText())
        return ChannelDeclaration(name=name, buffer_size=buffer_size)
    
    def visitProcessDecl(self, ctx: PATParser.ProcessDeclContext) -> ProcessDefinition:
        """Visit process declaration"""
        name = ctx.IDENT().getText()
        params = []
        if ctx.paramList():
            params = self.visit(ctx.paramList())
        
        body = None
        if ctx.processBody():
            body = self.visit(ctx.processBody())
        
        return ProcessDefinition(name=name, parameters=params, body=body)
    
    def visitParamList(self, ctx: PATParser.ParamListContext) -> List[str]:
        """Visit parameter list"""
        params = []
        for i in range(ctx.getChildCount()):
            child = ctx.getChild(i)
            if isinstance(child, PATParser.IdentContext) or hasattr(child, 'IDENT'):
                params.append(child.getText())
        return params
    
    def visitProcessBody(self, ctx: PATParser.ProcessBodyContext) -> Process:
        """Visit process body - top level is parallel composition"""
        return self.visit(ctx.parallelComposition())
    
    def visitParallelComposition(self, ctx: PATParser.ParallelCompositionContext) -> Process:
        """Handle parallel composition with proper precedence"""
        # Get sequential compositions
        seqs = []
        ops = []
        
        for i in range(ctx.getChildCount()):
            child = ctx.getChild(i)
            if isinstance(child, PATParser.SequentialCompositionContext):
                seqs.append(self.visit(child))
            elif hasattr(child, 'getText'):
                text = child.getText()
                if text in ('||', '|~'):
                    ops.append(text)
        
        if not seqs:
            return SkipProcess()
        if len(seqs) == 1:
            return seqs[0]
        
        # Build parallel process
        op = ops[0] if ops else '||'
        return ParallelProcess(operator=op, processes=seqs)
    
    def visitSequentialComposition(self, ctx: PATParser.SequentialCompositionContext) -> Process:
        """Handle sequential composition"""
        procs = []
        
        for i in range(ctx.getChildCount()):
            child = ctx.getChild(i)
            if isinstance(child, PATParser.PrimaryProcessContext):
                procs.append(self.visit(child))
            # Skip arrow tokens
        
        if not procs:
            return SkipProcess()
        if len(procs) == 1:
            return procs[0]
        
        return SequenceProcess(processes=procs)
    
    def visitPrimaryProcess(self, ctx: PATParser.PrimaryProcessContext) -> Process:
        """Handle primary process"""
        # Check what type of primary process this is
        for i in range(ctx.getChildCount()):
            child = ctx.getChild(i)
            if isinstance(child, PATParser.ActionContext):
                return ActionProcess(action=self.visit(child))
            elif isinstance(child, PATParser.GuardedProcessContext):
                return self.visit(child)
            elif isinstance(child, PATParser.ProcessCallContext):
                return self.visit(child)
            elif isinstance(child, PATParser.ChoiceProcessContext):
                return self.visit(child)
            elif isinstance(child, PATParser.BlockProcessContext):
                return self.visit(child)
        
        # Check for Skip keyword
        text = ctx.getText()
        if text in ('Skip', 'SKIP', 'Skip()'):
            return SkipProcess()
        
        return SkipProcess()
    
    def visitAction(self, ctx: PATParser.ActionContext) -> Action:
        """Visit action"""
        for i in range(ctx.getChildCount()):
            child = ctx.getChild(i)
            if isinstance(child, PATParser.CommunicationActionContext):
                return self.visit(child)
            elif isinstance(child, PATParser.AssignmentActionContext):
                return self.visit(child)
            elif isinstance(child, PATParser.InternalActionContext):
                return self.visit(child)
        return InternalAction()
    
    def visitCommunicationAction(self, ctx: PATParser.CommunicationActionContext) -> Action:
        """Visit send/recv action"""
        channel = self.visit(ctx.channelName())
        message = self.visit(ctx.message())
        fields = []
        
        if ctx.fieldList():
            fields = self.visit(ctx.fieldList())
        
        # Check if send (!) or recv (?)
        text = ctx.getText()
        if '!' in text:
            return SendAction(channel=channel, message=message, fields=fields)
        else:
            return ReceiveAction(channel=channel, message=message, fields=fields)
    
    def visitChannelName(self, ctx: PATParser.ChannelNameContext) -> str:
        """Get channel name"""
        return ctx.IDENT().getText()
    
    def visitMessage(self, ctx: PATParser.MessageContext) -> str:
        """Get message name"""
        return ctx.IDENT().getText()
    
    def visitFieldList(self, ctx: PATParser.FieldListContext) -> List[str]:
        """Extract field list"""
        fields = []
        for i in range(ctx.getChildCount()):
            child = ctx.getChild(i)
            if hasattr(child, 'IDENT'):
                fields.append(child.IDENT().getText())
        return fields
    
    def visitAssignmentAction(self, ctx: PATParser.AssignmentActionContext) -> AssignmentAction:
        """Visit assignment action"""
        var = ctx.IDENT().getText()
        index = None
        if ctx.expr(0):
            index = self.visit(ctx.expr(0))
        
        value = self.visit(ctx.expr(-1))
        return AssignmentAction(variable=var, index=index, value=value)
    
    def visitInternalAction(self, ctx: PATParser.InternalActionContext) -> Action:
        """Visit internal action (call or block)"""
        text = ctx.getText()
        if text.startswith('call'):
            func = ctx.IDENT().getText()
            args = []
            if ctx.argList():
                args = self.visit(ctx.argList())
            return CallAction(function=func, args=args)
        else:
            return InternalAction()
    
    def visitGuardedProcess(self, ctx: PATParser.GuardedProcessContext) -> GuardedProcess:
        """Visit guarded process: [expr] -> process"""
        condition = self.visit(ctx.expr())
        process = self.visit(ctx.primaryProcess())
        return GuardedProcess(condition=condition, process=process)
    
    def visitProcessCall(self, ctx: PATParser.ProcessCallContext) -> CallProcess:
        """Visit process call/recursion"""
        name = ctx.IDENT().getText()
        args = []
        if ctx.argList():
            args = self.visit(ctx.argList())
        return CallProcess(name=name, args=args)
    
    def visitArgList(self, ctx: PATParser.ArgListContext) -> List[Expr]:
        """Visit argument list"""
        args = []
        for i in range(ctx.getChildCount()):
            child = ctx.getChild(i)
            if isinstance(child, PATParser.ExprContext):
                args.append(self.visit(child))
        return args
    
    def visitChoiceProcess(self, ctx: PATParser.ChoiceProcessContext) -> ChoiceProcess:
        """Visit non-deterministic choice"""
        procs = []
        for i in range(ctx.getChildCount()):
            child = ctx.getChild(i)
            if isinstance(child, PATParser.ChoiceContext):
                procs.append(self.visit(child))
        return ChoiceProcess(processes=procs) if procs else SkipProcess()
    
    def visitChoice(self, ctx: PATParser.ChoiceContext) -> Process:
        """Visit single choice alternative"""
        return self.visit(ctx.primaryProcess())
    
    def visitBlockProcess(self, ctx: PATParser.BlockProcessContext) -> BlockProcess:
        """Visit block process"""
        proc = None
        if ctx.processBody():
            proc = self.visit(ctx.processBody())
        return BlockProcess(process=proc)
    
    def visitExpr(self, ctx: PATParser.ExprContext) -> Expr:
        """Visit expression"""
        return self.visit(ctx.orExpr())
    
    def visitOrExpr(self, ctx: PATParser.OrExprContext) -> Expr:
        """Visit OR expression"""
        left = self.visit(ctx.andExpr(0))
        for i in range(1, len(ctx.andExpr())):
            right = self.visit(ctx.andExpr(i))
            left = BinaryOpExpr(operator='||', left=left, right=right)
        return left
    
    def visitAndExpr(self, ctx: PATParser.AndExprContext) -> Expr:
        """Visit AND expression"""
        left = self.visit(ctx.comparisonExpr(0))
        for i in range(1, len(ctx.comparisonExpr())):
            right = self.visit(ctx.comparisonExpr(i))
            left = BinaryOpExpr(operator='&&', left=left, right=right)
        return left
    
    def visitComparisonExpr(self, ctx: PATParser.ComparisonExprContext) -> Expr:
        """Visit comparison expression"""
        left = self.visit(ctx.additiveExpr(0))
        for i in range(1, len(ctx.additiveExpr())):
            right = self.visit(ctx.additiveExpr(i))
            left = BinaryOpExpr(operator='==', left=left, right=right)
        return left
    
    def visitAdditiveExpr(self, ctx: PATParser.AdditiveExprContext) -> Expr:
        """Visit additive expression"""
        left = self.visit(ctx.multiplicativeExpr(0))
        for i in range(1, len(ctx.multiplicativeExpr())):
            right = self.visit(ctx.multiplicativeExpr(i))
            left = BinaryOpExpr(operator='+', left=left, right=right)
        return left
    
    def visitMultiplicativeExpr(self, ctx: PATParser.MultiplicativeExprContext) -> Expr:
        """Visit multiplicative expression"""
        left = self.visit(ctx.unaryExpr(0))
        for i in range(1, len(ctx.unaryExpr())):
            right = self.visit(ctx.unaryExpr(i))
            left = BinaryOpExpr(operator='*', left=left, right=right)
        return left
    
    def visitUnaryExpr(self, ctx: PATParser.UnaryExprContext) -> Expr:
        """Visit unary expression"""
        text = ctx.getText()
        if text.startswith('!') or text.startswith('-'):
            op = text[0]
            operand = self.visit(ctx.unaryExpr())
            return UnaryOpExpr(operator=op, operand=operand)
        return self.visit(ctx.primaryExpr())
    
    def visitPrimaryExpr(self, ctx: PATParser.PrimaryExprContext) -> Expr:
        """Visit primary expression"""
        text = ctx.getText()
        
        # Number literal
        if ctx.NUMBER():
            return NumberExpr(value=int(ctx.NUMBER().getText()))
        
        # Boolean literal
        if text in ('true', 'false'):
            return BoolLiteralExpr(value=text == 'true')
        
        # Random expression
        if 'random' in text:
            if ctx.expr():
                max_expr = self.visit(ctx.expr(0))
                return RandomExpr(max_val=max_expr)
        
        # Identifier or function call or array access
        if ctx.IDENT():
            name = ctx.IDENT().getText()
            if ctx.argList():
                args = self.visit(ctx.argList())
                return FunctionCallExpr(name=name, args=args)
            elif ctx.expr():
                index = self.visit(ctx.expr(0))
                return ArrayAccessExpr(array=IdentExpr(name=name), index=index)
            else:
                return IdentExpr(name=name)
        
        # Parenthesized expression
        if ctx.expr() and not ctx.argList():
            return self.visit(ctx.expr(0))
        
        return NumberExpr(value=0)
    
    def visitAssertDecl(self, ctx: PATParser.AssertDeclContext) -> Assertion:
        """Visit assertion"""
        expr = self.visit(ctx.expr())
        return Assertion(property=expr)


class IRBuilder:
    """
    Converts AST to Intermediate Representation (IR) for PRISM generation.
    Flattens process structure into state machines.
    """
    
    def __init__(self):
        self.message_set: Set[str] = set()
        self.state_counter = 0
    
    def build_ir(self, spec: Specification) -> Spec:
        """Build IR from AST specification"""
        ir_spec = Spec()
        
        # Convert channels
        for ch in spec.channels:
            ir_spec.channels.append({
                'name': ch.name,
                'buffer_size': ch.buffer_size
            })
        
        # Convert processes
        for proc_def in spec.processes:
            module = self._process_to_module(proc_def)
            if module:
                ir_spec.processes.append(module)
        
        return ir_spec
    
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
            # For now, handle simple interleaving (linear composition)
            # More sophisticated handling would require process algebra
            current = from_state
            for sub_proc in proc.processes:
                current = self._process_to_transitions(sub_proc, current, module)
            return current
        
        elif isinstance(proc, ChoiceProcess):
            # Non-deterministic choice: create branching
            end_states = []
            to_state = self.state_counter
            self.state_counter += 1
            
            for choice_proc in proc.processes:
                end = self._process_to_transitions(choice_proc, to_state, module)
                end_states.append(end)
            
            # All choices merge to a new state
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
            # Guarded process
            to_state = self.state_counter
            self.state_counter += 1
            
            trans = Transition(
                from_state=from_state,
                to_state=to_state,
                label='guarded',
                guard=Guard(condition=self._expr_to_string(proc.condition))
            )
            module.add_transition(trans)
            
            # Process the guarded process body
            return self._process_to_transitions(proc.process, to_state, module)
        
        elif isinstance(proc, CallProcess):
            # Process call - for now treat as internal action
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
            op = self._expr_to_string(expr.operand)
            return f'{expr.operator}{op}'
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
