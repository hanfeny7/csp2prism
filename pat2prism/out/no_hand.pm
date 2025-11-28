// ===================================================
// Generated PRISM MDP model (from pat2prism)
// - Uses msgs (list) and msgs_map (dict message->index)
// - Uses spec.channels and spec.processes
// ===================================================

mdp

// Parameters
const double p_flip = 0.02;
const int MAX_NONCE = 2;

// message enum mapping (comments)  // 0 -> NO_MSG  // 1 -> EUI  // 2 -> MsgEncryptData  // 3 -> nonce_c.MIC1  // 4 -> msk  // 5 -> second_nonce_c.next_MIC1  // 6 -> third_nonce_c.next_MIC1  // 7 -> MSK  // 8 -> EUI1  // 9 -> MsgEncryptData1  // 10 -> MsgEncryptData2  // 11 -> fnonce_c.fMIC1  // 12 -> ffnonce_c.ffMIC1  // 13 -> msk1  // 14 -> msk2

// channels (global channel variable per PAT channel)global chan_ComSC : [0..14] init 0;global chan_ComCA : [0..14] init 0;global chan_FakeS : [0..14] init 0;global chan_FakeC : [0..14] init 0;global chan_FakeA : [0..14] init 0;
global intruder_knows_msk : bool init false;
global N_P : [0..MAX_NONCE] init 0;
global N_C : [0..MAX_NONCE] init 0;
global N_S : [0..MAX_NONCE] init 0;

global auth_so : [0..2] init 0;
global auth_ctrl : [0..2] init 0;
global auth_aaa : [0..2] init 0;


