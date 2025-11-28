// Minimal working PAT example
channel ch 0;

var x = 0;
var y = false;

SimpleProcess() = 
    ch!msg ->
    ch?msg ->
    Skip();

System() = SimpleProcess() || SimpleProcess();
