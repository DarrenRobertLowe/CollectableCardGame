///autoTapResources(contestant, card);
/* Right now this should be straightforward as all resources
 * give 1 of that type, but there may need to be some more
 * complex logic added later if resources become more complex.
 */
var contestant  = argument0;
var card        = argument1;
var resources   = contestant.resourceLane.cards;

// get the needed values
var creatureResourcesNeeded = card.creatureResourceCost;
var spellResourcesNeeded    = card.spellResourceCost;
var enchantResourcesNeeded  = card.enchantResourceCost;


// remove cost equal to the amount of resources in our pool already (before tapping any cards)
creatureResourcesNeeded -= contestant.creatureResources;
spellResourcesNeeded    -= contestant.spellResources;
enchantResourcesNeeded  -= contestant.enchantResources;


// tap creature resources
while (creatureResourcesNeeded > 0) {
    for (var i=0; i<ds_list_size(resources); i++) {
        var resource = ds_list_find_value(resources, i);
        
        if (resource.creatureResources > 0) {
            with(resource) {
                event_user(CONST_TAP_EVENT); // tap the resource
            }
            
            // update the needed vs have
            creatureResourcesNeeded = card.creatureResourceCost;
            creatureResourcesNeeded -= contestant.creatureResources;
            if (creatureResourcesNeeded <= 0) then break;
        }
    }
    
    if (creatureResourcesNeeded > 0) {
        show_debug_message("autoTapResources says: Not enough creature resources! Have: " + string(contestant.creatureResources) + "   need: " +string(creatureResourcesNeeded) + " of " + string(card.creatureResourceCost) );
        return false;
    }
}

// tap spell resources
while (spellResourcesNeeded > 0) {
    for (var i=0; i<ds_list_size(resources); i++) {
        var resource = ds_list_find_value(resources, i);
        
        if (resource.spellResources > 0) {
            with(resource) {
                event_user(CONST_TAP_EVENT); // tap the resource
            }
            
            // update the needed vs have
            spellResourcesNeeded = card.spellResourceCost;
            spellResourcesNeeded -= contestant.spellResources;
            if (spellResourcesNeeded <= 0) then break;
        }
    }
    
    if (spellResourcesNeeded > 0) {
        show_debug_message("autoTapResources says: Not enough spell resources! Have: " + string(contestant.spellResources) + "   need: " +string(spellResourcesNeeded) + " of " + string(card.spellResourceCost) );
        return false;
    }
}

// tap enchantment resources
while (enchantResourcesNeeded > 0) {
    for (var i=0; i<ds_list_size(resources); i++) {
        var resource = ds_list_find_value(resources, i);
        
        if (resource.enchantResources > 0) {
            with(resource) {
                event_user(CONST_TAP_EVENT); // tap the resource
            }
            
            // update the needed vs have
            enchantResourcesNeeded = card.enchantResourceCost;
            enchantResourcesNeeded -= contestant.enchantResources;
            if (enchantResourcesNeeded <= 0) then break;
        }
    }
    
    if (enchantResourcesNeeded > 0) {
        show_debug_message("autoTapResources says: Not enough enchantment resources! Have: " + string(contestant.enchantResources) + "   need: " +string(enchantResourcesNeeded) + " of " + string(card.enchantResourceCost) );
        return false;
    }
}

return true;
