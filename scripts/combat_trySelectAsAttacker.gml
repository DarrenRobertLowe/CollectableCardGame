///combat_trySelectAsAttacker();

if (global.TURN == owner) {
    if (creatureCanAttack(id)) {
        show_debug_message("(1) - selected an attacker");
        attacking = true;
        global.currentCard = id;
        global.target = noone;
        global.choosingAttackTarget = true;
        forceHideCards();
    } else show_debug_message("Can't attack... hmm");
}
