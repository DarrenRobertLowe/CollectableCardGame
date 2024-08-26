/// completeCasting();
/* Runs through the last steps that happens for all casting.
*/

owner.mana -= castingCost;
sendToGraveyard(owner.graveyard, id);
