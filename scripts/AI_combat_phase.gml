/// AI_combat_phase();

show_debug_message("******* COMBAT *******");


// get all our creatures that can attack
if (listedCreatures == false) {
    with (CARDSLOT) {
        if (card != noone) {
            if (card.owner == global.TURN) {
                if (creatureCanAttack(card)) {
                    ds_list_add(global.TURN.ourCreatures, card);
                }
            } else {
                if (creatureCanDefend(card)) {
                    ds_list_add(global.TURN.theirCreatures, card);
                }
            }
        }
    }
    
    listedCreatures = true;
}


// DEBUG show list of enemies
for (var i=0; i<ds_list_size(theirCreatures); i++) {
    var creature = ds_list_find_value(theirCreatures, i);
    show_debug_message("Enemies include: " + string(creature.id) + " : " + string(creature.name));
}

// Try to attack
global.target = noone;
if (ds_list_size(ourCreatures) > 0) {
    var lastIndex   = (ds_list_size(ourCreatures) - 1);
    var ourCreature = ds_list_find_value(ourCreatures, lastIndex);
    ds_list_delete(ourCreatures, lastIndex); // "for each of our creatures..."
    
    if (ds_list_size(theirCreatures) == 0) {
        // attack the oppenent directly
        show_debug_message("They have no creatures! Muahahah!");
        global.target = opponent;
    } else {
        for (var i=ds_list_size(theirCreatures)-1; i>0; i--) {
            // Try to attack their creatures
            show_debug_message("Insolant fools are standing in our way!");
            var targetCreature  = ds_list_find_value(theirCreatures, i);
            show_debug_message(" Looking at " + targetCreature.name + " (" + string(targetCreature) + ")");
            var targetSlot      = targetCreature.slot;
            var frontSlot       = targetSlot.alternativeSlot;
            
            if !(exists(targetCreature)) 
            or (targetCreature.position != "board") {   // because cards can be sent to graveyard during battle
                //ds_list_delete(theirCreatures, 0);
                show_debug_message("Either targetCreature != exist() or targetCreature.position != board");
                continue;
            } else {
                if (targetSlot.object_index == FRONT_SLOT) {
                    show_debug_message("Target is in front lane! We'll attack this target!");
                    global.target = targetCreature;
                    break;
                } else {
                    show_debug_message("target is in the back lane.");
                    if (frontSlot.card != noone) {
                        show_debug_message("Front lane is not empty, we'll ignore this target...");
                        ds_list_delete(theirCreatures, i);                      // remove creatures which can't be reached
                        continue;
                    } else {
                        show_debug_message("Front lane is empty, we'll attack this target!");
                        global.target = targetCreature;
                    }
                }
            }
        }
    }
    
    // successfully found a valid target?
    if (global.target != noone) {
        attacked = true;
        waitTime = room_speed;                                          // add a delay between attacks
        with(ourCreature) {
            event_user(1);                                              // perform the attack
        }
    }
} else {
    nextPhase();
}
