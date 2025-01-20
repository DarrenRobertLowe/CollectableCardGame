///AI_playEnchantments();

if (AI_finishedEnchanting == false) {

    // get the cards in the hand
    var cards = hand.contents;
    
    // ! escape now if no cards
    if (ds_list_size(cards) == 0) {
        AI_finishedEnchanting = true;
        exit;
    }
    
    
    
    // create a list of friendly creatures we can put an enchantment on.
    var creatures = getCreatures(global.TURN);
    
    // To do: filter any that can't have an enchantment for some reason
    
    // To do:
    // for each enchantment...
        // if the enchantment improves hp, arrange by hp, cast on the lowest
        // else if the enchantment improves defence, arrange by defence, cast on the lowest
        // else if the enchantment improves attack, arrange by attack, cast on the lowest
        // else choose the monster with the strongest attack, cast on that one.
    
    // ! escape now if no creatures
    if (ds_list_size(creatures) == 0) {
        ds_list_destroy(creatures);
        AI_finishedEnchanting = true;
        exit;
    }
    
    
    
    // get a list of enchantments in an ordered queue
    var AI_enchantmentQueue = ds_priority_create();
    
    // generate a list of the ones we can cast
    for(var i=0; i<ds_list_size(cards); i++) {
        card = ds_list_find_value(cards, i);
        if (card.type == ENCHANTMENT_CARD and canAffordCasting(card)) {
            ds_priority_add(AI_enchantmentQueue, card, getTotalCastingCost(card)); // assume the cost maps to it being a better enchantment, this could be informed by a queue instead
        }
    }
    
    // ! escape now if no castable enchantments
    if (ds_priority_size(AI_enchantmentQueue) == 0) {
        ds_list_destroy(creatures);
        AI_finishedEnchanting = true;
        exit;
    }
    
    
    // convert priority queue to an actual list
    var size = ds_priority_size(AI_enchantmentQueue);
    show_debug_message("ds_priority_size(AI_enchantmentQueue) = " +string(size));
    if (ds_exists(AI_enchantmentQueue, ds_type_priority)) {
        AI_enchantmentList = priorityQueueToList(AI_enchantmentQueue);
        ds_priority_destroy(AI_enchantmentQueue); // clean up
    }
    
    // DEBUG
    var size = ds_list_size(AI_enchantmentList);
    show_debug_message("ds_list_size(AI_enchantmentList) = " + string(size));
    for(var i=0; i<size; i++) {
        var enchantment = ds_list_find_value(AI_enchantmentList, i);
        show_debug_message(enchantment.name);
    }
    
    var target = ds_list_find_value(creatures, irandom(ds_list_size(creatures)-1));
    
    var card = ds_list_find_value(AI_enchantmentList, 0);
    card.target = target;
    show_debug_message("************** card = " + string(card));
    
    if (exists(card)) {
        with(card) {
            event_user(0);
        }
    } else {
        show_debug_message("ERROR in AI_playEnchantments: card " + string(card) + " doesn't exist!");
    }
    
    
    // clean up
    if (ds_exists(creatures, ds_type_list)) {
        ds_list_destroy(creatures);
    }

    show_debug_message("FINISHED AI_playEnchantments()!");
}
