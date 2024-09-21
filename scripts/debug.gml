///debug(string message)
/* Shows the given debug message if global.DEBUG = true
 */
 
var message = argument0;

if (global.DEBUG) {
    show_debug_message(argument0);
}
