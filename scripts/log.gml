/// log(string message);
var message = argument0;
var file = file_text_open_write("game.log");

if (file_exists(file)) {
    file_text_write_string(file, message);
    show_debug_message("Logged: " + string(message));
} else {
    show_debug_message("Log file not found!");
    show_debug_message("Message was : " + string(message));
}

file_text_close(file);
