// ===================================================
// Generated PRISM MDP model (from pat2prism)
// Processes, channels, and synchronization
// ===================================================

mdp

// ===== Parameters =====
const double p_flip = 0.02;
const int MAX_NONCE = 2;

// ===== Message Encoding =====
// Message indices for channel communication// 0 -> NO_MSG// 1 -> CoAP_ACK// 2 -> EAP_Request_PSK_M1// 3 -> EAP_Request_PSK_M3// 4 -> EAP_Response_PSK_M2// 5 -> EAP_Response_PSK_M4// 6 -> EAP_Success// 7 -> Final_CoAP_POST// 8 -> LO_CoAP_POST
// ===== Global Variables =====
global chan_ComSC : [0..8] init 0;
global chan_ComCA : [0..8] init 0;
global EAP_TYPES : enum;
global PSK : var 1234;
global ID_P : var 1;
global ID_S : var 2;
global auth_complete_SO : var false;
global auth_complete_Controller : var false;
global auth_complete_AAA : var false;
global MAC_P_valid : var false;
global MAC_S_valid : var false;
global AUTH_valid : var false;
global random_var : var [101,1011,1001,1101];
global N_C : var 0;
global N_P : var 0;
global N_S : var 0;
global AK : var 0;
global MSK : var 0;
global EMSK : var 0;
global MAC_P : var 0;
global MAC_S : var 0;
global PCHANNEL : var 0;
global AUTH : var 0;
global expected_AUTH : var 0;

