// ===================================================
// Generated PRISM MDP model (from pat2prism)
// Processes, channels, and synchronization
// ===================================================

mdp

// ===== Parameters =====
const double p_flip = 0.02;
const int MAX_NONCE = 2;

// ===== Message Encoding =====
// Message indices for channel communication// 0 -> NO_MSG
// ===== Global Variables =====global chan_ComSC : [0..0] init 0;global chan_ComCA : [0..0] init 0;
global intruder_knows_msk : bool init false;
global N_P : [0..MAX_NONCE] init 0;
global N_C : [0..MAX_NONCE] init 0;
global N_S : [0..MAX_NONCE] init 0;

global auth_so : [0..2] init 0;
global auth_ctrl : [0..2] init 0;
global auth_aaa : [0..2] init 0;

// ===== Process Modules =====
module SO
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module PSK
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
module Fake_PSK
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module auth_complete_SO
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module MAC_P_valid
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module AUTH_valid
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
module MAC_P
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
module MAC_P_valid
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module auth_complete_SO
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
module AUTH_valid
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module auth_complete_SO
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Controller
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module auth_complete_Controller
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module MAC_S_valid
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
module MAC_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N_S
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module auth_complete_Controller
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
module MAC_S_valid
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
module auth_complete_Controller
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module AAA_Server
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module auth_complete_AAA
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
module auth_complete_AAA
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
// ===== Labels (Observables) =====
label "auth_complete" = (auth_so=2 & auth_ctrl=2 & auth_aaa=2);
label "msk_leaked" = intruder_knows_msk = true;