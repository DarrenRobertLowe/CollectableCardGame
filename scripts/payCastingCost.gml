/// payCastingCost();
/* Runs through the last steps that happens for all casting.
*/
show_debug_message("WE ARE PAYING THE COST! We have " + string(owner.enchantResources) + " enchantment resources before...");

owner.creatureResources  -= creatureResourceCost;
owner.spellResources     -= spellResourceCost;
owner.enchantResources   -= enchantResourceCost;


show_debug_message("We have " +string(owner.enchantResources) + " after!");
