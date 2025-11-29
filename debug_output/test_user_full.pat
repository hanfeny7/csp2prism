channel ComSC 0;
channel ComCA 0;

enum {EAP_Request_PSK_M1, EAP_Response_PSK_M2, LO_CoAP_POST};

var PSK = 1234;
var ID_P = 1;

SmartObject() =
    ComSC!LO_CoAP_POST.ID_P ->
    ComSC?EAP_Request_PSK_M1 ->
    Skip();

Controller() =
    ComSC?LO_CoAP_POST.ID_P_1 ->
    ComSC!EAP_Request_PSK_M1 ->
    Skip();

System() = SmartObject() || Controller();
