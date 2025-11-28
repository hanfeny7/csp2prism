// ===================================================
// Generated PRISM MDP model (from pat2prism)
// - Uses msgs (list) and msgs_map (dict message->index)
// - Uses spec.channels and spec.processes
// ===================================================

mdp

// Parameters
const double p_flip = 0.02;
const int MAX_NONCE = 2;

// message enum mapping (comments)  // 0 -> NO_MSG  // 1 -> CoAP_POST  // 2 -> CoAP_ACK.N_C  // 3 -> EAP_Request_Identity  // 4 -> EAP_Response_Identity.ID_P  // 5 -> EAP_Request_PSK_M1.N_S.ID_S  // 6 -> EAP_Response_PSK_M2.MAC_P  // 7 -> EAP_Request_PSK_M3.MAC_S.PCHANNEL  // 8 -> EAP_Response_PSK_M4  // 9 -> EAP_Success.MSK  // 10 -> CoAP_ACK.N_P  // 11 -> EAP_Success

// channels (global channel variable per PAT channel)global chan_ComSC : [0..11] init 0;global chan_ComCA : [0..11] init 0;
global intruder_knows_msk : bool init false;
global N_P : [0..MAX_NONCE] init 0;
global N_C : [0..MAX_NONCE] init 0;
global N_S : [0..MAX_NONCE] init 0;

global auth_so : [0..2] init 0;
global auth_ctrl : [0..2] init 0;
global auth_aaa : [0..2] init 0;


module SmartObject
  s : [0..10] init 0;

  [] s=0 -> (chan_ComSC' = 1) & (s' = 1);  [] s=1 & chan_ComSC = 2 -> (chan_ComSC' = 2) & (s' = 2);  [] s=2 & chan_ComSC = 3 -> (chan_ComSC' = 3) & (s' = 3);  [] s=3 -> (chan_ComSC' = 4) & (s' = 4);  [] s=4 & chan_ComSC = 5 -> (chan_ComSC' = 5) & (s' = 5);  [] s=5 -> (chan_ComSC' = 6) & (s' = 6);  [] s=6 & chan_ComSC = 7 -> (chan_ComSC' = 7) & (s' = 7);  [] s=7 -> (chan_ComSC' = 8) & (s' = 8);  [] s=8 & chan_ComSC = 9 -> (chan_ComSC' = 9) & (s' = 9);  [] s=9 -> (s' = 10); // nop
  // final self-loop (done state)
  [] s=10 -> (s' = 10);
endmodule
module Controller
  s : [0..17] init 0;

  [] s=0 & chan_ComSC = 1 -> (chan_ComSC' = 1) & (s' = 1);  [] s=1 -> (chan_ComSC' = 2) & (s' = 2);  [] s=2 & chan_ComSC = 10 -> (chan_ComSC' = 10) & (s' = 3);  [] s=3 -> (chan_ComSC' = 3) & (s' = 4);  [] s=4 & chan_ComSC = 4 -> (chan_ComSC' = 4) & (s' = 5);  [] s=5 -> (chan_ComCA' = 4) & (s' = 6);  [] s=6 & chan_ComCA = 5 -> (chan_ComCA' = 5) & (s' = 7);  [] s=7 -> (chan_ComSC' = 5) & (s' = 8);  [] s=8 & chan_ComSC = 6 -> (chan_ComSC' = 6) & (s' = 9);  [] s=9 -> (chan_ComCA' = 6) & (s' = 10);  [] s=10 & chan_ComCA = 7 -> (chan_ComCA' = 7) & (s' = 11);  [] s=11 -> (chan_ComSC' = 7) & (s' = 12);  [] s=12 & chan_ComSC = 8 -> (chan_ComSC' = 8) & (s' = 13);  [] s=13 -> (chan_ComCA' = 8) & (s' = 14);  [] s=14 & chan_ComCA = 9 -> (chan_ComCA' = 9) & (s' = 15);  [] s=15 -> (chan_ComSC' = 11) & (s' = 16);  [] s=16 -> (s' = 17); // nop
  // final self-loop (done state)
  [] s=17 -> (s' = 17);
endmodule
module AAA_Server
  s : [0..7] init 0;

  [] s=0 & chan_ComCA = 4 -> (chan_ComCA' = 4) & (s' = 1);  [] s=1 -> (chan_ComCA' = 5) & (s' = 2);  [] s=2 & chan_ComCA = 6 -> (chan_ComCA' = 6) & (s' = 3);  [] s=3 -> (chan_ComCA' = 7) & (s' = 4);  [] s=4 & chan_ComCA = 8 -> (chan_ComCA' = 8) & (s' = 5);  [] s=5 -> (chan_ComCA' = 9) & (s' = 6);  [] s=6 -> (s' = 7); // nop
  // final self-loop (done state)
  [] s=7 -> (s' = 7);
endmodule
module System
  s : [0..1] init 0;

  [] s=0 -> (s' = 1); // nop
  // final self-loop (done state)
  [] s=1 -> (s' = 1);
endmodule

module Intruder
  buf_msg : [0..11] init 0;

  // When a message appears on the first channel, intruder can forward / drop / store
  [] chan_ComSC != 0 & buf_msg = 0 ->
     ( chan_ComSC' = chan_ComSC ) +
     ( chan_ComSC' = 0 ) +
     ( buf_msg' = chan_ComSC & chan_ComSC' = 0 );

  // replay stored message
  [] buf_msg != 0 -> ( buf_msg' = 0 ) & ( chan_ComSC' = buf_msg );

  // learn MSK on EAP_Success (if present)
  [] chan_ComSC = 11 -> ( intruder_knows_msk' = true ) & ( chan_ComSC' = 11 );
endmodule

label "auth_complete" = (auth_so=2 & auth_ctrl=2 & auth_aaa=2);
label "msk_leaked" = intruder_knows_msk = true;