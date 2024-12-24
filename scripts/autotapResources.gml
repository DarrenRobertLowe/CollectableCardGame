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


if  (creatureResourcesNeeded == 0)
and (spellResourcesNeeded == 0)
and (enchantResourcesNeeded == 0) {
    exit;
}


// remove cost equal to the amount of resources in our pool already (not untapped cards)
creatureResourcesNeeded -= contestant.creatureResources;
spellResourcesNeeded    -= contestant.spellResources;
enchantResourcesNeeded  -= contestant.enchantResources;


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
}

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
}


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
}
