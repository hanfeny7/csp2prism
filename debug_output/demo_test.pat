channel ComSC 0;
channel ComCA 0;

var PSK = 1234;
var ID_P = 1;

SmartObject() =
    ComSC!LO_CoAP_POST.ID_P.N_P ->
    ComSC?EAP_Response.MAC ->
    Skip();

Controller() =
    ComSC?LO_CoAP_POST.ID_P_1.N_P_1 ->
    ComSC!EAP_Response.MAC ->
    Skip();

System() = SmartObject() || Controller();
