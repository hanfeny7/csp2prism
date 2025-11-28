// Test file with intentional errors for error handling
// This tests how pat2prism handles malformed PAT code

// Valid channel
channel test_chan [2];

// Invalid identifier (starts with number)
var 123invalid = 0;

// PRISM keyword as identifier  
var module = 5;

// Missing semicolon
var x = 10

// Process with undefined reference
Process1() = 
    undefined_action -> Skip;

// Incomplete process definition
Process2() =

// Valid process for comparison
ValidProcess() = 
    test_chan!msg1 -> Skip;