// ===== Process Modules =====
module SmartObject
  s : [0..21] init 0;

    // Transition 0: call_Generate_N_P
    [] s=0 ->
    (s' = 1);

    // Transition 1: send_LO_CoAP_POST
    [] s=1 ->
    (chan_ComSC' = 8) & (s' = 2);

    // Transition 2: recv_EAP_Request_PSK_M1
    [] s=2 ->
    (s' = 3); // recv EAP_Request_PSK_M1

    // Transition 3: call_Compute_AK
    [] s=3 ->
    (s' = 4);

    // Transition 4: call_Compute_MAC_P
    [] s=4 ->
    (s' = 5);

    // Transition 5: send_EAP_Response_PSK_M2
    [] s=5 ->
    (chan_ComSC' = 4) & (s' = 6);

    // Transition 6: recv_EAP_Request_PSK_M3
    [] s=6 ->
    (s' = 7); // recv EAP_Request_PSK_M3

    // Transition 7: call_Verify_MAC_S
    [] s=7 ->
    (s' = 8);

    // Transition 8: guarded
    [] s=8 & ((MAC_S_valid == true)) ->
    (s' = 9);

    // Transition 9: send_EAP_Response_PSK_M4
    [] s=9 ->
    (chan_ComSC' = 5) & (s' = 10);

    // Transition 10: recv_Final_CoAP_POST
    [] s=10 ->
    (s' = 11); // recv Final_CoAP_POST

    // Transition 11: call_Verify_AUTH
    [] s=11 ->
    (s' = 12);

    // Transition 12: guarded
    [] s=12 & ((AUTH_valid == true)) ->
    (s' = 13);

    // Transition 13: send_CoAP_ACK
    [] s=13 ->
    (chan_ComSC' = 1) & (s' = 14);

    // Transition 14: call_Derive_MSK_EMSK
    [] s=14 ->
    (s' = 15);

    // Transition 15: assign_auth_complete_SO
    [] s=15 ->
    (auth_complete_SO' = true) & (s' = 16);

    // Transition 16: internal
    [] s=17 ->
    (s' = 18);

    // Transition 17: internal
    [] s=17 ->
    (s' = 19);

    // Transition 18: internal
    [] s=17 ->
    (s' = 20);

    // Transition 19: internal
    [] s=18 ->
    (s' = 20);

    // Transition 20: internal
    [] s=19 ->
    (s' = 20);


  // Final state (self-loop)
  [] s=21 -> (s' = 21);

endmodule
module Controller
  s : [0..18] init 0;

    // Transition 0: recv_LO_CoAP_POST
    [] s=0 ->
    (s' = 1); // recv LO_CoAP_POST

    // Transition 1: send_LO_CoAP_POST
    [] s=1 ->
    (chan_ComCA' = 8) & (s' = 2);

    // Transition 2: recv_EAP_Request_PSK_M1
    [] s=2 ->
    (s' = 3); // recv EAP_Request_PSK_M1

    // Transition 3: send_EAP_Request_PSK_M1
    [] s=3 ->
    (chan_ComSC' = 2) & (s' = 4);

    // Transition 4: recv_EAP_Response_PSK_M2
    [] s=4 ->
    (s' = 5); // recv EAP_Response_PSK_M2

    // Transition 5: send_EAP_Response_PSK_M2
    [] s=5 ->
    (chan_ComCA' = 4) & (s' = 6);

    // Transition 6: recv_EAP_Request_PSK_M3
    [] s=6 ->
    (s' = 7); // recv EAP_Request_PSK_M3

    // Transition 7: send_EAP_Request_PSK_M3
    [] s=7 ->
    (chan_ComSC' = 3) & (s' = 8);

    // Transition 8: recv_EAP_Response_PSK_M4
    [] s=8 ->
    (s' = 9); // recv EAP_Response_PSK_M4

    // Transition 9: send_EAP_Response_PSK_M4
    [] s=9 ->
    (chan_ComCA' = 5) & (s' = 10);

    // Transition 10: recv_EAP_Success
    [] s=10 ->
    (s' = 11); // recv EAP_Success

    // Transition 11: call_Generate_N_C
    [] s=11 ->
    (s' = 12);

    // Transition 12: call_Compute_AUTH
    [] s=12 ->
    (s' = 13);

    // Transition 13: send_Final_CoAP_POST
    [] s=13 ->
    (chan_ComSC' = 7) & (s' = 14);

    // Transition 14: recv_CoAP_ACK
    [] s=14 ->
    (s' = 15); // recv CoAP_ACK

    // Transition 15: assign_auth_complete_Controller
    [] s=15 ->
    (auth_complete_Controller' = true) & (s' = 16);

    // Transition 16: call_Controller
    [] s=16 ->
    (s' = 17);


  // Final state (self-loop)
  [] s=18 -> (s' = 18);

endmodule
module AAA_Server
  s : [0..18] init 0;

    // Transition 0: recv_LO_CoAP_POST
    [] s=0 ->
    (s' = 1); // recv LO_CoAP_POST

    // Transition 1: call_Generate_N_S
    [] s=1 ->
    (s' = 2);

    // Transition 2: send_EAP_Request_PSK_M1
    [] s=2 ->
    (chan_ComCA' = 2) & (s' = 3);

    // Transition 3: recv_EAP_Response_PSK_M2
    [] s=3 ->
    (s' = 4); // recv EAP_Response_PSK_M2

    // Transition 4: call_Compute_AK
    [] s=4 ->
    (s' = 5);

    // Transition 5: call_Compute_MAC_P
    [] s=5 ->
    (s' = 6);

    // Transition 6: call_Verify_MAC_P
    [] s=6 ->
    (s' = 7);

    // Transition 7: guarded
    [] s=7 & ((MAC_P_valid == true)) ->
    (s' = 8);

    // Transition 8: call_Compute_MAC_S
    [] s=8 ->
    (s' = 9);

    // Transition 9: send_EAP_Request_PSK_M3
    [] s=9 ->
    (chan_ComCA' = 3) & (s' = 10);

    // Transition 10: recv_EAP_Response_PSK_M4
    [] s=10 ->
    (s' = 11); // recv EAP_Response_PSK_M4

    // Transition 11: call_Derive_MSK_EMSK
    [] s=11 ->
    (s' = 12);

    // Transition 12: send_EAP_Success
    [] s=12 ->
    (chan_ComCA' = 6) & (s' = 13);

    // Transition 13: assign_auth_complete_AAA
    [] s=13 ->
    (auth_complete_AAA' = true) & (s' = 14);

    // Transition 14: internal
    [] s=15 ->
    (s' = 16);

    // Transition 15: internal
    [] s=15 ->
    (s' = 17);

    // Transition 16: internal
    [] s=16 ->
    (s' = 17);


  // Final state (self-loop)
  [] s=18 -> (s' = 18);

endmodule
module System
  s : [0..4] init 0;

    // Transition 0: call_SmartObject
    [] s=0 ->
    (s' = 1);

    // Transition 1: call_Controller
    [] s=1 ->
    (s' = 2);

    // Transition 2: call_AAA_Server
    [] s=2 ->
    (s' = 3);


  // Final state (self-loop)
  [] s=4 -> (s' = 4);

endmodule
// ===== Labels (Observables) =====
// Generic labels - customize for your protocol
label "error" = false; // Update with protocol-specific error condition