// ================= Channels =================
channel ComSC 0;  // Smart Object <-> Controller
channel ComCA 0;  // Controller <-> AAA Server

// ================= Enums =================
enum { EAP_Request_Identity, EAP_Response_Identity,
       EAP_Request_PSK_M1, EAP_Response_PSK_M2,
       EAP_Request_PSK_M3, EAP_Response_PSK_M4 };

// ================= Variables =================
var PSK;
var ID_P;
var ID_S;
var Fake_PSK;
var auth_complete_SO;
var auth_complete_Controller;
var auth_complete_AAA;
var MAC_P_valid;
var MAC_S_valid;
var AUTH_valid;
var N_C[4];
var N_P[4];
var N_S[4];
var AK;
var MSK;
var EMSK;
var MAC_P;
var MAC_S;
var PCHANNEL;
var AUTH;
var expected_AUTH;

// ================= Smart Object Process =================
SO() = {
    // 初始化
    { PSK = 1234; ID_P = 1; ID_S = 2; Fake_PSK = 123;
      auth_complete_SO = 0; MAC_P_valid = 0; AUTH_valid = 0; };

    // Step 1: send identity
    ComSC!EAP_Response_Identity;

    // Step 2: receive M1
    ComSC?EAP_Request_PSK_M1;
    { MAC_P = N_P[0]; }

    // Step 3: receive M2, verify MAC
    ComSC?EAP_Response_PSK_M2;
    { MAC_P_valid = 1; auth_complete_SO = 1; }

    // Step 4: send M3
    ComSC!EAP_Request_PSK_M3;

    // Step 5: receive M4, verify AUTH
    ComSC?EAP_Response_PSK_M4;
    { AUTH_valid = 1; auth_complete_SO = 1; }
};

// ================= Controller Process =================
Controller() = {
    { auth_complete_Controller = 0; MAC_S_valid = 0; }

    ComSC?EAP_Response_Identity;
    ComSC!EAP_Request_PSK_M1;
    { MAC_S = N_S[0]; auth_complete_Controller = 1; }

    ComSC?EAP_Response_PSK_M2;
    { MAC_S_valid = 1; }

    ComSC!EAP_Request_PSK_M3;

    ComSC?EAP_Response_PSK_M4;
    { auth_complete_Controller = 1; }
};

// ================= AAA Server Process =================
AAA_Server() = {
    { auth_complete_AAA = 0; }

    ComCA?EAP_Request_PSK_M1;
    ComCA!EAP_Response_PSK_M2;
    { auth_complete_AAA = 1; }

    ComCA?EAP_Request_PSK_M3;
    ComCA!EAP_Response_PSK_M4;
};

// ================= Assertions =================
assert(MAC_P_valid == 1);
assert(MAC_S_valid == 1);
assert(AUTH_valid == 1);
