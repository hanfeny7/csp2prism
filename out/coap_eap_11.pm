// ===================================================
// Generated PRISM MDP model (from pat2prism)
// Processes, channels, and synchronization
// ===================================================

mdp

// ===== Parameters =====
const double p_flip = 0.02;
const int MAX_NONCE = 2;

// ===== Message Encoding =====
// Message indices for channel communication// 0 -> NO_MSG// 1 -> CoAP_ACK// 2 -> CoAP_POST// 3 -> EAP_Response_Identity
// ===== Global Variables =====global chan_ComSC : [0..3] init 0;global chan_ComCA : [0..3] init 0;
global intruder_knows_msk : bool init false;
global N_P : [0..MAX_NONCE] init 0;
global N_C : [0..MAX_NONCE] init 0;
global N_S : [0..MAX_NONCE] init 0;

global auth_so : [0..2] init 0;
global auth_ctrl : [0..2] init 0;
global auth_aaa : [0..2] init 0;

// ===== Process Modules =====
module SmartObject
  s : [0..3] init 0;  // Transition 0: send_CoAP_POST  [] s=0 ->    (chan_ComSC' = 2) & (s' = 1);  // Transition 1: recv_CoAP_ACK  [] s=1 ->    (s' = 2); // recv CoAP_ACK
  // Final state (self-loop)
  [] s=3 -> (s' = 3);

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
module CoAP_ACK
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
module EAP_Request_Identity
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Response_Identity
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_P
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
  s : [0..2] init 0;  // Transition 0: recv_CoAP_POST  [] s=0 ->    (s' = 1); // recv CoAP_POST
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module Generate_N_C
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
module CoAP_ACK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_P_1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Request_Identity
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComSC
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Response_Identity
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_P
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComCA
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module EAP_Response_Identity
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ID_P
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
module MAC_P_1
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
module MSK_1
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
  s : [0..2] init 0;  // Transition 0: recv_EAP_Response_Identity  [] s=0 ->    (s' = 1); // recv EAP_Response_Identity
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