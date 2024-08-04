/// basicActivationChecks();

if (owner == global.player) {
    if (owner.mana > castingCost) {
        casting = true;
    } else {
        show_debug_message("Not enough mana to cast!");
        // we could play a sound or have the text appear to the user somehow.
    }
}

castingChecking = false;
