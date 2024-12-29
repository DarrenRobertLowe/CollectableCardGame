///allowCancelCombatTarget();
/* For CREATURE_CARD only! */

if (global.choosingAttackTarget) {
    if (global.currentCard == id) {
        if (global.controls_cancel) {
            attacking = false;
            global.currentCard = id;
            global.target = noone;
            global.choosingAttackTarget = false;
        }
    }
}
