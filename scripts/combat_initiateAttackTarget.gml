///combat_initiateAttackTarget()
/* For CREATURE_CARD only! */

var target = global.target;

show_debug_message(string(id) + " says currentCard == "+ string(global.currentCard));

if (global.currentCard == id) {
    show_debug_message("4");
    if (target != noone) {
        show_debug_message("5");
        if (object_is_ancestor(target.object_index, CONTESTANT)) {
            show_debug_message("6");
            if !(hasDefenders(target)) {
                if (target.owner != owner) {
                    global.choosingAttackTarget = false;
                    event_user(1); // setup and perform the attack
                }
            }
        }
        
        if (object_is_ancestor(target.object_index, CREATURE_CARD)) {
            show_debug_message("7");
            if (target.position == "board") {
                if (target.owner != owner) {
                    global.choosingAttackTarget = false;
                    event_user(1); // setup and perform the attack
                }
            }
        }
    }
}
