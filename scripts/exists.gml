/// exists(instance);

var instance = argument0;


if !(is_undefined(instance)) {
    if  (instance > 0)
    and (instance_exists(instance)) {
        return true;
    } else log("Warning in exists(): " + string(instance) +" does not exist. Called by " + string(id));
} else log("Error in exists(): " + string(instance) +" was undefined");

return false;
