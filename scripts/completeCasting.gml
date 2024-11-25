/// completeCasting();
/* Runs through the last steps that happens for all casting.
*/

//owner.mana -= castingCost;
owner.creatureResources  -= creatureResourceCost;
owner.spellResources     -= spellResourceCost;
owner.enchantResources   -= enchantResourceCost;

sendToGraveyard(owner.graveyard, id);
