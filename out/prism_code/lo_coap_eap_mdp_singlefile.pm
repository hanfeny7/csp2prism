// lo_coap_eap_mdp_singlefile.prism
// Single-file MDP model for LO-CoAP-EAP (Version 1 — no Identity phase)
// Medium-scale, paper-quality, compatible with coap_eap_mdp_singlefile.prism style
// Features:
//  - SmartObject / Controller / AAA modules
//  - Channels with out buffers and probabilistic bit-flip corruption
//  - Intruder module (Dolev-Yao-like + replay + forge + drop)
//  - LO flow: SO -> Controller (LO_CoAP_POST) -> Controller forwards to AAA, AAA initiates PSK_M1
//  - Security labels + rewards + example properties

mdp

// ===== Parameters =====
const double p_flip = 0.02;     // bit-flip corruption prob
const double p_loss = 0.04;     // message loss prob (channel)
const int MAX_MSG = 10;
const int NO_MSG = 0;
const int CORRUPT = 10;

// ===== Message Encoding =====
// 0 -> NO_MSG
// 1 -> CoAP_ACK
// 2 -> EAP_Request_PSK_M1
// 3 -> EAP_Request_PSK_M3
// 4 -> EAP_Response_PSK_M2
// 5 -> EAP_Response_PSK_M4
// 6 -> EAP_Success
// 7 -> Final_CoAP_POST
// 8 -> LO_CoAP_POST
// 10 -> CORRUPT

// ===== Global Channel & Buffers =====
global chan_ComSC : [0..MAX_MSG] init NO_MSG;    // SO <-> Controller channel
global chan_ComCA : [0..MAX_MSG] init NO_MSG;    // Controller <-> AAA channel
global out_sc    : [0..MAX_MSG] init NO_MSG;    // sender buffer for SC
global out_ca    : [0..MAX_MSG] init NO_MSG;    // sender buffer for CA

// Session/auth tracking
global auth_complete_SO : bool init false;
global auth_complete_Controller : bool init false;
global auth_complete_AAA : bool init false;
global session_key_SO : [0..2] init 0;    // 0 = none, 1 = derived, 2 = compromised
global session_key_AAA : [0..2] init 0;

// Intruder observables/flags
global intr_buf_sc : [0..MAX_MSG] init NO_MSG;
global intr_buf_ca : [0..MAX_MSG] init NO_MSG;
global intr_knows_msk : bool init false;
global replay_detected : bool init false;
global integrity_violation : bool init false;
global mitm_detected : bool init false;
global dos_detected : bool init false;

// abstract ids / keys
global ID_P : int init 1;
global ID_S : int init 2;
global PSK : int init 1234;

