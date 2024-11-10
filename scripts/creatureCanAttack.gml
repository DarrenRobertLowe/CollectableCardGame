///creatureCanAttack(creature card id)
var card = argument0;

if (exists(card)) {
    if (card.attackedThisTurn == true) return false;
    if (card.tapped == true) return false;
    if (card.canAttack == false) return false;
    if (card.hasSummoningSickness == true) return false;
    return true;
}
