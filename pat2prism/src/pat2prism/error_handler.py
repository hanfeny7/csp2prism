"""
Robust error handling and recovery for pat2prism tool.
Provides graceful degradation and detailed diagnostics.
"""
import logging
from typing import Optional, Any, Callable
from dataclasses import dataclass
from enum import Enum

logger = logging.getLogger(__name__)


class ErrorSeverity(Enum):
    """Error severity levels"""
    WARNING = "warning"
    ERROR = "error"
    CRITICAL = "critical"


@dataclass
class TransformationError:
    """Structured error information"""
    severity: ErrorSeverity
    message: str
    context: Optional[str] = None
    line_number: Optional[int] = None
    suggestion: Optional[str] = None


class ErrorCollector:
    """Collects and manages errors during transformation"""
    
    def __init__(self):
        self.errors: list[TransformationError] = []
        self.warnings: list[TransformationError] = []
    
    def add_error(self, message: str, context: str = None, 
                  line: int = None, suggestion: str = None):
        """Add an error"""
        err = TransformationError(
            severity=ErrorSeverity.ERROR,
            message=message,
            context=context,
            line_number=line,
            suggestion=suggestion
        )
        self.errors.append(err)
        logger.error(self._format_error(err))
    
    def add_warning(self, message: str, context: str = None, 
                    line: int = None, suggestion: str = None):
        """Add a warning"""
        warn = TransformationError(
            severity=ErrorSeverity.WARNING,
            message=message,
            context=context,
            line_number=line,
            suggestion=suggestion
        )
        self.warnings.append(warn)
        logger.warning(self._format_error(warn))
    
    def _format_error(self, err: TransformationError) -> str:
        """Format error for display"""
        parts = [f"[{err.severity.value.upper()}] {err.message}"]
        if err.line_number:
            parts.append(f" (line {err.line_number})")
        if err.context:
            parts.append(f"\n  Context: {err.context}")
        if err.suggestion:
            parts.append(f"\n  Suggestion: {err.suggestion}")
        return "".join(parts)
    
    def has_errors(self) -> bool:
        """Check if any errors were collected"""
        return len(self.errors) > 0
    
    def get_report(self) -> str:
        """Generate comprehensive error report"""
        lines = []
        if self.warnings:
            lines.append(f"\n=== Warnings ({len(self.warnings)}) ===")
            for w in self.warnings:
                lines.append(self._format_error(w))
        if self.errors:
            lines.append(f"\n=== Errors ({len(self.errors)}) ===")
            for e in self.errors:
                lines.append(self._format_error(e))
        return "\n".join(lines) if lines else "No errors or warnings."


def safe_visit(visitor_func: Callable, ctx: Any, 
               default_value: Any = None,
               error_collector: Optional[ErrorCollector] = None,
               context_name: str = "unknown") -> Any:
    """
    Safely visit a parse tree node with error recovery.
    
    Args:
        visitor_func: The visitor method to call
        ctx: The parse tree context
        default_value: Value to return on error
        error_collector: Optional error collector
        context_name: Name of the context for error reporting
    
    Returns:
        Result of visitor_func or default_value on error
    """
    if ctx is None:
        return default_value
    
    try:
        return visitor_func(ctx)
    except AttributeError as e:
        msg = f"Missing attribute in {context_name}: {e}"
        if error_collector:
            error_collector.add_warning(
                msg, 
                context=str(ctx.getText() if hasattr(ctx, 'getText') else ctx)[:100],
                suggestion="This PAT construct may not be fully supported yet."
            )
        else:
            logger.warning(msg)
        return default_value
    except Exception as e:
        msg = f"Error visiting {context_name}: {type(e).__name__}: {e}"
        if error_collector:
            error_collector.add_error(
                msg,
                context=str(ctx.getText() if hasattr(ctx, 'getText') else ctx)[:100],
                suggestion="Check PAT syntax or report this as a bug."
            )
        else:
            logger.error(msg)
        return default_value


def safe_get_text(ctx: Any, default: str = "") -> str:
    """Safely get text from a parse tree context"""
    try:
        return ctx.getText() if ctx and hasattr(ctx, 'getText') else default
    except Exception:
        return default


def safe_get_int(ctx: Any, default: int = 0) -> int:
    """Safely parse integer from context"""
    try:
        text = safe_get_text(ctx)
        return int(text) if text else default
    except ValueError:
        return default


def validate_identifier(name: str, error_collector: Optional[ErrorCollector] = None) -> bool:
    """
    Validate that a name is a valid PRISM identifier.
    
    Args:
        name: Identifier to validate
        error_collector: Optional error collector
    
    Returns:
        True if valid, False otherwise
    """
    if not name:
        return False
    
    # PRISM identifiers: [a-zA-Z_][a-zA-Z0-9_]*
    # Also avoid PRISM keywords
    prism_keywords = {
        'module', 'endmodule', 'const', 'formula', 'label', 'init', 'endinit',
        'rewards', 'endrewards', 'true', 'false', 'bool', 'int', 'double',
        'min', 'max', 'floor', 'ceil', 'pow', 'mod', 'log'
    }
    
    if name.lower() in prism_keywords:
        if error_collector:
            error_collector.add_warning(
                f"Identifier '{name}' is a PRISM keyword",
                suggestion=f"Consider renaming to '{name}_var' or similar"
            )
        return False
    
    if not name[0].isalpha() and name[0] != '_':
        if error_collector:
            error_collector.add_error(
                f"Invalid identifier '{name}': must start with letter or underscore"
            )
        return False
    
    if not all(c.isalnum() or c == '_' for c in name):
        if error_collector:
            error_collector.add_error(
                f"Invalid identifier '{name}': contains invalid characters"
            )
        return False
    
    return True
