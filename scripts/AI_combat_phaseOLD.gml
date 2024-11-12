///AI_combat_phaseOLD()

// get a list of all creatures
ds_list_clear(ourCreatures);
ds_priority_clear(theirScariest);
//if (readDefendingCreatures == false) {
    with(CARDSLOT) {
        if (exists(card)) {
            if (global.TURN == card.owner) {
                if (creatureCanAttack(card)) {                      // only add our cards that can attack
                    ds_list_add(global.TURN.ourCreatures, card);
                }
            } else {
                ds_list_add(global.TURN.theirCreatures, card);      // add all oponent's creatures
            }
        }
    }
    
    // find the most dangerous to us (this is potentially quite complex)
    for(var i=0; i<ds_list_size(theirCreatures); i++) {
        var creature = ds_list_find_value(theirCreatures, i);
        ds_priority_add(theirScariest, creature, creature.attack);
    }
    
   // readDefendingCreatures = true;
//}



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
    var ihasDefenders = false;
    for(var i=0; i<ds_list_size(theirCreatures); i++) {
        var creature = ds_list_find_value(theirCreatures, i);
        if (creatureCanDefend(creature)) {
            ihasDefenders = true;
            break;
        }
    }
    
    // attack directly
    if (ihasDefenders == false) {
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
    
    
    else { // There are monsters to be defeated
        var decidingAttackTarget = true;
        
        // can we hurt their scariest creature with our combined forces?
        /*
        var attackTotal = 0;
        for(var i=0; i<ds_list_size(ourCreatures); i++) {
            var ourCreature = ds_list_find_value(ourCreatures, i);
            if (creatureCanAttack(ourCreature)) {
                attackTotal += ourCreature.attack;
            }
        }*/
        var ourCreature = ds_priority_delete_max(ourBestCreatures);
        
        //while (decidingAttackTarget) {
            show_debug_message("deciding on enemy to attack");
            var enemyCreature = ds_priority_delete_max(theirScariest);
            
            if (exists(enemyCreature)) {
                //if (enemyCreature.defence < attackTotal) {
                    global.target = enemyCreature;
                    waitTime = room_speed;
                    global.WAIT = true;
                    with(ourCreature) {
                        decidingAttackTarget = false;
                        event_user(1); // setup and perform the attack
                    }
                //}
            } else {
                show_debug_message("Huh... enemy creature doesn't exist...");
                decidingAttackTarget = false;
            }
        //}
    }
    
} else {
    /// CLEAN UP
    ds_priority_clear(ourBestCreatures);
    ds_list_clear(ourCreatures);
    ds_list_clear(theirCreatures);
    
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

