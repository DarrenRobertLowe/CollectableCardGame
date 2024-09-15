/// getCreatures(CONTESTANT id, targetList)
show_debug_message("running getCreatures");

var contestant = argument0;
var targetList = ds_list_create();

var side = noone;

if (contestant = global.player) {
    side = PLAYER_CARDSLOT;
} else side = ENEMY_CARDSLOT;    

with (side) {
    if (card != noone) {
        if (card.type = CREATURE_CARD) {
            ds_list_add(targetList, card);
            show_debug_message(card);
        }
    }
}

show_debug_message("finished getCreatures()");
return targetList;
