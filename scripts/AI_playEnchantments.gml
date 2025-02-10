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
    
    // ! escape now if no creatures
    if (ds_list_size(creatures) == 0) {
        ds_list_destroy(creatures);
        AI_finishedEnchanting = true;
        exit;
    }
    
    // To do: prioriotize best enchantment
    // for each enchantment...
        // if the enchantment improves hp, arrange by hp, cast on the lowest
        // else if the enchantment improves defence, arrange by defence, cast on the lowest
        // else if the enchantment improves attack, arrange by attack, cast on the lowest
        // else choose the monster with the strongest attack, cast on that one.
    
    // get a list of enchantments in an ordered queue
    var AI_enchantmentQueue = ds_priority_create();
    
    // generate a list of the ones we can cast
    for(var i=0; i<ds_list_size(cards); i++) {
        enchantment = ds_list_find_value(cards, i);
        if (enchantment.type == ENCHANTMENT_CARD) {
            if (canAffordCasting(enchantment)) {
                ds_priority_add(AI_enchantmentQueue, enchantment, getTotalCastingCost(enchantment)); // we're assuming for now that the casting cost maps to it being a better enchantment, this could be informed by a queue instead
            }
        }
    }
    
    // ! escape now if no castable enchantments
    if (ds_priority_size(AI_enchantmentQueue) == 0) {
        ds_list_destroy(creatures);
        AI_finishedEnchanting = true;
        exit;
    }
    
    // LIST CASTABLE ENCHANTMENTS
    // convert priority queue to an actual list
    var size = ds_priority_size(AI_enchantmentQueue);
    if (ds_exists(AI_enchantmentQueue, ds_type_priority)) {
        AI_enchantmentList = priorityQueueToList(AI_enchantmentQueue);
        ds_priority_destroy(AI_enchantmentQueue); // clean up
    }
    
    
    // DEBUG: print enchantment list size and each enchantment name
    /*****************************************************************************/
    var size = ds_list_size(AI_enchantmentList);
    show_debug_message("ds_list_size(AI_enchantmentList) = " + string(size));
    for(var i=0; i<size; i++) {
        var enchantment = ds_list_find_value(AI_enchantmentList, i);
        show_debug_message(enchantment.name);
    }
    /*****************************************************************************/
    
    
    // CHOOSE TARGET
    var target = ds_list_find_value(creatures, irandom(ds_list_size(creatures)-1));     // NEEDS TO ACTUALLY DECIDE THE BEST UNIT
    
    var enchantment = ds_list_find_value(AI_enchantmentList, 0);
    show_debug_message("************** enchantment = " + string(enchantment));
    
    
    if (exists(enchantment)) {
        enchantment.target = target;
        with(enchantment) {
            autoTapResources(owner, id); // tap for mana
            event_user(0); // "cast the spell"
        }
    } else {
        show_debug_message("ERROR in AI_playEnchantments: enchantment " + string(enchantment) + " doesn't exist!");
    }
    
    
    // clean up
    if (ds_exists(creatures, ds_type_list)) {
        ds_list_destroy(creatures);
    }
}
