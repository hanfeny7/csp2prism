# Generated from grammar/PAT.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .PATParser import PATParser
else:
    from PATParser import PATParser

# This class defines a complete generic visitor for a parse tree produced by PATParser.

class PATVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by PATParser#spec.
    def visitSpec(self, ctx:PATParser.SpecContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#declaration.
    def visitDeclaration(self, ctx:PATParser.DeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#channelDecl.
    def visitChannelDecl(self, ctx:PATParser.ChannelDeclContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#typeDecl.
    def visitTypeDecl(self, ctx:PATParser.TypeDeclContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#processDecl.
    def visitProcessDecl(self, ctx:PATParser.ProcessDeclContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#paramList.
    def visitParamList(self, ctx:PATParser.ParamListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#processBody.
    def visitProcessBody(self, ctx:PATParser.ProcessBodyContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#parallelComposition.
    def visitParallelComposition(self, ctx:PATParser.ParallelCompositionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#sequentialComposition.
    def visitSequentialComposition(self, ctx:PATParser.SequentialCompositionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#primaryProcess.
    def visitPrimaryProcess(self, ctx:PATParser.PrimaryProcessContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#skipProcess.
    def visitSkipProcess(self, ctx:PATParser.SkipProcessContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#action.
    def visitAction(self, ctx:PATParser.ActionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#communicationAction.
    def visitCommunicationAction(self, ctx:PATParser.CommunicationActionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#channelName.
    def visitChannelName(self, ctx:PATParser.ChannelNameContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#message.
    def visitMessage(self, ctx:PATParser.MessageContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#fieldList.
    def visitFieldList(self, ctx:PATParser.FieldListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#assignmentAction.
    def visitAssignmentAction(self, ctx:PATParser.AssignmentActionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#internalAction.
    def visitInternalAction(self, ctx:PATParser.InternalActionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#guardedProcess.
    def visitGuardedProcess(self, ctx:PATParser.GuardedProcessContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#processCall.
    def visitProcessCall(self, ctx:PATParser.ProcessCallContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#argList.
    def visitArgList(self, ctx:PATParser.ArgListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#choiceProcess.
    def visitChoiceProcess(self, ctx:PATParser.ChoiceProcessContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#primaryBase.
    def visitPrimaryBase(self, ctx:PATParser.PrimaryBaseContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#blockProcess.
    def visitBlockProcess(self, ctx:PATParser.BlockProcessContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#assertDecl.
    def visitAssertDecl(self, ctx:PATParser.AssertDeclContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#expr.
    def visitExpr(self, ctx:PATParser.ExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#orExpr.
    def visitOrExpr(self, ctx:PATParser.OrExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#andExpr.
    def visitAndExpr(self, ctx:PATParser.AndExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#comparisonExpr.
    def visitComparisonExpr(self, ctx:PATParser.ComparisonExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#additiveExpr.
    def visitAdditiveExpr(self, ctx:PATParser.AdditiveExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#multiplicativeExpr.
    def visitMultiplicativeExpr(self, ctx:PATParser.MultiplicativeExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#unaryExpr.
    def visitUnaryExpr(self, ctx:PATParser.UnaryExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PATParser#primaryExpr.
    def visitPrimaryExpr(self, ctx:PATParser.PrimaryExprContext):
        return self.visitChildren(ctx)



del PATParser