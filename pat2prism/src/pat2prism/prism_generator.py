"""
IR -> PRISM generator using Jinja2 templates.
Produces an MDP PRISM model string from Spec (channels + processes).
"""
from jinja2 import Environment, FileSystemLoader
import os
from .ir import Spec

TEMPLATE_DIR = os.path.join(os.path.dirname(__file__),  'templates')
env = Environment(loader=FileSystemLoader(TEMPLATE_DIR), trim_blocks=True, lstrip_blocks=True)

def render_prism(spec: Spec, opts: dict) -> str:
    """
    Render the PRISM model from IR `spec` using Jinja2 template.
    This prepares:
      - msgs: ordered list of unique message names (first element 'NO_MSG')
      - msgs_map: dict mapping message -> index (for template lookup)
    """
    # collect messages from processes
    msgs = ['NO_MSG']
    for p in spec.processes:
        for a in p.actions:
            if getattr(a, 'kind', None) in ('send', 'recv') and getattr(a, 'message', None):
                if a.message not in msgs:
                    msgs.append(a.message)

    # build mapping message -> index
    msgs_map = {m: i for i, m in enumerate(msgs)}

    tpl = env.get_template('prism_model.jinja2')
    return tpl.render(spec=spec, msgs=msgs, msgs_map=msgs_map, opts=opts)