module SmartObject
  s : [0..27] init 0;

  [] s=0 -> (s' = 1); // call Generate_Nonce_c  [] s=1 -> (chan_ComSC' = 1) & (s' = 2);  [] s=2 & chan_ComSC = 2 -> (chan_ComSC' = 2) & (s' = 3);  [] s=3 -> (s' = 4); // call HMAC_Ek2  [] s=4 -> (s' = 5); // call CheckDecrypt  [] s=5 -> (s' = 6); // call Decrypt  [] s=6 -> (s' = 7); // call HMAC_Ak1  [] s=7 -> (s' = 8); // call Compute_MIC1  [] s=8 -> (chan_ComSC' = 3) & (s' = 9);  [] s=9 & chan_ComSC = 4 -> (chan_ComSC' = 4) & (s' = 10);  [] s=10 -> (s' = 11); // call CheckGetMSK  [] s=11 -> (s' = 12); // nop  [] s=12 -> (s' = 13); // call Generate_Nonce_c  [] s=13 -> (chan_FakeS' = 1) & (s' = 14);  [] s=14 & chan_FakeS = 2 -> (chan_FakeS' = 2) & (s' = 15);  [] s=15 -> (s' = 16); // call HMAC_Ek2  [] s=16 -> (s' = 17); // call CheckDecrypt  [] s=17 -> (s' = 18); // call Decrypt  [] s=18 -> (s' = 19); // call HMAC_Ak1  [] s=19 -> (s' = 20); // call Compute_MIC1  [] s=20 -> (chan_FakeS' = 3) & (s' = 21);  [] s=21 & chan_FakeS = 4 -> (chan_FakeS' = 4) & (s' = 22);  [] s=22 -> (s' = 23); // call CheckGetMSK  [] s=23 -> (s' = 24); // assign data_access  [] s=24 -> (s' = 25); // nop  [] s=25 -> (s' = 26); // nop  [] s=26 -> (s' = 27); // nop
  // final self-loop (done state)
  [] s=27 -> (s' = 27);
endmodule
module Controller
  s : [0..18] init 0;

  [] s=0 & chan_ComSC = 1 -> (chan_ComSC' = 1) & (s' = 1);  [] s=1 -> (chan_ComCA' = 1) & (s' = 2);  [] s=2 & chan_ComCA = 2 -> (chan_ComCA' = 2) & (s' = 3);  [] s=3 -> (chan_ComSC' = 2) & (s' = 4);  [] s=4 & chan_ComSC = 5 -> (chan_ComSC' = 5) & (s' = 5);  [] s=5 -> (chan_ComCA' = 5) & (s' = 6);  [] s=6 & chan_ComCA = 4 -> (chan_ComCA' = 4) & (s' = 7);  [] s=7 -> (chan_ComSC' = 4) & (s' = 8);  [] s=8 -> (s' = 9); // nop  [] s=9 & chan_FakeS = 1 -> (chan_FakeS' = 1) & (s' = 10);  [] s=10 -> (chan_FakeA' = 1) & (s' = 11);  [] s=11 & chan_FakeA = 2 -> (chan_FakeA' = 2) & (s' = 12);  [] s=12 -> (chan_FakeS' = 2) & (s' = 13);  [] s=13 & chan_FakeS = 5 -> (chan_FakeS' = 5) & (s' = 14);  [] s=14 -> (chan_FakeA' = 5) & (s' = 15);  [] s=15 & chan_FakeA = 4 -> (chan_FakeA' = 4) & (s' = 16);  [] s=16 -> (chan_FakeS' = 4) & (s' = 17);  [] s=17 -> (s' = 18); // nop
  // final self-loop (done state)
  [] s=18 -> (s' = 18);
endmodule
module AAA_Server
  s : [0..25] init 0;

  [] s=0 & chan_ComCA = 1 -> (chan_ComCA' = 1) & (s' = 1);  [] s=1 -> (s' = 2); // call HMAC_Ek1  [] s=2 -> (s' = 3); // call Generate_Nonce_s  [] s=3 -> (s' = 4); // call Generate_Timestamp  [] s=4 -> (s' = 5); // call Encrypt  [] s=5 -> (chan_ComCA' = 2) & (s' = 6);  [] s=6 & chan_ComCA = 6 -> (chan_ComCA' = 6) & (s' = 7);  [] s=7 -> (s' = 8); // call HMAC_Ak2  [] s=8 -> (s' = 9); // call Compute_MIC2  [] s=9 -> (chan_ComCA' = 7) & (s' = 10);  [] s=10 -> (s' = 11); // assign data_access  [] s=11 -> (chan_ComCA' = 7) & (s' = 12);  [] s=12 -> (s' = 13); // nop  [] s=13 & chan_FakeA = 1 -> (chan_FakeA' = 1) & (s' = 14);  [] s=14 -> (s' = 15); // call HMAC_Ek1  [] s=15 -> (s' = 16); // call Generate_Nonce_s  [] s=16 -> (s' = 17); // call Generate_Timestamp  [] s=17 -> (s' = 18); // call Encrypt  [] s=18 -> (chan_FakeA' = 2) & (s' = 19);  [] s=19 & chan_FakeA = 6 -> (chan_FakeA' = 6) & (s' = 20);  [] s=20 -> (s' = 21); // call HMAC_Ak2  [] s=21 -> (s' = 22); // call Compute_MIC2  [] s=22 -> (chan_FakeA' = 7) & (s' = 23);  [] s=23 -> (s' = 24); // nop  [] s=24 -> (s' = 25); // nop
  // final self-loop (done state)
  [] s=25 -> (s' = 25);
endmodule
module Intruder
  s : [0..17] init 0;

  [] s=0 & chan_FakeS = 1 -> (chan_FakeS' = 1) & (s' = 1);  [] s=1 -> (chan_FakeC' = 1) & (s' = 2);  [] s=2 & chan_FakeC = 8 -> (chan_FakeC' = 8) & (s' = 3);  [] s=3 -> (chan_FakeA' = 8) & (s' = 4);  [] s=4 & chan_FakeA = 9 -> (chan_FakeA' = 9) & (s' = 5);  [] s=5 -> (chan_FakeC' = 9) & (s' = 6);  [] s=6 & chan_FakeC = 10 -> (chan_FakeC' = 10) & (s' = 7);  [] s=7 -> (chan_FakeS' = 10) & (s' = 8);  [] s=8 & chan_FakeS = 11 -> (chan_FakeS' = 11) & (s' = 9);  [] s=9 -> (chan_FakeC' = 11) & (s' = 10);  [] s=10 & chan_FakeC = 12 -> (chan_FakeC' = 12) & (s' = 11);  [] s=11 -> (chan_FakeA' = 12) & (s' = 12);  [] s=12 & chan_FakeA = 13 -> (chan_FakeA' = 13) & (s' = 13);  [] s=13 -> (chan_FakeC' = 13) & (s' = 14);  [] s=14 & chan_FakeC = 14 -> (chan_FakeC' = 14) & (s' = 15);  [] s=15 -> (chan_FakeS' = 14) & (s' = 16);  [] s=16 -> (s' = 17); // nop
  // final self-loop (done state)
  [] s=17 -> (s' = 17);
endmodule
module System
  s : [0..1] init 0;

  [] s=0 -> (s' = 1); // nop
  // final self-loop (done state)
  [] s=1 -> (s' = 1);
endmodule

module Intruder
  buf_msg : [0..14] init 0;

  // When a message appears on the first channel, intruder can forward / drop / store
  [] chan_ComSC != 0 & buf_msg = 0 ->
     ( chan_ComSC' = chan_ComSC ) +
     ( chan_ComSC' = 0 ) +
     ( buf_msg' = chan_ComSC & chan_ComSC' = 0 );

  // replay stored message
  [] buf_msg != 0 -> ( buf_msg' = 0 ) & ( chan_ComSC' = buf_msg );

  // learn MSK on EAP_Success (if present)
  [] chan_ComSC = 0 -> ( intruder_knows_msk' = true ) & ( chan_ComSC' = 0 );
endmodule

label "auth_complete" = (auth_so=2 & auth_ctrl=2 & auth_aaa=2);
label "msk_leaked" = intruder_knows_msk = true;