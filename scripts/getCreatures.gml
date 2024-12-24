/// getCreatures(CONTESTANT id)
/* Returns a list of the of the creatures in play
 * on the side of the given contestant.
 */

var contestant = argument0;
var creatureList = ds_list_create();

with (CARDSLOT) {
    show_debug_message("checking slot " +string(id) + " for creature");
    if (owner == contestant) {
        if (card != noone) {
            if (card.type = CREATURE_CARD) {
                show_debug_message("Found a creature");
                ds_list_add(creatureList, card);
            }
        }
    }
}

return creatureList;
