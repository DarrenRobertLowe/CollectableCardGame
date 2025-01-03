/// AI_combat_phase();

show_debug_message("******* COMBAT *******");


// get all our creatures that can attack and the opponent's defenders
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


// can we attack?
if (ds_list_size(ourCreatures) > 0) {
    show_debug_message("AI: We have creatures.");
    var creature = ds_list_find_value(ourCreatures, ds_list_size(ourCreatures) - 1);
    ds_list_delete(ourCreatures, ds_list_size(ourCreatures) - 1);
    
    // can we attack directly?
    if (ds_list_size(theirCreatures) == 0) {
        show_debug_message("Attacking opponent directly");
        global.target = opponent;
        waitTime = room_speed;
        with(creature) {
            event_user(1); // setup and perform the attack
        }
    } else {
        attacked = false;
        while(attacked == false) {
            // attack their creatures
            if (ds_list_size(theirCreatures) > 0) {
                var targetCreature = ds_list_find_value(theirCreatures, 0);
                
                if  (exists(targetCreature)) 
                and (targetCreature.position == "board") { // cards can be sent to graveyard during battle
                    global.target = targetCreature;
                    waitTime = room_speed;
                    attacked = true;
                    
                    with(creature) {
                        event_user(1); // setup and perform the attack
                    }
                } else {
                    // remove creatures that are no longer on the board
                    ds_list_delete(theirCreatures, 0);
                }
            } else {
                attacked = true;
                
                show_debug_message("Attacking opponent directly");
                global.target = opponent;
                waitTime = room_speed;
                with(creature) {
                    event_user(1); // setup and perform the attack
                }
            }
        }
    }
} else {
    listedCreatures = false;
    nextPhase();
}

