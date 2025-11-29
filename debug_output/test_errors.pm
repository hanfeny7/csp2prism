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
// ===== Global Variables =====
global chan_test_chan : [0..0] init 0;
global invalid : 0;
global module : 5;
global x : 10Process1()=undefined_action->Skip;

// ===== Process Modules =====
module Process2
  s : [0..2] init 0;

    // Transition 0: call_ValidProcess
    [] s=0 ->
    (s' = 1);


  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module test_chan
  s : [0..0] init 0;


  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module msg1
  s : [0..0] init 0;


  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
// ===== Labels (Observables) =====
// Generic labels - customize for your protocol
label "error" = false; // Update with protocol-specific error condition