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
// ===== Global Variables =====global chan_ComTSOCli : [0..0] init 0;global chan_ComCliBT : [0..0] init 0;global chan_ComBTCli : [0..0] init 0;
global intruder_knows_msk : bool init false;
global N_P : [0..MAX_NONCE] init 0;
global N_C : [0..MAX_NONCE] init 0;
global N_S : [0..MAX_NONCE] init 0;

global auth_so : [0..2] init 0;
global auth_ctrl : [0..2] init 0;
global auth_aaa : [0..2] init 0;

// ===== Process Modules =====
module N
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CheckWriteConsistency
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module M
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NTS
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module lastWriteTs
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..2] init 0;  // Transition 0: assign_lastWriteTs  [] s=0 ->    (lastWriteTs' = ts) & (s' = 1);
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module k
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CheckSecondaryLocksExist
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module len
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module k
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module CheckCommittedConsistency
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..2] init 0;  // Transition 0: call_ts  [] s=0 ->    (s' = 1);
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module len
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts2
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..2] init 0;  // Transition 0: call_ts2  [] s=0 ->    (s' = 1);
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module k
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CheckAbortedConsistency
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module CheckWriteSkew
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module timestamp
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module write1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module write1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module write2
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module write2
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row2
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module write1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowData
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row2
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module write2
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module serializable
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Init
  s : [0..2] init 0;  // Transition 0: call_initialization  [] s=0 ->    (s' = 1);
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module M
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module rowData
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TSO
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module N
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TSOProxy
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TSOProxy
  s : [0..2] init 0;  // Transition 0: call_txnDone  [] s=0 ->    (s' = 1);
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module getTimestamp
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComTSOCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module timestamp
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module timestamp
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TSOProxy
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Client
  s : [0..2] init 0;  // Transition 0: call_BeginTransaction  [] s=0 ->    (s' = 1);
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module BeginTransaction
  s : [0..2] init 0;  // Transition 0: call_beginTransaction  [] s=0 ->    (s' = 1);
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module getTimestamp
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComTSOCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TransactionRead
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TransactionRead
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TransactionWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TransactionRead
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TransactionRead
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TransactionWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module txnDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module numTxnDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BackoffAndMaybeCleanupLock
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module lockFound
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowData
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module lockFound
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module else
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module timestamp
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module pWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module pWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module pWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowData
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowData
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module pWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module checkSnapshotIsolation
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module lockFound
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TransactionRead
  s : [0..2] init 0;  // Transition 0: call_TRead  [] s=0 ->    (s' = 1);
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComCliBT
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComBTCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module locked
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module data
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module locked
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module LOCKED
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BackoffAndMaybeCleanupLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TransactionRead
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module lastReadTimestamp
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CHECK_WRITE_SKEW
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module data
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module WK_toWrite1
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module else
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module data
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module WK_toWrite2
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TransactionWrite
  s : [0..2] init 0;  // Transition 0: call_TPrewrite  [] s=0 ->    (s' = 1);
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComCliBT
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module data
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComBTCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module success
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module success
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module abort
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module getTimestamp
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComTSOCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TCommitWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComCliBT
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComBTCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module psuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module psuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module abort
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CheckAbortedConsistency
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CheckSecondaryLocksExist
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module WriteSecondary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CHECK_COMMITTED_CONSISTENCY
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CheckCommittedConsistency
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module WriteSecondary
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module writeSecondaryDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cur
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cur
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cur
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cur
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cur
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cur
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ArrayLength
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module writeSecondaryDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module writeSecondaryDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module writeSecondaryDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module WriteSecondary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BigTable
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module N
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BigTableProxy
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BigTableProxy
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module TRead
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BigTableProxy
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TPrewrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BigTableProxy
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TCommitWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BigTableProxy
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module txnDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BigTableRead
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module ComCliBT
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module hasLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module lastWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module hasLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module hasLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module lastWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module lastWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module hasLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComBTCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module LOCKED
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module hasLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComBTCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NOT_LOCKED
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowData
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module lastWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module PrewriteIt
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module prewriteSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module if
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cur
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cur
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module timestamp
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module rowWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module while
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowData
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module data
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module cur
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module len
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module checkAtMostOneLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module row
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module PrewriteIt
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module data
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteDone
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BigTablePrewrite
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module ComCliBT
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module data
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module PrewriteIt
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module data
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComBTCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module prewriteSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComBTCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BigTableCommitWrite
  s : [0..1] init 0;
  // Final state (self-loop)
  [] s=1 -> (s' = 1);

endmodule
module ComCliBT
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rows
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commitSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commitSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commitSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowWrite
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module rowLock
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module start_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module NULL
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module checkSnapshotIsolation
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module primary
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commit_ts
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commitSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module TRUE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComBTCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module commitSuccess
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module FALSE
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module ComBTCli
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module i
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Percolator
  s : [0..2] init 0;  // Transition 0: call_Init  [] s=0 ->    (s' = 1);
  // Final state (self-loop)
  [] s=2 -> (s' = 2);

endmodule
module TSO
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module BigTable
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module N
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module Client
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CheckWriteConsistency
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
module CheckWriteSkew
  s : [0..0] init 0;
  // Final state (self-loop)
  [] s=0 -> (s' = 0);

endmodule
// ===== Labels (Observables) =====
label "auth_complete" = (auth_so=2 & auth_ctrl=2 & auth_aaa=2);
label "msk_leaked" = intruder_knows_msk = true;