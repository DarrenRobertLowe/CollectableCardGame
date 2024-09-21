/// log_error(error string, write to log, show as popup warning);

var message     = argument0;
var writeToLog  = argument1;
var popup       = argument2;
show_debug_message(message);

if (writeToLog) {
    // write to external log file here 
}

if (popup) {
    show_message(message);
}
