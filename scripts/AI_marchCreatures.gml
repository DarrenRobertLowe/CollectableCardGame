///AI_playResourceCards();

// move creatures forward
var creatures = getCreatures(id);
var count = ds_list_size(creatures);

if (count > 0) {
    for(var i=0; i<count; i++) {
        var creature = ds_list_find_value(creatures, i);
        if (creature.slot.object_index == BACK_SLOT) {
            if (creature.preferredSlot == FRONT_SLOT) {
                if (creatureCanMoveLane(creature)) {
                    marchCreatureForward(creature);
                }
            }
        }
    }
}


// clean up
AI_finishedMarchingCreatures = true;
if (ds_exists(creatures, ds_type_list)) {
    ds_list_destroy(creatures);
}
