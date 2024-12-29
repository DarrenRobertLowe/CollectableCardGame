///combat_allowSelectAsTarget();
/* For CREATURE_CARD only! */

if (global.TURN != owner) { // take opponent's perspective
    show_debug_message("1");
    if (global.currentCard != id) { // can't attack ourselves
        show_debug_message("2");
        if (global.currentCard.owner != owner) { // can't attack friendly creatures
            show_debug_message("3");
            glowing = true;
            global.target = id;
        }
    }
}
