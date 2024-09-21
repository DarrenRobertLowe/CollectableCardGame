/// getCreatures(CONTESTANT id)
/* Returns a list of the of the creatures in play
 * on the side of the given contestant.
 */

var contestant = argument0;
var creatureList = ds_list_create();

var side = noone;

if (contestant = global.player) {
    side = PLAYER_CARDSLOT;
} else side = ENEMY_CARDSLOT;    

with (side) {
    if (card != noone) {
        if (card.type = CREATURE_CARD) {
            ds_list_add(creatureList, card);
            show_debug_message(card);
        }
    }
}

return creatureList;
