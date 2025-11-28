// ===================================================
// Generated PRISM MDP model (from pat2prism)
// Processes, channels, and synchronization
// ===================================================

mdp

// ===== Parameters =====
const double p_flip = 0.02;
const int MAX_NONCE = 2;

// ===== Message Encoding =====
// Message indices for channel communication// 0 -> NO_MSG// 1 -> msg
// ===== Global Variables =====global chan_ch : [0..1] init 0;
global intruder_knows_msk : bool init false;
global N_P : [0..MAX_NONCE] init 0;
global N_C : [0..MAX_NONCE] init 0;
global N_S : [0..MAX_NONCE] init 0;

global auth_so : [0..2] init 0;
global auth_ctrl : [0..2] init 0;
global auth_aaa : [0..2] init 0;

// ===== Process Modules =====
module SimpleProcess
  s : [0..3] init 0;  // Transition 0: send_msg  [] s=0 ->    (chan_ch' = 1) & (s' = 1);  // Transition 1: recv_msg  [] s=1 ->    (s' = 2); // recv msg
  // Final state (self-loop)
  [] s=3 -> (s' = 3);

endmodule
module System
  s : [0..3] init 0;  // Transition 0: call_SimpleProcess  [] s=0 ->    (s' = 1);  // Transition 1: call_SimpleProcess  [] s=1 ->    (s' = 2);
  // Final state (self-loop)
  [] s=3 -> (s' = 3);

endmodule
// ===== Labels (Observables) =====
label "auth_complete" = (auth_so=2 & auth_ctrl=2 & auth_aaa=2);
label "msk_leaked" = intruder_knows_msk = true;