///canAffordCasting(card id)
var card = argument0;
show_debug_message("Checking card cost: id: " +string(card) + "  " + string(object_get_name(card.object_index)));

var lane = card.owner.resourceLane;
var resources = lane.cards;

// find the untapped resources
var untappedResources = ds_list_create();
getUntappedResources(resources, untappedResources);

// count total resources
var totalCreatureResources  = countCreatureResources(untappedResources);
var totalSpellResources     = countSpellResources(untappedResources);
var totalEnchantResources   = countEnchantResources(untappedResources);

// clean up
ds_list_destroy(untappedResources);

if  (totalCreatureResources >= card.creatureResourceCost)
and (totalSpellResources    >= card.spellResourceCost)
and (totalEnchantResources  >= card.enchantResourceCost) {
    show_debug_message("creatureResources : " + string(totalCreatureResources) +" >= " + string(card.creatureResourceCost));
    show_debug_message("spellResources : " + string(totalSpellResources) +" >= " + string(card.spellResourceCost));
    show_debug_message("enchantResources : " + string(totalEnchantResources) +" >= " + string(card.enchantResourceCost));
    return true
}
