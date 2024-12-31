///combat_initiateAttackTarget()
/* For CREATURE_CARD only! */

var target = global.target;

show_debug_message(string(id) + " says currentCard == "+ string(global.currentCard));
show_debug_message(string(id) + " says target == "+ string(global.target));


if (object_is_ancestor(target.object_index, CREATURE_CARD)) {
    show_debug_message("(3) - creature was selected");
    global.choosingAttackTarget = false;

    show_debug_message("(5) - initiating attack");
    event_user(1); // setup and perform the attack
}

if (object_is_ancestor(target.object_index, CONTESTANT)) {
    show_debug_message("(4) - CONTESTANT was selected");
    if (!hasDefenders(target)) {
        if (target.owner != owner) {
            global.choosingAttackTarget = false;
            show_debug_message("(5) - initiating attack");
            event_user(1); // setup and perform the attack
        }
    }
}


