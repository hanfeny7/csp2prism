// coap_eap_mdp_singlefile.prism
// Single-file MDP model for CoAP-EAP (paper-quality, medium-scale)
// Features:
//  - SmartObject / Controller / AAA modules
//  - Channels with out buffers and probabilistic bit-flip corruption
//  - Intruder module implementing: Dolev-Yao-like abilities, replay cache, forge-inject
//  - Session key tracking and security labels
//  - Rewards (messages, bytes) placeholders
//  - Example PCTL queries (as comments at the end)

mdp

// ===== Parameters =====
const double p_flip = 0.02;     // probability of bit-flip corruption when message is in channel
const double p_loss = 0.04;     // (placeholder) probability of message loss during processing (modeled as nondeterministic choice sometimes)
const int MAX_MSG = 10;         // message id upper bound (0..10)
const int NO_MSG = 0;
const int CORRUPT = 10;

// ===== Message Encoding =====
// 0 -> NO_MSG
// 1 -> CoAP_ACK
// 2 -> CoAP_POST
// 3 -> EAP_Request_Identity
// 4 -> EAP_Request_PSK_M1
// 5 -> EAP_Request_PSK_M3
// 6 -> EAP_Response_Identity
// 7 -> EAP_Response_PSK_M2
// 8 -> EAP_Response_PSK_M4
// 9 -> EAP_Success
// 10 -> CORRUPT

// ===== Global Channel & Buffers =====
global chan_ComSC : [0..MAX_MSG] init NO_MSG;    // channel SmartObject <-> Controller (single slot)
global chan_ComCA : [0..MAX_MSG] init NO_MSG;    // channel Controller <-> AAA
global out_sc    : [0..MAX_MSG] init NO_MSG;    // sender-side output buffer for SC
global out_ca    : [0..MAX_MSG] init NO_MSG;    // sender-side output buffer for CA

// Session/auth tracking
global auth_complete_SO : bool init false;
global auth_complete_Controller : bool init false;
global auth_complete_AAA : bool init false;
global session_key_SO : [0..2] init 0;    // 0 = none, 1 = derived, 2 = compromised
global session_key_AAA : [0..2] init 0;   // 0 = none, 1 = derived, 2 = compromised

// Intruder observables/flags
global intr_buf_sc : [0..MAX_MSG] init NO_MSG;  // intruder cache for SC-direction
global intr_buf_ca : [0..MAX_MSG] init NO_MSG;  // intruder cache for CA-direction
global intr_knows_msk : bool init false;        // intruder learned MSK (true if EAP_Success intercepted)
global replay_detected : bool init false;
global integrity_violation : bool init false;
global mitm_detected : bool init false;
global dos_detected : bool init false;

// small identifiers (abstract)
global ID_P : int init 1;
global ID_S : int init 2;
global PSK : int init 1234;

