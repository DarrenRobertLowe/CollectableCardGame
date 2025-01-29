///creatureCanAttack(creature card id)
/* returns boolean
 * Determines if this creature is able to attack.
 */
 
var card = argument0;

if (exists(card)) {
    if (card.attacking == true)         return false;
    if (card.attackedThisTurn == true)  return false;
    if (card.activated == true)         return false;
    if (card.canAttack == false)        return false;
    if (card.slot.type == "BACK_SLOT") {
        if (ds_list_find_index(card.abilities, "Ranged") == -1) {
            show_debug_message("in the back slot, returning false");
            return false;
        }
    }
    
    // return true if all other checks pass
    show_debug_message("creatureCanAttack: " + string(card) + " can attack");
    return true;
}
