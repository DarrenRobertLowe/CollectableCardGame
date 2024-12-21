///getTopClickable(ds_priority_queue);
/* Used by CONTROLS and EMBIGGENED_CARD_DRAWER
 * to determine the topmost interface.
 */
var clickableUnderPointer = argument0;

if (ds_priority_size(clickableUnderPointer) > 0) {
    var target = ds_priority_find_min(clickableUnderPointer);
    
    if (exists(target)) {
        return target;
    }
}

return noone;
