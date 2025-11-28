// ===================================================
// Generated PRISM MDP model (from pat2prism)
// Processes, channels, and synchronization
// ===================================================

mdp

// ===== Parameters =====
const double p_flip = 0.02;
const int MAX_NONCE = 2;

// ===== Message Encoding =====
// Message indices for channel communication// 0 -> NO_MSG// 1 -> CoAP_ACK// 2 -> CoAP_POST// 3 -> EAP_Request_Identity// 4 -> EAP_Request_PSK_M1// 5 -> EAP_Request_PSK_M3// 6 -> EAP_Response_Identity// 7 -> EAP_Response_PSK_M2// 8 -> EAP_Response_PSK_M4// 9 -> EAP_Success
// ===== Global Variables =====global chan_ComSC : [0..9] init 0;global chan_ComCA : [0..9] init 0;
global intruder_knows_msk : bool init false;
global N_P : [0..MAX_NONCE] init 0;
global N_C : [0..MAX_NONCE] init 0;
global N_S : [0..MAX_NONCE] init 0;

global auth_so : [0..2] init 0;
global auth_ctrl : [0..2] init 0;
global auth_aaa : [0..2] init 0;

// ===== Process Modules =====
module SmartObject
  s : [0..10] init 0;  // Transition 0: send_CoAP_POST  [] s=0 ->    (chan_ComSC' = 2) & (s' = 1);  // Transition 1: recv_CoAP_ACK  [] s=1 ->    (s' = 2); // recv CoAP_ACK  // Transition 2: recv_EAP_Request_Identity  [] s=2 ->    (s' = 3); // recv EAP_Request_Identity  // Transition 3: send_EAP_Response_Identity  [] s=3 ->    (chan_ComSC' = 6) & (s' = 4);  // Transition 4: recv_EAP_Request_PSK_M1  [] s=4 ->    (s' = 5); // recv EAP_Request_PSK_M1  // Transition 5: send_EAP_Response_PSK_M2  [] s=5 ->    (chan_ComSC' = 7) & (s' = 6);  // Transition 6: recv_EAP_Request_PSK_M3  [] s=6 ->    (s' = 7); // recv EAP_Request_PSK_M3  // Transition 7: send_EAP_Response_PSK_M4  [] s=7 ->    (chan_ComSC' = 8) & (s' = 8);  // Transition 8: recv_EAP_Success  [] s=8 ->    (s' = 9); // recv EAP_Success
  // Final state (self-loop)
  [] s=10 -> (s' = 10);

endmodule
module Controller
  s : [0..17] init 0;  // Transition 0: recv_CoAP_POST  [] s=0 ->    (s' = 1); // recv CoAP_POST  // Transition 1: send_CoAP_ACK  [] s=1 ->    (chan_ComSC' = 1) & (s' = 2);  // Transition 2: recv_CoAP_ACK  [] s=2 ->    (s' = 3); // recv CoAP_ACK  // Transition 3: send_EAP_Request_Identity  [] s=3 ->    (chan_ComSC' = 3) & (s' = 4);  // Transition 4: recv_EAP_Response_Identity  [] s=4 ->    (s' = 5); // recv EAP_Response_Identity  // Transition 5: send_EAP_Response_Identity  [] s=5 ->    (chan_ComCA' = 6) & (s' = 6);  // Transition 6: recv_EAP_Request_PSK_M1  [] s=6 ->    (s' = 7); // recv EAP_Request_PSK_M1  // Transition 7: send_EAP_Request_PSK_M1  [] s=7 ->    (chan_ComSC' = 4) & (s' = 8);  // Transition 8: recv_EAP_Response_PSK_M2  [] s=8 ->    (s' = 9); // recv EAP_Response_PSK_M2  // Transition 9: send_EAP_Response_PSK_M2  [] s=9 ->    (chan_ComCA' = 7) & (s' = 10);  // Transition 10: recv_EAP_Request_PSK_M3  [] s=10 ->    (s' = 11); // recv EAP_Request_PSK_M3  // Transition 11: send_EAP_Request_PSK_M3  [] s=11 ->    (chan_ComSC' = 5) & (s' = 12);  // Transition 12: recv_EAP_Response_PSK_M4  [] s=12 ->    (s' = 13); // recv EAP_Response_PSK_M4  // Transition 13: send_EAP_Response_PSK_M4  [] s=13 ->    (chan_ComCA' = 8) & (s' = 14);  // Transition 14: recv_EAP_Success  [] s=14 ->    (s' = 15); // recv EAP_Success  // Transition 15: send_EAP_Success  [] s=15 ->    (chan_ComSC' = 9) & (s' = 16);
  // Final state (self-loop)
  [] s=17 -> (s' = 17);

endmodule
module AAA_Server
  s : [0..7] init 0;  // Transition 0: recv_EAP_Response_Identity  [] s=0 ->    (s' = 1); // recv EAP_Response_Identity  // Transition 1: send_EAP_Request_PSK_M1  [] s=1 ->    (chan_ComCA' = 4) & (s' = 2);  // Transition 2: recv_EAP_Response_PSK_M2  [] s=2 ->    (s' = 3); // recv EAP_Response_PSK_M2  // Transition 3: send_EAP_Request_PSK_M3  [] s=3 ->    (chan_ComCA' = 5) & (s' = 4);  // Transition 4: recv_EAP_Response_PSK_M4  [] s=4 ->    (s' = 5); // recv EAP_Response_PSK_M4  // Transition 5: send_EAP_Success  [] s=5 ->    (chan_ComCA' = 9) & (s' = 6);
  // Final state (self-loop)
  [] s=7 -> (s' = 7);

endmodule
module System
  s : [0..4] init 0;  // Transition 0: call_SmartObject  [] s=0 ->    (s' = 1);  // Transition 1: call_Controller  [] s=1 ->    (s' = 2);  // Transition 2: call_AAA_Server  [] s=2 ->    (s' = 3);
  // Final state (self-loop)
  [] s=4 -> (s' = 4);

endmodule
// ===== Labels (Observables) =====
label "auth_complete" = (auth_so=2 & auth_ctrl=2 & auth_aaa=2);
label "msk_leaked" = intruder_knows_msk = true;