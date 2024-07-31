/// finishCasting();
/* Runs through the last steps that happens for all casting.
*/

owner.mana -= castingCost;
choosingTarget = false;
sendToGraveyard(self);
