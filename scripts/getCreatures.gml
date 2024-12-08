/// getCreatures(CONTESTANT id)
/* Returns a list of the of the creatures in play
 * on the side of the given contestant.
 */

var contestant = argument0;
var creatureList = ds_list_create();

with (CARDSLOT) {
    if (owner == global.TURN) {
        if (card != noone) {
            if (card.type = CREATURE_CARD) {
                ds_list_add(creatureList, card);
            }
        }
    }
}

return creatureList;
