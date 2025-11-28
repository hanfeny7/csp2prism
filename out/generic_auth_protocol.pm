// ===================================================
// Generated PRISM MDP model (from pat2prism)
// Processes, channels, and synchronization
// ===================================================

mdp

// ===== Parameters =====
const double p_flip = 0.02;
const int MAX_NONCE = 2;

// ===== Message Encoding =====
// Message indices for channel communication// 0 -> NO_MSG// 1 -> Challenge// 2 -> Confirmation// 3 -> InitMsg// 4 -> Response
// ===== Global Variables =====
global chan_ComAB : [0..4] init 0;
global initiator_auth : int init 0;
global responder_auth : int init 0;
global mutual_auth_done : int init 0;
global replay_detected : int init 0;

// ===== Process Modules =====
module process
  s : [0..8] init 0;

    // Transition 0: send_InitMsg
    [] s=0 ->
    (chan_ComAB' = 3) & (s' = 1);

    // Transition 1: recv_Challenge
    [] s=1 ->
    (s' = 2); // recv Challenge

    // Transition 2: assign_initiator_auth
    [] s=2 ->
    (initiator_auth' = 1) & (s' = 3);

    // Transition 3: send_Response
    [] s=3 ->
    (chan_ComAB' = 4) & (s' = 4);

    // Transition 4: assign_initiator_auth
    [] s=4 ->
    (initiator_auth' = 2) & (s' = 5);

    // Transition 5: recv_Confirmation
    [] s=5 ->
    (s' = 6); // recv Confirmation

    // Transition 6: assign_mutual_auth_done
    [] s=6 ->
    (mutual_auth_done' = true) & (s' = 7);


  // Final state (self-loop)
  [] s=8 -> (s' = 8);

endmodule
module process
  s : [0..8] init 0;

    // Transition 0: recv_InitMsg
    [] s=0 ->
    (s' = 1); // recv InitMsg

    // Transition 1: assign_responder_auth
    [] s=1 ->
    (responder_auth' = 1) & (s' = 2);

    // Transition 2: send_Challenge
    [] s=2 ->
    (chan_ComAB' = 1) & (s' = 3);

    // Transition 3: recv_Response
    [] s=3 ->
    (s' = 4); // recv Response

    // Transition 4: assign_responder_auth
    [] s=4 ->
    (responder_auth' = 2) & (s' = 5);

    // Transition 5: send_Confirmation
    [] s=5 ->
    (chan_ComAB' = 2) & (s' = 6);

    // Transition 6: assign_mutual_auth_done
    [] s=6 ->
    (mutual_auth_done' = true) & (s' = 7);


  // Final state (self-loop)
  [] s=8 -> (s' = 8);

endmodule
module system
  s : [0..0] init 0;


  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Responder
  s : [0..0] init 0;


  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
// ===== Labels (Observables) =====
// Generic labels - customize for your protocol
label "error" = false; // Update with protocol-specific error condition