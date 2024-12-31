///combat_allowSelectAsAttackTarget();
if (global.TURN != owner) {
    if (owner != global.currentCard.owner) { // can't attack our own
        // add validation for flying, etc.
        
        if (object_index == DECK)
            then global.target = owner;
            else global.target = id;
    }
}
