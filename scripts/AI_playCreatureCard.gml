/// AI_playCreatureCard()
show_debug_message("running AI_playCreatureCard()");
// determine what to cast or summon
if (AI_finishedSummoning == false) {
    var monsterList = ds_priority_create();
    var cards = hand.contents;
    
    for(var i=0; i<ds_list_size(cards); i++) {
        card = ds_list_find_value(cards, i);
        // highest attack creature
        if (card.type == CREATURE_CARD and card.castingCost <= mana) {
            ds_priority_add(monsterList, card, card.attack);
        }
    }
    
    // we have a monster card to play
    if (ds_priority_size(monsterList) > 0) {
        show_debug_message("found monster cards we can summon");
        var monster = ds_priority_delete_max(monsterList);
        
        with(monster) {
            if (basicActivationChecks()) {
                other.waitTime = room_speed;
                event_user(0); // summon the creature
            }
        }
        
        
    } else {
        show_debug_message("No more monsters to summon");
        AI_finishedSummoning = true;
    }
}

show_debug_message("finished AI_playCreatureCard()");
