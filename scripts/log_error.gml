/// log_error(string, write to log?);

var message    = argument0;
var writeToLog = argument1;
show_debug_message(message);

if (writeToLog) {
    // write to external log file here 
}
