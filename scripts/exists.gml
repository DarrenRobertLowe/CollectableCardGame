/// exists(target);

var target = argument0;

if !(is_undefined(target)) {
    if (target > 0) and (instance_exists(target)) {
        return true;
    } else {
        log_error("exist() found target instance " + string(target) +" does not exist", true);
    }
} else {
    log_error("exist() found target " + string(target) +" was undefined", true);
}

return false;