// ===== Module: SmartObject (device) =====
module SmartObject
  so : [0..12] init 0;

  // 0: send LO_CoAP_POST to controller
  [so_emit_lo_post] so=0 & out_sc=NO_MSG -> (out_sc' = 8) & (so' = 1);

  // 1: wait for PSK_M1 (Controller forwards AAA's M1)
  [so_recv_psk_m1] so=1 & chan_ComSC=2 -> (chan_ComSC' = NO_MSG) & (so' = 2);

  // 2: send PSK_M2
  [so_emit_psk_m2] so=2 & out_sc=NO_MSG -> (out_sc' = 4) & (so' = 3);

  // 3: wait for PSK_M3
  [so_recv_psk_m3] so=3 & chan_ComSC=3 -> (chan_ComSC' = NO_MSG) & (so' = 4);

  // 4: send PSK_M4
  [so_emit_psk_m4] so=4 & out_sc=NO_MSG -> (out_sc' = 5) & (so' = 5);

  // 5: wait for Final_CoAP_POST from Controller (finalization)
  [so_recv_final_post] so=5 & chan_ComSC=7 -> (chan_ComSC' = NO_MSG) & (so' = 6);

  // 6: send CoAP_ACK (final ack)
  [so_emit_ack] so=6 & out_sc=NO_MSG -> (out_sc' = 1) & (so' = 7);

  // 7: mark auth complete
  [so_set_complete] so=7 -> (auth_complete_SO' = true) & (session_key_SO' = 1) & (so' = 8);

  [] so=8 -> (so' = 8);
endmodule

// ===== Module: Controller =====
module Controller
  c : [0..18] init 0;

  // 0: receive LO_CoAP_POST from SO
  [ctrl_recv_lo_post] c=0 & chan_ComSC=8 -> (chan_ComSC' = NO_MSG) & (c' = 1);

  // 1: forward LO_CoAP_POST to AAA (out_ca)
  [ctrl_emit_lo_to_aaa] c=1 & out_ca=NO_MSG -> (out_ca' = 8) & (c' = 2);

  // 2: wait for PSK_M1 from AAA
  [ctrl_recv_psk_m1] c=2 & chan_ComCA=2 -> (chan_ComCA' = NO_MSG) & (c' = 3);

  // 3: forward PSK_M1 to SO
  [ctrl_emit_to_so_psk_m1] c=3 & out_sc=NO_MSG -> (out_sc' = 2) & (c' = 4);

  // 4: wait for PSK_M2 from SO
  [ctrl_recv_psk_m2] c=4 & chan_ComSC=4 -> (chan_ComSC' = NO_MSG) & (c' = 5);

  // 5: forward PSK_M2 to AAA
  [ctrl_emit_to_aaa_psk_m2] c=5 & out_ca=NO_MSG -> (out_ca' = 4) & (c' = 6);

  // 6: wait for PSK_M3 from AAA
  [ctrl_recv_psk_m3] c=6 & chan_ComCA=3 -> (chan_ComCA' = NO_MSG) & (c' = 7);

  // 7: forward PSK_M3 to SO
  [ctrl_emit_to_so_psk_m3] c=7 & out_sc=NO_MSG -> (out_sc' = 3) & (c' = 8);

  // 8: wait for PSK_M4 from SO
  [ctrl_recv_psk_m4] c=8 & chan_ComSC=5 -> (chan_ComSC' = NO_MSG) & (c' = 9);

  // 9: forward PSK_M4 to AAA
  [ctrl_emit_to_aaa_psk_m4] c=9 & out_ca=NO_MSG -> (out_ca' = 5) & (c' = 10);

  // 10: wait for EAP_Success from AAA
  [ctrl_recv_success] c=10 & chan_ComCA=6 -> (chan_ComCA' = NO_MSG) & (c' = 11);

  // 11: send Final_CoAP_POST to SO
  [ctrl_emit_final_post] c=11 & out_sc=NO_MSG -> (out_sc' = 7) & (c' = 12);

  // 12: wait for CoAP_ACK from SO
  [ctrl_recv_ack] c=12 & chan_ComSC=1 -> (chan_ComSC' = NO_MSG) & (c' = 13);

  // 13: mark auth complete
  [ctrl_set_complete] c=13 -> (auth_complete_Controller' = true) & (c' = 14);

  [] c=14 -> (c' = 14);
endmodule

// ===== Module: AAA Server =====
module AAA_Server
  a : [0..10] init 0;

  // 0: receive LO_CoAP_POST from Controller (forwarded)
  [aaa_recv_lo_post] a=0 & chan_ComCA=8 -> (chan_ComCA' = NO_MSG) & (a' = 1);

  // 1: send PSK_M1 to Controller
  [aaa_emit_psk_m1] a=1 & out_ca=NO_MSG -> (out_ca' = 2) & (a' = 2);

  // 2: wait for PSK_M2
  [aaa_recv_psk_m2] a=2 & chan_ComCA=4 -> (chan_ComCA' = NO_MSG) & (a' = 3);

  // 3: send PSK_M3 to Controller
  [aaa_emit_psk_m3] a=3 & out_ca=NO_MSG -> (out_ca' = 3) & (a' = 4);

  // 4: wait for PSK_M4
  [aaa_recv_psk_m4] a=4 & chan_ComCA=5 -> (chan_ComCA' = NO_MSG) & (a' = 5);

  // 5: send EAP_Success (with MSK)
  [aaa_emit_success] a=5 & out_ca=NO_MSG -> (out_ca' = 6) & (session_key_AAA' = 1) & (a' = 6);

  // 6: mark auth complete
  [aaa_set_complete] a=6 -> (auth_complete_AAA' = true) & (a' = 7);

  [] a=7 -> (a' = 7);
endmodule

// ===== Channel SC (out_sc -> chan_ComSC) =====
module Channel_SC
  cs : [0..2] init 0;

  // move out_sc -> chan if free (with probabilistic loss via ProbLoss)
  [chan_sc_move] out_sc!=NO_MSG & chan_ComSC=NO_MSG -> (chan_ComSC' = out_sc) & (out_sc' = NO_MSG) & (cs' = 1);

  // model bit-flip corruption while message in channel
  [] cs=1 & chan_ComSC!=NO_MSG ->
     p_flip : (chan_ComSC' = CORRUPT) & (integrity_violation' = true) & (cs' = 1)
   + (1 - p_flip) : (cs' = 1);

  [] cs=1 & chan_ComSC=NO_MSG -> (cs' = 0);
endmodule

// ===== Channel CA (out_ca -> chan_ComCA) =====
module Channel_CA
  ca : [0..2] init 0;

  [chan_ca_move] out_ca!=NO_MSG & chan_ComCA=NO_MSG -> (chan_ComCA' = out_ca) & (out_ca' = NO_MSG) & (ca' = 1);

  [] ca=1 & chan_ComCA!=NO_MSG ->
       p_flip : (chan_ComCA' = CORRUPT) & (integrity_violation' = true) & (ca' = 1)
     + (1 - p_flip) : (ca' = 1);

  [] ca=1 & chan_ComCA=NO_MSG -> (ca' = 0);
endmodule

// ===== Intruder (Dolev-Yao-like + Replay + Forge + Drop) =====
module Intruder
  i : [0..6] init 0;

  // intercept SC-direction emission
  [intr_intercept_sc] out_sc!=NO_MSG & chan_ComSC=NO_MSG ->
    (i' = 0)
  +
    (intr_buf_sc' = out_sc) & (out_sc' = NO_MSG) & (mitm_detected' = true) & (i' = 1);

  // intercept CA-direction emission
  [intr_intercept_ca] out_ca!=NO_MSG & chan_ComCA=NO_MSG ->
    (i' = 0)
  +
    (intr_buf_ca' = out_ca) & (out_ca' = NO_MSG) & (mitm_detected' = true) & (i' = 1);

  // replay or forward intr_buf_sc
  [intr_inject_sc] intr_buf_sc!=NO_MSG & chan_ComSC=NO_MSG ->
    (chan_ComSC' = intr_buf_sc) & (intr_buf_sc' = NO_MSG) & (replay_detected' = true) & (i' = 2)
  +
    (chan_ComSC' = 4) & (intr_buf_sc' = NO_MSG) & (i' = 3);

  // replay or forward intr_buf_ca
  [intr_inject_ca] intr_buf_ca!=NO_MSG & chan_ComCA=NO_MSG ->
    (chan_ComCA' = intr_buf_ca) & (intr_buf_ca' = NO_MSG) & (replay_detected' = true) & (i' = 2)
  +
    (chan_ComCA' = 5) & (intr_buf_ca' = NO_MSG) & (i' = 3);

  // learn MSK if holding success message
  [] intr_buf_sc=6 -> (intr_knows_msk' = true) & (intr_buf_sc' = NO_MSG);
  [] intr_buf_ca=6 -> (intr_knows_msk' = true) & (intr_buf_ca' = NO_MSG);

  // forge inject (nondeterministic)
  [intr_forge_sc] chan_ComSC=NO_MSG -> (chan_ComSC' = 4) & (i' = 4); // forge PSK_M2
  [intr_forge_ca] chan_ComCA=NO_MSG -> (chan_ComCA' = 2) & (i' = 4); // forge PSK_M1

  // drop outgoing buffer (DoS)
  [intr_drop_out_sc] out_sc!=NO_MSG -> (out_sc' = NO_MSG) & (dos_detected' = true) & (i' = 5);
  [intr_drop_out_ca] out_ca!=NO_MSG -> (out_ca' = NO_MSG) & (dos_detected' = true) & (i' = 5);
endmodule

// ===== Optional Probabilistic Loss =====
module ProbLossLO
  l : [0..1] init 0;
  [chan_sc_move] out_sc!=NO_MSG & chan_ComSC=NO_MSG -> p_loss : (out_sc' = NO_MSG) & (l' = 1) + (1 - p_loss) : (l' = 0);
  [chan_ca_move] out_ca!=NO_MSG & chan_ComCA=NO_MSG -> p_loss : (out_ca' = NO_MSG) & (l' = 1) + (1 - p_loss) : (l' = 0);
endmodule

// ===== Labels =====
label "auth_success" = (auth_complete_SO = true & auth_complete_AAA = true);
label "intruder_knows_msk" = (intr_knows_msk = true);
label "integrity_violation" = (integrity_violation = true);
label "replay_detected" = (replay_detected = true);
label "mitm_detected" = (mitm_detected = true);
label "dos_detected" = (dos_detected = true);
label "key_mismatch" = (session_key_SO != session_key_AAA) & (session_key_SO != 0) & (session_key_AAA != 0);

// ===== Rewards =====
rewards "msgs"
  chan_ComSC!=NO_MSG : 1;
  chan_ComCA!=NO_MSG : 1;
endrewards

rewards "bytes"
  chan_ComSC=8 : 100;  // LO_CoAP_POST (smaller than full POST)
  chan_ComSC=2 : 120;  // PSK_M1
  chan_ComSC=4 : 100;  // PSK_M2
  chan_ComSC=3 : 120;  // PSK_M3
  chan_ComSC=5 : 100;  // PSK_M4
  chan_ComSC=6 : 160;  // EAP_Success
endrewards

// Example properties (commented):
// P=? [ F "auth_success" ]
// P=? [ F "intruder_knows_msk" ]
// R{"bytes"}=? [ F "auth_success" ]

// End of LO-CoAP-EAP model
