from src.pat2prism.ir import Spec, ChannelNode, ProcessNode, ActionNode
from src.pat2prism.prism_generator import render_prism

def test_codegen_basic():
    spec = Spec(
        channels=[ChannelNode('ComSC')],
        processes=[
            ProcessNode('SmartObject', [
                ActionNode('send','ComSC','CoAP_POST',None),
                ActionNode('recv','ComSC','CoAP_ACK','N_C'),
            ])
        ]
    )
    out = render_prism(spec, opts=dict(nonce_size=2, p_flip=0.01, inject_intruder=True))
    assert 'module SmartObject' in out
    assert 'module Intruder' in out
