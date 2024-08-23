/// exists(instance);

var instance = argument0;

if !(is_undefined(instance)) {
    if (instance > 0) and (instance_exists(instance)) {
        return true;
    } else log_error("Error in exist(): " + string(instance) +" does not exist", true, global.DEBUG);
} else log_error("Error in exist(): " + string(instance) +" was undefined", true, global.DEBUG);

return false;
