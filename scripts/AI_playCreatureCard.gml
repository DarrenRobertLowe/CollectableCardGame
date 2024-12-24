/// AI_playCreatureCard()
show_debug_message("running AI_playCreatureCard()");

// determine what to cast or summon
if (AI_finishedSummoning == false) {
    var AI_creatureList = ds_priority_create();
    var cards = hand.contents;
    
    // create a priority queue of creatures to summon, ranked by attack 
    for(var i=0; i<ds_list_size(cards); i++) {
        card = ds_list_find_value(cards, i);
        if (card.type == CREATURE_CARD and canAffordCasting(card)) {
            ds_priority_add(AI_creatureList, card, card.attack);
        }
    }
    
    // we have a creature card to play
    if (ds_priority_size(AI_creatureList) > 0) {
        show_debug_message("found creature cards in our hand");
        var creature = ds_priority_delete_max(AI_creatureList);
        
        var backSlots = ds_list_create();
        backSlots = getAvailableBackSlots(backSlots);
        var slot = noone;
        if (ds_list_size(backSlots) > 0) {
            for(var i=0; i<ds_list_size(backSlots); i++) {
                slot = ds_list_find_value(backSlots, 0);
                if (slot.alternativeSlot.card == noone)         // prefer slots where there's nothing in the font lane
                or (i == ds_list_size(backSlots)-1) {           // or just take the lastmost slot
                    break;
                }
            }
        }
        
        if (slot != noone) {
            creature.slot = slot;
            slot.card = creature;
            with(creature) {
                other.waitTime = room_speed;
                autoTapResources(global.enemy, creature);
                summonCreature(creature);
            }
        } else {
            show_debug_message("No available creature slots found.");
        }
        
        // clean up
        ds_list_destroy(backSlots);
    } else {
        show_debug_message("No more creatures to summon");
        AI_finishedSummoning = true;
        show_debug_message("finished AI_playCreatureCard()");
    }
    
    
    // clean up
    ds_priority_destroy(AI_creatureList);
}
