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
  s : [0..14] init 0;  // Transition 0: send_CoAP_POST  [] s=0 ->    (chan_ComSC' = 2) & (s' = 1);  // Transition 1: recv_CoAP_ACK  [] s=1 ->    (s' = 2); // recv CoAP_ACK  // Transition 2: call_Generate_N_P  [] s=2 ->    (s' = 3);  // Transition 3: send_CoAP_ACK  [] s=3 ->    (chan_ComSC' = 1) & (s' = 4);  // Transition 4: recv_EAP_Request_Identity  [] s=4 ->    (s' = 5); // recv EAP_Request_Identity  // Transition 5: send_EAP_Response_Identity  [] s=5 ->    (chan_ComSC' = 6) & (s' = 6);  // Transition 6: recv_EAP_Request_PSK_M1  [] s=6 ->    (s' = 7); // recv EAP_Request_PSK_M1  // Transition 7: call_Compute_AK  [] s=7 ->    (s' = 8);  // Transition 8: call_Compute_MAC_P  [] s=8 ->    (s' = 9);  // Transition 9: send_EAP_Response_PSK_M2  [] s=9 ->    (chan_ComSC' = 7) & (s' = 10);  // Transition 10: recv_EAP_Request_PSK_M3  [] s=10 ->    (s' = 11); // recv EAP_Request_PSK_M3  // Transition 11: call_Verify_MAC_S  [] s=11 ->    (s' = 12);  // Transition 12: call_if  [] s=12 ->    (s' = 13);
  // Final state (self-loop)
  [] s=14 -> (s' = 14);

endmodule
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Response_PSK_M4
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Success
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Derive_MSK_EMSK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module PSK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module auth_complete_SO
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module else
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module skip
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module SmartObject
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Controller
  s : [0..20] init 0;  // Transition 0: recv_CoAP_POST  [] s=0 ->    (s' = 1); // recv CoAP_POST  // Transition 1: call_Generate_N_C  [] s=1 ->    (s' = 2);  // Transition 2: send_CoAP_ACK  [] s=2 ->    (chan_ComSC' = 1) & (s' = 3);  // Transition 3: recv_CoAP_ACK  [] s=3 ->    (s' = 4); // recv CoAP_ACK  // Transition 4: send_EAP_Request_Identity  [] s=4 ->    (chan_ComSC' = 3) & (s' = 5);  // Transition 5: recv_EAP_Response_Identity  [] s=5 ->    (s' = 6); // recv EAP_Response_Identity  // Transition 6: send_EAP_Response_Identity  [] s=6 ->    (chan_ComCA' = 6) & (s' = 7);  // Transition 7: recv_EAP_Request_PSK_M1  [] s=7 ->    (s' = 8); // recv EAP_Request_PSK_M1  // Transition 8: send_EAP_Request_PSK_M1  [] s=8 ->    (chan_ComSC' = 4) & (s' = 9);  // Transition 9: recv_EAP_Response_PSK_M2  [] s=9 ->    (s' = 10); // recv EAP_Response_PSK_M2  // Transition 10: send_EAP_Response_PSK_M2  [] s=10 ->    (chan_ComCA' = 7) & (s' = 11);  // Transition 11: recv_EAP_Request_PSK_M3  [] s=11 ->    (s' = 12); // recv EAP_Request_PSK_M3  // Transition 12: send_EAP_Request_PSK_M3  [] s=12 ->    (chan_ComSC' = 5) & (s' = 13);  // Transition 13: recv_EAP_Response_PSK_M4  [] s=13 ->    (s' = 14); // recv EAP_Response_PSK_M4  // Transition 14: send_EAP_Response_PSK_M4  [] s=14 ->    (chan_ComCA' = 8) & (s' = 15);  // Transition 15: recv_EAP_Success  [] s=15 ->    (s' = 16); // recv EAP_Success  // Transition 16: send_EAP_Success  [] s=16 ->    (chan_ComSC' = 9) & (s' = 17);  // Transition 17: assign_auth_complete_Controller  [] s=17 ->    (auth_complete_Controller' = true) & (s' = 18);  // Transition 18: call_Controller  [] s=18 ->    (s' = 19);
  // Final state (self-loop)
  [] s=20 -> (s' = 20);

endmodule
module AAA_Server
  s : [0..9] init 0;  // Transition 0: recv_EAP_Response_Identity  [] s=0 ->    (s' = 1); // recv EAP_Response_Identity  // Transition 1: call_Generate_N_S  [] s=1 ->    (s' = 2);  // Transition 2: send_EAP_Request_PSK_M1  [] s=2 ->    (chan_ComCA' = 4) & (s' = 3);  // Transition 3: recv_EAP_Response_PSK_M2  [] s=3 ->    (s' = 4); // recv EAP_Response_PSK_M2  // Transition 4: call_Compute_AK  [] s=4 ->    (s' = 5);  // Transition 5: call_Compute_MAC_P  [] s=5 ->    (s' = 6);  // Transition 6: call_Verify_MAC_P  [] s=6 ->    (s' = 7);  // Transition 7: call_if  [] s=7 ->    (s' = 8);
  // Final state (self-loop)
  [] s=9 -> (s' = 9);

endmodule
module Compute_MAC_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module AK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComCA
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Request_PSK_M3
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module MAC_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module PCHANNEL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComCA
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Response_PSK_M4
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Derive_MSK_EMSK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module PSK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComCA
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Success
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module MSK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module auth_complete_AAA
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module else
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module skip
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module AAA_Server
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module System
  s : [0..4] init 0;  // Transition 0: call_SmartObject  [] s=0 ->    (s' = 1);  // Transition 1: call_Controller  [] s=1 ->    (s' = 2);  // Transition 2: call_AAA_Server  [] s=2 ->    (s' = 3);
  // Final state (self-loop)
  [] s=4 -> (s' = 4);

endmodule
// ===== Labels (Observables) =====
label "auth_complete" = (auth_so=2 & auth_ctrl=2 & auth_aaa=2);
label "msk_leaked" = intruder_knows_msk = true;