///combat_allowSelectAsAttackTarget();
/* For CREATURE_CARD only! */

if (global.TURN != owner) {
    // add validation for flying, etc.
    
    if (object_index == DECK)
        then global.target = owner;
        else global.target = id;
        
    show_debug_message("(2) - selected a target");
}
