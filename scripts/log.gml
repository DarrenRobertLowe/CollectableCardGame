/// log(string message, boolean isError?);
var message = argument0;
var isError = argument1;
var outString = "";

ourString = message;
if (isError) {
    outString += "#" + debug_get_callstack();
    show_error(outString, false);
}

// write the outString here with file i/o
