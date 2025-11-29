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
global EAP_TYPES : [0..10] init 0;
global PSK : 1234;
global ID_P : 1;
global ID_S : 2;
global auth_complete_SO : false;
global auth_complete_Controller : false;
global auth_complete_AAA : false;
global MAC_P_valid : false;
global MAC_S_valid : false;
global AUTH_valid : false;
global N_C : 0;
global N_P : 0;
global N_S : 0;
global AK : 0;
global MSK : 0;
global EMSK : 0;
global MAC_P : 0;
global MAC_S : 0;
global PCHANNEL : 0;
global AUTH : 0;
global expected_AUTH : 0;

// ===== Process Modules =====
module SmartObject
  s : [0..9] init 0;

    // Transition 0: send_LO_CoAP_POST
    [] s=0 ->
    (chan_ComSC' = 8) & (s' = 1);

    // Transition 1: recv_EAP_Request_PSK_M1
    [] s=1 ->
    (s' = 2); // recv EAP_Request_PSK_M1

    // Transition 2: send_EAP_Response_PSK_M2
    [] s=2 ->
    (chan_ComSC' = 4) & (s' = 3);

    // Transition 3: recv_EAP_Request_PSK_M3
    [] s=3 ->
    (s' = 4); // recv EAP_Request_PSK_M3

    // Transition 4: send_EAP_Response_PSK_M4
    [] s=4 ->
    (chan_ComSC' = 5) & (s' = 5);

    // Transition 5: recv_Final_CoAP_POST
    [] s=5 ->
    (s' = 6); // recv Final_CoAP_POST

    // Transition 6: send_CoAP_ACK
    [] s=6 ->
    (chan_ComSC' = 1) & (s' = 7);

    // Transition 7: assign_auth_complete_SO
    [] s=7 ->
    (auth_complete_SO' = true) & (s' = 8);


  // Final state (self-loop)
  [] s=9 -> (s' = 9);

endmodule
module Controller
  s : [0..15] init 0;

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

    // Transition 11: send_Final_CoAP_POST
    [] s=11 ->
    (chan_ComSC' = 7) & (s' = 12);

    // Transition 12: recv_CoAP_ACK
    [] s=12 ->
    (s' = 13); // recv CoAP_ACK

    // Transition 13: assign_auth_complete_Controller
    [] s=13 ->
    (auth_complete_Controller' = true) & (s' = 14);


  // Final state (self-loop)
  [] s=15 -> (s' = 15);

endmodule
module AAA_Server
  s : [0..8] init 0;

    // Transition 0: recv_LO_CoAP_POST
    [] s=0 ->
    (s' = 1); // recv LO_CoAP_POST

    // Transition 1: send_EAP_Request_PSK_M1
    [] s=1 ->
    (chan_ComCA' = 2) & (s' = 2);

    // Transition 2: recv_EAP_Response_PSK_M2
    [] s=2 ->
    (s' = 3); // recv EAP_Response_PSK_M2

    // Transition 3: send_EAP_Request_PSK_M3
    [] s=3 ->
    (chan_ComCA' = 3) & (s' = 4);

    // Transition 4: recv_EAP_Response_PSK_M4
    [] s=4 ->
    (s' = 5); // recv EAP_Response_PSK_M4

    // Transition 5: send_EAP_Success
    [] s=5 ->
    (chan_ComCA' = 6) & (s' = 6);

    // Transition 6: assign_auth_complete_AAA
    [] s=6 ->
    (auth_complete_AAA' = true) & (s' = 7);


  // Final state (self-loop)
  [] s=8 -> (s' = 8);

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