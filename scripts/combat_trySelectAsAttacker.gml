///combat_trySelectAsAttacker();

if (global.TURN == owner) {
    // start the attacking state
    if (creatureCanAttack(id)) {
        show_debug_message("We can indeed attack");
        attacking = true;
        global.currentCard = id;
        global.target = noone;
        global.choosingAttackTarget = true;
        forceHideCards();
    } else show_debug_message("Can't attack... hmm");
}
