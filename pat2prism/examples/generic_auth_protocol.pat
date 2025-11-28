// ====================================================
// Generic Authentication Protocol
// Purpose: Demonstrate pat2prism for paper
// ====================================================

var initiator_auth : [0..2];
var responder_auth : [0..2];
var mutual_auth_done : bool;
var replay_detected : bool;

channel ComAB;

process Initiator() =
  ComAB!InitMsg ->
  ComAB?Challenge ->
  (initiator_auth' = 1) ->
  ComAB!Response ->
  (initiator_auth' = 2) ->
  ComAB?Confirmation ->
  (mutual_auth_done' = true) ->
  Skip
;

process Responder() =
  ComAB?InitMsg ->
  (responder_auth' = 1) ->
  ComAB!Challenge ->
  ComAB?Response ->
  (responder_auth' = 2) ->
  ComAB!Confirmation ->
  (mutual_auth_done' = true) ->
  Skip
;

system Initiator() || Responder();
