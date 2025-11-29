from src.pat2prism.antlr_frontend import parse_text

SAMPLE = """
channel ComSC 0;

SmartObject() =
    ComSC!CoAP_POST ->
    ComSC?CoAP_ACK.N_C ->
    Skip();
"""

def test_parse_basic():
    res = parse_text(SAMPLE)
    assert any(it[0] == 'channel' for it in res)
    assert any(it[0] == 'process' for it in res)
