///combat_initiateAttackTarget()
/* For CREATURE_CARD only! */

var target = global.target;

if (object_is_ancestor(target.object_index, CREATURE_CARD)) {
    global.choosingAttackTarget = false;
    unenforceHideCards();
    event_user(1); // setup and perform the attack
}

if (object_is_ancestor(target.object_index, CONTESTANT)) {
    if (!hasDefenders(target)) {
        if (target.owner != owner) {
            global.choosingAttackTarget  = false;
            unenforceHideCards();
            event_user(1); // setup and perform the attack
        }
    }
}


