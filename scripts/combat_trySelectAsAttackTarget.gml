///combat_trySelectAsAttackTarget();
if (global.TURN != owner) {
    if (owner != global.currentCard.owner) { // can't attack our own
        // add validation for flying, etc.
        
        if (object_index == DECK) {
            global.target = owner;
        } else {
            if (slot != noone) {
                if (slot.object_index == BACK_SLOT) {
                    if (slot.alternativeSlot.card == noone) { // check if front slot is occupied
                        global.target = id;
                    } else show_debug_message("This card cannot be targetted by an attack while defended by card in front slot");
                } else { // front slot is always attackable
                    global.target = id;
                }
            }
        }
    }
}
