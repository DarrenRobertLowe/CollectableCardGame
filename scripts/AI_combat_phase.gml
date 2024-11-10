///AI_combat_phase()

// get a list of all creatures
var ourCreatures     = ds_list_create();
var theirCreatures   = ds_list_create();
var ourBestCreatures = ds_priority_create();

with(CARDSLOT) {
    if (exists(card)) {
        if (global.TURN == card.owner) {
            if (creatureCanAttack(card)) {          // only add our cards that can attack
                ds_list_add(ourCreatures, card);
            }
        } else {
            ds_list_add(theirCreatures, card);      // add all oponent's creatures
        }
    }
}

// if ourCreatures is not empty
if (ds_list_size(ourCreatures) > 0) {
    show_debug_message("We have " + string(ds_list_size(ourCreatures)) + " creatures that can attack");
    
    // organise those creatures by attack power
    for(var i=0; i<ds_list_size(ourCreatures); i++) {
        var creature = ds_list_find_value(ourCreatures, i);
        ds_priority_add(ourBestCreatures, creature, creature.attack);
    }
    
    // can we attack the opponent directly?
    // NOTE: this might depend on the monsters being in the correct lane, and currently capable
    // of defending. Attacks should get marked with stuff like "flying" and "first-strike" and
    // defenders should be checked for the same.
    var hasDefenders = false;
    for(var i=0; i<ds_list_size(theirCreatures); i++) {
        var creature = ds_list_find_value(theirCreatures, i);
        if (creatureCanDefend(creature)) {
            hasDefenders = true;
            break;
        }
    }
    
    // then attack directly
    if (hasDefenders == false) {
        show_debug_message("We can attack the opponent directly");
        var creature = ds_priority_delete_max(ourBestCreatures);
        show_debug_message("our Best Creature: " + string(creature));
        global.target = opponent;
        waitTime = room_speed;
        global.WAIT = true;
        with(creature) {
            event_user(1); // setup and perform the attack
        }
    }
    
    // There are monsters to be defeated
    else {
        // list all opponent monsters
        // find the most dangerous to us (this is potentially quite complex)
            // for now we'll go with who has the highest attack, followed by defence if equal
        // can we kill it with our combined forces?
    }
    
} else {
    /// CLEAN UP
    ds_priority_destroy(ourBestCreatures);
    ds_list_destroy(ourCreatures);
    ds_list_destroy(theirCreatures);
    
    show_debug_message("Deliberately finishing combat phase");
    nextPhase();
}



    // Else :
        // starting from the weakest power creature we have, add all enemy creatures that have less defence than our attack to a list
        // arrange that list by threat (e.g. special effect card, attack power, flying, first-strike, etc.
        // can we actually hit them, e.g. consider flying
        // would attacking them kill our creature and not theirs? e.g. consider first-strke
        // attack with the creature
// Else:
    // end combat phase
