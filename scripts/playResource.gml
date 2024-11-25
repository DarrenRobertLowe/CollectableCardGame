/// playResource(card id)
var card = argument0;
show_debug_message("Attempting to play resource card: " +string(card) + ": "+string(object_get_name(card.object_index)));

if (global.TURN == global.player) {
    slot = PLAYER_RESOURCESLOT;
} else {
    slot = ENEMY_RESOURCESLOT;
}

removeCardFromHand(card);
card.position = "board";

with (slot) {
    ds_list_add(cards, card);
}
