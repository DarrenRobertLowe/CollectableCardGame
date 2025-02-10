///canAffordCasting(card id)
var card = argument0;
show_debug_message("Checking card cost: id: " +string(card) + "  " + string(object_get_name(card.object_index)));

var lane = card.owner.resourceLane;
var allResourceCards = lane.cards;

// get everything in the allResourceCards list that hasn't yet been tapped
var untappedResources = getUntappedResources(allResourceCards);

// count total resources
var totalCreatureResources  = countCreatureResources(untappedResources);
var totalSpellResources     = countSpellResources(untappedResources);
var totalEnchantResources   = countEnchantResources(untappedResources);

// add existing resources in pool
totalCreatureResources += card.owner.creatureResources;
totalSpellResources    += card.owner.spellResources;
totalEnchantResources  += card.owner.enchantResources;

// clean up
ds_list_destroy(untappedResources);

if  (totalCreatureResources >= card.creatureResourceCost)
and (totalSpellResources    >= card.spellResourceCost)
and (totalEnchantResources  >= card.enchantResourceCost) {
    show_debug_message("creatureResources : "   + string(totalCreatureResources)    +" >= " + string(card.creatureResourceCost));
    show_debug_message("spellResources : "      + string(totalSpellResources)       +" >= " + string(card.spellResourceCost));
    show_debug_message("enchantResources : "    + string(totalEnchantResources)     +" >= " + string(card.enchantResourceCost));
    return true
}
