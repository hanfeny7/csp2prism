// ===================================================
// Generated PRISM MDP model (from pat2prism)
// - Uses msgs (list) and msgs_map (dict message->index)
// - Uses spec.channels and spec.processes
// ===================================================

mdp

// Parameters
const double p_flip = 0.02;
const int MAX_NONCE = 2;

// message enum mapping (comments)  // 0 -> NO_MSG

// channels (global channel variable per PAT channel)
global intruder_knows_msk : bool init false;
global N_P : [0..MAX_NONCE] init 0;
global N_C : [0..MAX_NONCE] init 0;
global N_S : [0..MAX_NONCE] init 0;

global auth_so : [0..2] init 0;
global auth_ctrl : [0..2] init 0;
global auth_aaa : [0..2] init 0;





label "auth_complete" = (auth_so=2 & auth_ctrl=2 & auth_aaa=2);
label "msk_leaked" = intruder_knows_msk = true;