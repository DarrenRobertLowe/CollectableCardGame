/// exists(instance);

var instance = argument0;


if !(is_undefined(instance)) {
    if  (instance > 0)
    and (instance_exists(instance)) {
        return true;
    } else log("Warning in exist(): " + string(instance) +" does not exist.");
} else log("Error in exist(): " + string(instance) +" was undefined");

return false;