// ===== Module: SmartObject (device) =====
module SmartObject
  so : [0..12] init 0;

  // 0: initially send CoAP_POST (emit to out_sc)
  [so_emit_post] so=0 & out_sc=NO_MSG -> (out_sc' = 2) & (so' = 1);

  // 1: wait until controller ack appears on chan_ComSC
  // receive CoAP_ACK (chan contains 1)
  [so_recv_ack] so=1 & chan_ComSC=1 -> (chan_ComSC' = NO_MSG) & (so' = 2);

  // 2: send CoAP_ACK back (ack contains device nonce N_P abstracted into ACK)
  [so_emit_ack] so=2 & out_sc=NO_MSG -> (out_sc' = 1) & (so' = 3);

  // 3: wait for EAP_Request_Identity from controller (chan_ComSC)
  [so_recv_eap_req_id] so=3 & chan_ComSC=3 -> (chan_ComSC' = NO_MSG) & (so' = 4);

  // 4: send EAP_Response_Identity
  [so_emit_eap_resp_id] so=4 & out_sc=NO_MSG -> (out_sc' = 6) & (so' = 5);

  // 5: wait for PSK_M1
  [so_recv_psk_m1] so=5 & chan_ComSC=4 -> (chan_ComSC' = NO_MSG) & (so' = 6);

  // 6: send PSK_M2 (MAC_P)
  [so_emit_psk_m2] so=6 & out_sc=NO_MSG -> (out_sc' = 7) & (so' = 7);

  // 7: wait for PSK_M3
  [so_recv_psk_m3] so=7 & chan_ComSC=5 -> (chan_ComSC' = NO_MSG) & (so' = 8);

  // 8: send PSK_M4
  [so_emit_psk_m4] so=8 & out_sc=NO_MSG -> (out_sc' = 8) & (so' = 9);

  // 9: wait for EAP_Success
  [so_recv_success] so=9 & chan_ComSC=9 -> (chan_ComSC' = NO_MSG) & (session_key_SO' = 1) & (so' = 10);

  // 10: mark auth complete
  [so_set_complete] so=10 -> (auth_complete_SO' = true) & (so' = 11);

  // final sink state
  [] so=11 -> (so' = 11);

endmodule

// ===== Module: Controller (CoAP server / EAP proxy) =====
module Controller
  c : [0..20] init 0;

  // 0: wait for CoAP_POST (read chan_ComSC or out_sc direct; we expect out_sc->chan move)
  [ctrl_recv_post] c=0 & chan_ComSC=2 -> (chan_ComSC' = NO_MSG) & (c' = 1);

  // 1: send CoAP_ACK (to smart object)
  [ctrl_emit_ack] c=1 & out_sc=NO_MSG -> (out_sc' = 1) & (c' = 2);

  // 2: wait for device's ack (chan_ComSC carries 1)
  [ctrl_recv_ack] c=2 & chan_ComSC=1 -> (chan_ComSC' = NO_MSG) & (c' = 3);

  // 3: start EAP identity exchange: send EAP_Request_Identity to SO
  [ctrl_emit_eap_req_id] c=3 & out_sc=NO_MSG -> (out_sc' = 3) & (c' = 4);

  // 4: receive EAP_Response_Identity from SO
  [ctrl_recv_eap_resp_id] c=4 & chan_ComSC=6 -> (chan_ComSC' = NO_MSG) & (c' = 5);

  // 5: forward identity to AAA (put to out_ca)
  [ctrl_emit_to_aaa_id] c=5 & out_ca=NO_MSG -> (out_ca' = 6) & (c' = 6);

  // 6: wait for PSK_M1 from AAA (chan_ComCA)
  [ctrl_recv_psk_m1] c=6 & chan_ComCA=4 -> (chan_ComCA' = NO_MSG) & (c' = 7);

  // 7: forward PSK_M1 to SO
  [ctrl_emit_to_so_psk_m1] c=7 & out_sc=NO_MSG -> (out_sc' = 4) & (c' = 8);

  // 8: wait for PSK_M2 from SO
  [ctrl_recv_psk_m2] c=8 & chan_ComSC=7 -> (chan_ComSC' = NO_MSG) & (c' = 9);

  // 9: forward PSK_M2 to AAA
  [ctrl_emit_to_aaa_psk_m2] c=9 & out_ca=NO_MSG -> (out_ca' = 7) & (c' = 10);

  // 10: wait for PSK_M3 from AAA
  [ctrl_recv_psk_m3] c=10 & chan_ComCA=5 -> (chan_ComCA' = NO_MSG) & (c' = 11);

  // 11: forward PSK_M3 to SO
  [ctrl_emit_to_so_psk_m3] c=11 & out_sc=NO_MSG -> (out_sc' = 5) & (c' = 12);

  // 12: wait for PSK_M4 from SO
  [ctrl_recv_psk_m4] c=12 & chan_ComSC=8 -> (chan_ComSC' = NO_MSG) & (c' = 13);

  // 13: forward PSK_M4 to AAA
  [ctrl_emit_to_aaa_psk_m4] c=13 & out_ca=NO_MSG -> (out_ca' = 8) & (c' = 14);

  // 14: wait for EAP_Success from AAA
  [ctrl_recv_success] c=14 & chan_ComCA=9 -> (chan_ComCA' = NO_MSG) & (c' = 15);

  // 15: forward EAP_Success to SO
  [ctrl_emit_success] c=15 & out_sc=NO_MSG -> (out_sc' = 9) & (c' = 16);

  // 16: mark auth complete for Controller
  [ctrl_set_complete] c=16 -> (auth_complete_Controller' = true) & (c' = 17);

  // final sink
  [] c=17 -> (c' = 17);

endmodule

// ===== Module: AAA Server =====
module AAA_Server
  a : [0..10] init 0;

  // 0: receive identity from Controller (via chan_ComCA)
  [aaa_recv_id] a=0 & chan_ComCA=6 -> (chan_ComCA' = NO_MSG) & (a' = 1);

  // 1: send PSK_M1 (contains N_S and ID_S)
  [aaa_emit_psk_m1] a=1 & out_ca=NO_MSG -> (out_ca' = 4) & (a' = 2);

  // 2: wait for PSK_M2 (from Controller)
  [aaa_recv_psk_m2] a=2 & chan_ComCA=7 -> (chan_ComCA' = NO_MSG) & (a' = 3);

  // 3: send PSK_M3 (MAC_S and PCHANNEL)
  [aaa_emit_psk_m3] a=3 & out_ca=NO_MSG -> (out_ca' = 5) & (a' = 4);

  // 4: wait for PSK_M4
  [aaa_recv_psk_m4] a=4 & chan_ComCA=8 -> (chan_ComCA' = NO_MSG) & (a' = 5);

  // 5: send EAP_Success (with MSK)
  [aaa_emit_success] a=5 & out_ca=NO_MSG -> (out_ca' = 9) & (session_key_AAA' = 1) & (a' = 6);

  // 6: mark auth complete
  [aaa_set_complete] a=6 -> (auth_complete_AAA' = true) & (a' = 7);

  [] a=7 -> (a' = 7);

endmodule

// ===== Module: Channel Processing (SC) =====
// This module moves out_sc -> chan_ComSC (if channel free).
// It also allows probabilistic bit-flip when message sits in chan.
module Channel_SC
  cs : [0..2] init 0;
  // 0: idle; 1: message in channel (chan_ComSC != NO_MSG)
  // Move emitted message into channel
  [chan_sc_move] out_sc!=NO_MSG & chan_ComSC=NO_MSG -> (chan_ComSC' = out_sc) & (out_sc' = NO_MSG) & (cs' = 1);

  // When a message is present, model probabilistic bit-flip corruption
  [] cs=1 & chan_ComSC!=NO_MSG ->
       p_flip : (chan_ComSC' = CORRUPT) & (integrity_violation' = true) & (cs' = 1)
     + (1 - p_flip) : (cs' = 1);

  // No-op receive progress (receiver modules will read and clear chan_ComSC)
  [] cs=1 & chan_ComSC=NO_MSG -> (cs' = 0);

endmodule

// ===== Module: Channel Processing (CA) =====
module Channel_CA
  ca : [0..2] init 0;

  [chan_ca_move] out_ca!=NO_MSG & chan_ComCA=NO_MSG -> (chan_ComCA' = out_ca) & (out_ca' = NO_MSG) & (ca' = 1);

  [] ca=1 & chan_ComCA!=NO_MSG ->
       p_flip : (chan_ComCA' = CORRUPT) & (integrity_violation' = true) & (ca' = 1)
     + (1 - p_flip) : (ca' = 1);

  [] ca=1 & chan_ComCA=NO_MSG -> (ca' = 0);

endmodule

// ===== Module: Intruder (combined: Dolev-Yao-like + Replay + Forge) =====
// Intruder acts in between emission and channel move (it can intercept by reading out_sc/out_ca),
// and it can later inject / replay / forge when channel is free.
// For simplicity we keep a single-slot cache per direction.
module Intruder
  i : [0..6] init 0;

  // Intercept SC-direction emission: when out_sc != NO_MSG and channel is free:
  // nondeterministically choose to let pass (do nothing) or intercept (steal into intr_buf_sc)
  [intr_intercept_sc] out_sc!=NO_MSG & chan_ComSC=NO_MSG ->
    // choice 1: do not intercept (leave out_sc for Channel_SC to move)
    (i' = 0)
  +
    // choice 2: intercept (steal message)
    (intr_buf_sc' = out_sc) & (out_sc' = NO_MSG) & (mitm_detected' = true) & (i' = 1);

  // Intercept CA-direction emission
  [intr_intercept_ca] out_ca!=NO_MSG & chan_ComCA=NO_MSG ->
    (i' = 0)
  +
    (intr_buf_ca' = out_ca) & (out_ca' = NO_MSG) & (mitm_detected' = true) & (i' = 1);

  // Replay / inject SC-direction: if intr_buf_sc has a message and chan free -> inject (replay or forge)
  // Nondeterministic: replay original, or forge a message (Dolev-Yao)
  [intr_inject_sc] intr_buf_sc!=NO_MSG & chan_ComSC=NO_MSG ->
    // replay original
    (chan_ComSC' = intr_buf_sc) & (intr_buf_sc' = NO_MSG) & (replay_detected' = true) & (i' = 2)
  +
    // forge: choose arbitrary message to inject (nondet) - limited set for tractability
    (chan_ComSC' = 4) & (intr_buf_sc' = NO_MSG) & (i' = 3) ; // 4 == EAP_Request_PSK_M1 forged

  // Replay / inject CA-direction
  [intr_inject_ca] intr_buf_ca!=NO_MSG & chan_ComCA=NO_MSG ->
    (chan_ComCA' = intr_buf_ca) & (intr_buf_ca' = NO_MSG) & (replay_detected' = true) & (i' = 2)
  +
    (chan_ComCA' = 7) & (intr_buf_ca' = NO_MSG) & (i' = 3); // 7 == EAP_Response_PSK_M2 forged

  // Special ability: if intruder holds EAP_Success (MSK), mark intruder knows MSK
  // This transition models intruder analyzing stored messages: if intruder buffer contains success, intruder learns MSK.
  [] intr_buf_sc=9 -> (intr_knows_msk' = true) & (intr_buf_sc' = NO_MSG);

  [] intr_buf_ca=9 -> (intr_knows_msk' = true) & (intr_buf_ca' = NO_MSG);

  // Forge-inject at any time when channel free (nondeterministic) - Dolev-Yao power
  [intr_forge_sc] chan_ComSC=NO_MSG ->
    // can inject EAP_Response_PSK_M2 (attempt forging client MAC)
    (chan_ComSC' = 7) & (i' = 4);

  [intr_forge_ca] chan_ComCA=NO_MSG ->
    (chan_ComCA' = 4) & (i' = 4);

  // Simple DOS attempt: drop/consume the out buffer nondeterministically
  [intr_drop_out_sc] out_sc!=NO_MSG ->
    (out_sc' = NO_MSG) & (dos_detected' = true) & (i' = 5);

  [intr_drop_out_ca] out_ca!=NO_MSG ->
    (out_ca' = NO_MSG) & (dos_detected' = true) & (i' = 5);

endmodule

// ===== Simple Probabilistic Loss Emulation (optional) =====
// We model a small chance that when Channel moves a message, it disappears (loss).
module ProbLoss
  l : [0..1] init 0;
  // When out_sc ready and chan free, there is probabilistic loss vs normal move.
  // This synchronizes with Channel_SC move by acting when out_sc != NO_MSG & chan_ComSC = NO_MSG
  // Note: if loss occurs, we clear out_sc and do not set chan (message lost).
  [chan_sc_move] out_sc!=NO_MSG & chan_ComSC=NO_MSG ->
     p_loss : (out_sc' = NO_MSG) & (l' = 1)
   + (1 - p_loss) : (l' = 0);

  // For CA
  [chan_ca_move] out_ca!=NO_MSG & chan_ComCA=NO_MSG ->
     p_loss : (out_ca' = NO_MSG) & (l' = 1)
   + (1 - p_loss) : (l' = 0);

endmodule

// ===== Labels for properties =====
label "auth_success" = (auth_complete_SO = true & auth_complete_AAA = true);
label "auth_partial" = (auth_complete_SO = true | auth_complete_AAA = true | auth_complete_Controller = true);
label "intruder_knows_msk" = (intr_knows_msk = true);
label "replay_detected" = (replay_detected = true);
label "integrity_violation" = (integrity_violation = true);
label "mitm_detected" = (mitm_detected = true);
label "dos_detected" = (dos_detected = true);
label "key_mismatch" = (session_key_SO != session_key_AAA) & (session_key_SO != 0) & (session_key_AAA != 0);

// ===== Rewards (messaging / bytes) - approximate =====
rewards "msgs"
  // count emits by checking out buffers when channel moves (approx)
  chan_ComSC!=NO_MSG : 1;
  chan_ComCA!=NO_MSG : 1;
endrewards

rewards "bytes"
  // approximate bytes per major message type
  chan_ComSC=2 : 140;  // CoAP POST
  chan_ComSC=1 : 80;   // CoAP ACK
  chan_ComSC=3 : 40;   // EAP Req Identity
  chan_ComSC=6 : 60;   // EAP Resp Identity
  chan_ComSC=4 : 120;  // PSK_M1
  chan_ComSC=7 : 100;  // PSK_M2
  chan_ComSC=5 : 120;  // PSK_M3
  chan_ComSC=8 : 100;  // PSK_M4
  chan_ComSC=9 : 160;  // EAP Success (MSK)
endrewards

// End of model

// ------------------------------------------------------------------
// Example PCTL properties (copy these to PRISM property pane or .pctl file)
// ------------------------------------------------------------------
// 1) Probability that authentication completes for both SO and AAA eventually:
// P=? [ F "auth_success" ]

// 2) Probability that intruder learns MSK eventually:
// P=? [ F "intruder_knows_msk" ]

// 3) Probability of integrity violation (bit-flip) at any point:
// P=? [ F "integrity_violation" ]

// 4) Probability of replay detected:
// P=? [ F "replay_detected" ]

// 5) Expected bytes until auth success (reward query):
// R{"bytes"}=? [ F "auth_success" ]

// 6) Conditional/diagnostic queries examples:
// P=? [ F "auth_success" & ! "intruder_knows_msk" ]   // success without intruder learning MSK

// Notes:
// - This MDP model includes nondeterministic intruder choices (Dolev-Yao style choices).
// - The bit-flip corruption uses probabilistic transitions controlled by p_flip.
// - You can vary p_flip, p_loss to perform sensitivity analysis.
// - For formal proofs of cryptographic properties (MAC checks, nonce freshness), more explicit symbolic modeling of keys/MACs is needed (or integration with a symbolic tool). This MDP focuses on the interplay of network-level attacks and protocol flow.
// ------------------------------------------------------------------
