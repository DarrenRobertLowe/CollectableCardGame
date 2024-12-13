///creatureCanAttack(creature card id)
/* returns boolean
 * Determines if this creature is able to attack.
 */
 
var card = argument0;

if (exists(card)) {
    if (card.attackedThisTurn == true)  return false;
    if (card.tapped == true)            return false;
    if (card.canAttack == false)        return false;
    
    // return true if all other checks pass
    return true;
}
