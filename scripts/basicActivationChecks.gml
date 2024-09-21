/// basicActivationChecks();
if (owner.mana > castingCost) {
    return true;
} else {
    debug("Not enough mana to cast!");
    // we could play a sound or have the text appear to the user somehow.
}
