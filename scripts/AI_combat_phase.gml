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


// Try to attack
global.target = noone;
if (ds_list_size(ourCreatures) > 0) {
    var lastIndex   = (ds_list_size(ourCreatures) - 1);
    var ourCreature = ds_list_find_value(ourCreatures, lastIndex);
    ds_list_delete(ourCreatures, lastIndex);
    
    if (ds_list_size(theirCreatures) == 0) {
        // attack the oppenent directly
        show_debug_message("They have no creatures! Muahahah!");
        global.target = opponent;
    } else {
        for (var i=ds_list_size(theirCreatures); i>0; i--) {
            // Try to attack their creatures
            show_debug_message("Insolant fools are standing in our way!");
            var targetCreature  = ds_list_find_value(theirCreatures, 0);
            var targetSlot      = targetCreature.slot;
            var frontSlot       = targetSlot.alternativeSlot;
            
            if (!exists(targetCreature)) 
            or (!targetCreature.position == "board") {                          // because cards can be sent to graveyard during battle
                //ds_list_delete(theirCreatures, 0);
                continue;
            } else {
                
                if (targetSlot.object_index == FRONT_SLOT) {
                    global.target = targetCreature;
                    break;
                } else {
                    if (frontSlot.card != noone) {      
                        //ds_list_delete(theirCreatures, 0);                      // remove creatures which can't be reached
                        continue;
                    } else {
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
    listedCreatures = false;
    nextPhase();
}

