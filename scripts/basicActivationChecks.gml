/// basicActivationChecks();
if  (owner.creatureResource >= creatureResourceCost)
and (owner.spellResource    >= spellResourceCost)
and (owner.enchantResource  >= enchantResourceCost) {
//if (owner.mana > castingCost) {
    return true;
} else {
    debug("Not enough mana to cast!");
    // we could play a sound or have the text appear to the user somehow.
}
