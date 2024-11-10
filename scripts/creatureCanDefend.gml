///creatureCanDefend(creature id);

var card = argument0;

if (exists(card)) {
    if (card.attackedThisTurn == true) return false;
    if (card.tapped == true) return false;
    if (card.canDefend == false) return false;
    return true;
}
