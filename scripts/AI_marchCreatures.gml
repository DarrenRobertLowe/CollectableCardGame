///AI_playResourceCards();

// move creatures forward
var creatures = ds_list_create();
creatures = getCreatures(id);
var count = ds_list_size(creatures);

if (count > 0) {
    for(var i=0; i<count; i++) {
        var creature = ds_list_find_value(creatures, i);
        if (creature.slot.object_index == BACK_SLOT) {
            if (creature.preferredSlot == FRONT_SLOT) {
                if (creature.canMoveLane) {
                    marchCreatureForward(creature);
                }
            }
        }
    }
}

// clean up
ds_list_destroy(creatures);
