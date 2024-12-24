///getAvailableBackSlots(list);
var list = argument0;

with(BACK_SLOT) {
    if (owner == global.TURN) {
        if (card == noone) {
            ds_list_add(list, id);
        }
    }
}
return list;
