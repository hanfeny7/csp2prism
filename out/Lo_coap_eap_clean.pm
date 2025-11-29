// ===================================================
// Generated PRISM MDP model (from pat2prism)
// Processes, channels, and synchronization
// ===================================================

mdp

// ===== Parameters =====
const double p_flip = 0.02;
const int MAX_NONCE = 2;

// ===== Message Encoding =====
// Message indices for channel communication// 0 -> NO_MSG// 1 -> EAP_Request_PSK_M1// 2 -> EAP_Request_PSK_M3// 3 -> EAP_Response_PSK_M2// 4 -> EAP_Response_PSK_M4// 5 -> EAP_Success// 6 -> LO_CoAP_POST
// ===== Global Variables =====global chan_ComSC : [0..6] init 0;global chan_ComCA : [0..6] init 0;
global intruder_knows_msk : bool init false;
global N_P : [0..MAX_NONCE] init 0;
global N_C : [0..MAX_NONCE] init 0;
global N_S : [0..MAX_NONCE] init 0;

global auth_so : [0..2] init 0;
global auth_ctrl : [0..2] init 0;
global auth_aaa : [0..2] init 0;

// ===== Process Modules =====
module SmartObject
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module Generate_N_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module LO_CoAP_POST
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
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Request_PSK_M1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_S_1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Compute_AK
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
module Compute_MAC_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module AK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_S
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
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Response_PSK_M2
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module MAC_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Request_PSK_M3
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module MAC_S_1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module PCHANNEL_1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Verify_MAC_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module MAC_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

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
module Final_CoAP_POST
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_C_1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module AUTH_1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Verify_AUTH
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module AUTH
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CoAP_ACK
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
module N_C
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
  s : [0..12] init 0;  // Transition 0: recv_LO_CoAP_POST  [] s=0 ->    (s' = 1); // recv LO_CoAP_POST  // Transition 1: send_LO_CoAP_POST  [] s=1 ->    (chan_ComCA' = 6) & (s' = 2);  // Transition 2: recv_EAP_Request_PSK_M1  [] s=2 ->    (s' = 3); // recv EAP_Request_PSK_M1  // Transition 3: send_EAP_Request_PSK_M1  [] s=3 ->    (chan_ComSC' = 1) & (s' = 4);  // Transition 4: recv_EAP_Response_PSK_M2  [] s=4 ->    (s' = 5); // recv EAP_Response_PSK_M2  // Transition 5: send_EAP_Response_PSK_M2  [] s=5 ->    (chan_ComCA' = 3) & (s' = 6);  // Transition 6: recv_EAP_Request_PSK_M3  [] s=6 ->    (s' = 7); // recv EAP_Request_PSK_M3  // Transition 7: send_EAP_Request_PSK_M3  [] s=7 ->    (chan_ComSC' = 2) & (s' = 8);  // Transition 8: recv_EAP_Response_PSK_M4  [] s=8 ->    (s' = 9); // recv EAP_Response_PSK_M4  // Transition 9: send_EAP_Response_PSK_M4  [] s=9 ->    (chan_ComCA' = 4) & (s' = 10);  // Transition 10: recv_EAP_Success  [] s=10 ->    (s' = 11); // recv EAP_Success
  // Final state (self-loop)
  [] s=12 -> (s' = 12);

endmodule
module Generate_N_C
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Compute_AUTH
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module MSK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_C
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Final_CoAP_POST
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_C
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module AUTH
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CoAP_ACK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module auth_complete_Controller
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Controller
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module AAA_Server
  s : [0..2] init 0;  // Transition 0: recv_LO_CoAP_POST  [] s=0 ->    (s' = 1); // recv LO_CoAP_POST
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module Generate_N_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComCA
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Request_PSK_M1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComCA
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Response_PSK_M2
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module MAC_P_1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Compute_AK
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
module Compute_MAC_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module AK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_S
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
module Verify_MAC_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module MAC_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

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