///combat_trySelectAsAttacker();

if (global.TURN == owner) {
    if (creatureCanAttack(id)) {
        attacking = true;
        global.currentCard = id;
        global.target = noone;
        global.choosingAttackTarget = true;
    } else show_debug_message("Can't attack... hmm");
}
