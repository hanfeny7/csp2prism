# Generated from pat2prism/grammar/PAT.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .PATParser import PATParser
else:
    from PATParser import PATParser

# This class defines a complete listener for a parse tree produced by PATParser.
class PATListener(ParseTreeListener):

    # Enter a parse tree produced by PATParser#spec.
    def enterSpec(self, ctx:PATParser.SpecContext):
        pass

    # Exit a parse tree produced by PATParser#spec.
    def exitSpec(self, ctx:PATParser.SpecContext):
        pass


    # Enter a parse tree produced by PATParser#declaration.
    def enterDeclaration(self, ctx:PATParser.DeclarationContext):
        pass

    # Exit a parse tree produced by PATParser#declaration.
    def exitDeclaration(self, ctx:PATParser.DeclarationContext):
        pass


    # Enter a parse tree produced by PATParser#channelDecl.
    def enterChannelDecl(self, ctx:PATParser.ChannelDeclContext):
        pass

    # Exit a parse tree produced by PATParser#channelDecl.
    def exitChannelDecl(self, ctx:PATParser.ChannelDeclContext):
        pass


    # Enter a parse tree produced by PATParser#typeDecl.
    def enterTypeDecl(self, ctx:PATParser.TypeDeclContext):
        pass

    # Exit a parse tree produced by PATParser#typeDecl.
    def exitTypeDecl(self, ctx:PATParser.TypeDeclContext):
        pass


    # Enter a parse tree produced by PATParser#enumBody.
    def enterEnumBody(self, ctx:PATParser.EnumBodyContext):
        pass

    # Exit a parse tree produced by PATParser#enumBody.
    def exitEnumBody(self, ctx:PATParser.EnumBodyContext):
        pass


    # Enter a parse tree produced by PATParser#initExpr.
    def enterInitExpr(self, ctx:PATParser.InitExprContext):
        pass

    # Exit a parse tree produced by PATParser#initExpr.
    def exitInitExpr(self, ctx:PATParser.InitExprContext):
        pass


    # Enter a parse tree produced by PATParser#arrayInit.
    def enterArrayInit(self, ctx:PATParser.ArrayInitContext):
        pass

    # Exit a parse tree produced by PATParser#arrayInit.
    def exitArrayInit(self, ctx:PATParser.ArrayInitContext):
        pass


    # Enter a parse tree produced by PATParser#exprList.
    def enterExprList(self, ctx:PATParser.ExprListContext):
        pass

    # Exit a parse tree produced by PATParser#exprList.
    def exitExprList(self, ctx:PATParser.ExprListContext):
        pass


    # Enter a parse tree produced by PATParser#processDecl.
    def enterProcessDecl(self, ctx:PATParser.ProcessDeclContext):
        pass

    # Exit a parse tree produced by PATParser#processDecl.
    def exitProcessDecl(self, ctx:PATParser.ProcessDeclContext):
        pass


    # Enter a parse tree produced by PATParser#paramList.
    def enterParamList(self, ctx:PATParser.ParamListContext):
        pass

    # Exit a parse tree produced by PATParser#paramList.
    def exitParamList(self, ctx:PATParser.ParamListContext):
        pass


    # Enter a parse tree produced by PATParser#processBody.
    def enterProcessBody(self, ctx:PATParser.ProcessBodyContext):
        pass

    # Exit a parse tree produced by PATParser#processBody.
    def exitProcessBody(self, ctx:PATParser.ProcessBodyContext):
        pass


    # Enter a parse tree produced by PATParser#parallelComposition.
    def enterParallelComposition(self, ctx:PATParser.ParallelCompositionContext):
        pass

    # Exit a parse tree produced by PATParser#parallelComposition.
    def exitParallelComposition(self, ctx:PATParser.ParallelCompositionContext):
        pass


    # Enter a parse tree produced by PATParser#sequentialComposition.
    def enterSequentialComposition(self, ctx:PATParser.SequentialCompositionContext):
        pass

    # Exit a parse tree produced by PATParser#sequentialComposition.
    def exitSequentialComposition(self, ctx:PATParser.SequentialCompositionContext):
        pass


    # Enter a parse tree produced by PATParser#primaryProcess.
    def enterPrimaryProcess(self, ctx:PATParser.PrimaryProcessContext):
        pass

    # Exit a parse tree produced by PATParser#primaryProcess.
    def exitPrimaryProcess(self, ctx:PATParser.PrimaryProcessContext):
        pass


    # Enter a parse tree produced by PATParser#skipProcess.
    def enterSkipProcess(self, ctx:PATParser.SkipProcessContext):
        pass

    # Exit a parse tree produced by PATParser#skipProcess.
    def exitSkipProcess(self, ctx:PATParser.SkipProcessContext):
        pass


    # Enter a parse tree produced by PATParser#ifElseProcess.
    def enterIfElseProcess(self, ctx:PATParser.IfElseProcessContext):
        pass

    # Exit a parse tree produced by PATParser#ifElseProcess.
    def exitIfElseProcess(self, ctx:PATParser.IfElseProcessContext):
        pass


    # Enter a parse tree produced by PATParser#action.
    def enterAction(self, ctx:PATParser.ActionContext):
        pass

    # Exit a parse tree produced by PATParser#action.
    def exitAction(self, ctx:PATParser.ActionContext):
        pass


    # Enter a parse tree produced by PATParser#communicationAction.
    def enterCommunicationAction(self, ctx:PATParser.CommunicationActionContext):
        pass

    # Exit a parse tree produced by PATParser#communicationAction.
    def exitCommunicationAction(self, ctx:PATParser.CommunicationActionContext):
        pass


    # Enter a parse tree produced by PATParser#channelName.
    def enterChannelName(self, ctx:PATParser.ChannelNameContext):
        pass

    # Exit a parse tree produced by PATParser#channelName.
    def exitChannelName(self, ctx:PATParser.ChannelNameContext):
        pass


    # Enter a parse tree produced by PATParser#msgExpr.
    def enterMsgExpr(self, ctx:PATParser.MsgExprContext):
        pass

    # Exit a parse tree produced by PATParser#msgExpr.
    def exitMsgExpr(self, ctx:PATParser.MsgExprContext):
        pass


    # Enter a parse tree produced by PATParser#assignmentAction.
    def enterAssignmentAction(self, ctx:PATParser.AssignmentActionContext):
        pass

    # Exit a parse tree produced by PATParser#assignmentAction.
    def exitAssignmentAction(self, ctx:PATParser.AssignmentActionContext):
        pass


    # Enter a parse tree produced by PATParser#internalAction.
    def enterInternalAction(self, ctx:PATParser.InternalActionContext):
        pass

    # Exit a parse tree produced by PATParser#internalAction.
    def exitInternalAction(self, ctx:PATParser.InternalActionContext):
        pass


    # Enter a parse tree produced by PATParser#codeStatement.
    def enterCodeStatement(self, ctx:PATParser.CodeStatementContext):
        pass

    # Exit a parse tree produced by PATParser#codeStatement.
    def exitCodeStatement(self, ctx:PATParser.CodeStatementContext):
        pass


    # Enter a parse tree produced by PATParser#ifStatement.
    def enterIfStatement(self, ctx:PATParser.IfStatementContext):
        pass

    # Exit a parse tree produced by PATParser#ifStatement.
    def exitIfStatement(self, ctx:PATParser.IfStatementContext):
        pass


    # Enter a parse tree produced by PATParser#guardedProcess.
    def enterGuardedProcess(self, ctx:PATParser.GuardedProcessContext):
        pass

    # Exit a parse tree produced by PATParser#guardedProcess.
    def exitGuardedProcess(self, ctx:PATParser.GuardedProcessContext):
        pass


    # Enter a parse tree produced by PATParser#processCall.
    def enterProcessCall(self, ctx:PATParser.ProcessCallContext):
        pass

    # Exit a parse tree produced by PATParser#processCall.
    def exitProcessCall(self, ctx:PATParser.ProcessCallContext):
        pass


    # Enter a parse tree produced by PATParser#argList.
    def enterArgList(self, ctx:PATParser.ArgListContext):
        pass

    # Exit a parse tree produced by PATParser#argList.
    def exitArgList(self, ctx:PATParser.ArgListContext):
        pass


    # Enter a parse tree produced by PATParser#choiceProcess.
    def enterChoiceProcess(self, ctx:PATParser.ChoiceProcessContext):
        pass

    # Exit a parse tree produced by PATParser#choiceProcess.
    def exitChoiceProcess(self, ctx:PATParser.ChoiceProcessContext):
        pass


    # Enter a parse tree produced by PATParser#primaryBase.
    def enterPrimaryBase(self, ctx:PATParser.PrimaryBaseContext):
        pass

    # Exit a parse tree produced by PATParser#primaryBase.
    def exitPrimaryBase(self, ctx:PATParser.PrimaryBaseContext):
        pass


    # Enter a parse tree produced by PATParser#blockProcess.
    def enterBlockProcess(self, ctx:PATParser.BlockProcessContext):
        pass

    # Exit a parse tree produced by PATParser#blockProcess.
    def exitBlockProcess(self, ctx:PATParser.BlockProcessContext):
        pass


    # Enter a parse tree produced by PATParser#assertDecl.
    def enterAssertDecl(self, ctx:PATParser.AssertDeclContext):
        pass

    # Exit a parse tree produced by PATParser#assertDecl.
    def exitAssertDecl(self, ctx:PATParser.AssertDeclContext):
        pass


    # Enter a parse tree produced by PATParser#expr.
    def enterExpr(self, ctx:PATParser.ExprContext):
        pass

    # Exit a parse tree produced by PATParser#expr.
    def exitExpr(self, ctx:PATParser.ExprContext):
        pass


    # Enter a parse tree produced by PATParser#orExpr.
    def enterOrExpr(self, ctx:PATParser.OrExprContext):
        pass

    # Exit a parse tree produced by PATParser#orExpr.
    def exitOrExpr(self, ctx:PATParser.OrExprContext):
        pass


    # Enter a parse tree produced by PATParser#andExpr.
    def enterAndExpr(self, ctx:PATParser.AndExprContext):
        pass

    # Exit a parse tree produced by PATParser#andExpr.
    def exitAndExpr(self, ctx:PATParser.AndExprContext):
        pass


    # Enter a parse tree produced by PATParser#comparisonExpr.
    def enterComparisonExpr(self, ctx:PATParser.ComparisonExprContext):
        pass

    # Exit a parse tree produced by PATParser#comparisonExpr.
    def exitComparisonExpr(self, ctx:PATParser.ComparisonExprContext):
        pass


    # Enter a parse tree produced by PATParser#additiveExpr.
    def enterAdditiveExpr(self, ctx:PATParser.AdditiveExprContext):
        pass

    # Exit a parse tree produced by PATParser#additiveExpr.
    def exitAdditiveExpr(self, ctx:PATParser.AdditiveExprContext):
        pass


    # Enter a parse tree produced by PATParser#multiplicativeExpr.
    def enterMultiplicativeExpr(self, ctx:PATParser.MultiplicativeExprContext):
        pass

    # Exit a parse tree produced by PATParser#multiplicativeExpr.
    def exitMultiplicativeExpr(self, ctx:PATParser.MultiplicativeExprContext):
        pass


    # Enter a parse tree produced by PATParser#unaryExpr.
    def enterUnaryExpr(self, ctx:PATParser.UnaryExprContext):
        pass

    # Exit a parse tree produced by PATParser#unaryExpr.
    def exitUnaryExpr(self, ctx:PATParser.UnaryExprContext):
        pass


    # Enter a parse tree produced by PATParser#primaryExpr.
    def enterPrimaryExpr(self, ctx:PATParser.PrimaryExprContext):
        pass

    # Exit a parse tree produced by PATParser#primaryExpr.
    def exitPrimaryExpr(self, ctx:PATParser.PrimaryExprContext):
        pass



del PATParser