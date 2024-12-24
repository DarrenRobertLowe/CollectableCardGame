///creatureCanAttack(creature card id)
/* returns boolean
 * Determines if this creature is able to attack.
 */
 
var card = argument0;

if (exists(card)) {
    if (card.attacking == true)         return false;
    if (card.attackedThisTurn == true)  return false;
    if (card.tapped == true)            return false;
    if (card.canAttack == false)        return false;
    if (card.slot.object_index == BACK_SLOT) {
        if !(ds_list_find_index(card.abilities, "Ranged")) {
            return false;
        }
    }
    
    // return true if all other checks pass
    return true;
}
