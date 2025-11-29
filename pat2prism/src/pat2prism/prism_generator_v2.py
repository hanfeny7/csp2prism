"""
IR -> PRISM generator using Jinja2 templates.
Produces an MDP PRISM model string from Spec (channels + processes).
"""
from jinja2 import Environment, FileSystemLoader
import os
from .ir import Spec

TEMPLATE_DIR = os.path.join(os.path.dirname(__file__), 'templates')
env = Environment(loader=FileSystemLoader(TEMPLATE_DIR), trim_blocks=True, lstrip_blocks=True)


def render_prism(spec: Spec, opts: dict) -> str:
    """
    Render the PRISM model from IR `spec` using Jinja2 template.
    This prepares:
      - msgs: ordered list of unique message names (first element 'NO_MSG')
      - msgs_map: dict mapping message -> index (for template lookup)
    """
    # Collect all messages
    msgs = spec.message_names
    msgs_map = {m: i for i, m in enumerate(msgs)}
    
    # Prepare channel info for template
    channels = [{'name': ch['name'], 'buffer_size': ch.get('buffer_size', 0)} 
                for ch in spec.channels]
    
    # Prepare process info for template
    processes = []
    for proc_module in spec.processes:
        proc_info = {
            'name': proc_module.name,
            'states': proc_module.states,
            'initial_state': proc_module.initial_state,
            'transitions': proc_module.transitions,
        }
        processes.append(proc_info)
    
    tpl = env.get_template('prism_model.jinja2')
    return tpl.render(
        spec=spec,
        channels=channels,
        processes=processes,
        msgs=msgs,
        msgs_map=msgs_map,
        opts=opts
    )
