"""
Enhanced PRISM generator using improved IR and templates.
Produces more accurate PRISM models for security protocol verification.
"""
from jinja2 import Environment, FileSystemLoader
import os
from .ir import Spec

TEMPLATE_DIR = os.path.join(os.path.dirname(__file__), 'templates')
env = Environment(loader=FileSystemLoader(TEMPLATE_DIR), trim_blocks=True, lstrip_blocks=True)


def render_prism_enhanced(spec: Spec, opts: dict = None) -> str:
    """
    Render enhanced PRISM model from IR spec.
    Uses improved template with:
    - Proper variable type declarations
    - Synchronization labels for send/recv
    - Message field extraction
    - Placeholders for manual refinement
    """
    if opts is None:
        opts = {}
    
    # Collect all unique messages from all processes
    msgs = ['NO_MSG']  # Always include NO_MSG as first message
    for proc in spec.processes:
        for trans in proc.transitions:
            if trans.message and trans.message not in msgs:
                msgs.append(trans.message)
    
    # Build message index mapping
    msgs_map = {m: i for i, m in enumerate(msgs)}
    
    # Prepare channels list
    channels = spec.channels
    
    # Prepare processes list
    processes = spec.processes
    
    # Load and render enhanced template
    try:
        tpl = env.get_template('prism_model_enhanced.jinja2')
    except Exception:
        # Fallback to original template if enhanced not found
        tpl = env.get_template('prism_model.jinja2')
    
    return tpl.render(
        spec=spec,
        msgs=msgs,
        msgs_map=msgs_map,
        channels=channels,
        processes=processes,
        opts=opts
    )


def render_prism(spec: Spec, opts: dict = None) -> str:
    """
    Wrapper function for backward compatibility.
    Calls render_prism_enhanced.
    """
    return render_prism_enhanced(spec, opts)
