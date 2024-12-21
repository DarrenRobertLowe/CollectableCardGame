/// exists(instance);

var instance = argument0;

if !(is_undefined(instance)) {
    if (instance > 0) {
        if (instance_exists(instance)) {
            return true;
        } else log("Warning in exists(): " + string(instance) +" does not exist. Called by " + string(id) + "(" + string(object_get_name(object_index)) + ")");
    }
} else log("Error in exists(): " + string(instance) +" was undefined");

return false;
