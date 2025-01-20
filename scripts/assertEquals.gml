/// assertEquals(expected, actual, caller);
var expected   = argument0;
var actual     = argument1;
var caller     = argument2;

if (expected != actual) {
    show_debug_message("TEST FAILED!    " + string(caller)  + ":    expected: "+ string(expected) + "  actual: " +string(actual));
    return false;
} else return true;
