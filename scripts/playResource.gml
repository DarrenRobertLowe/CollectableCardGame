/// playResource(card id)
var card = argument0;


if (global.TURN == global.player) {
    slot = PLAYER_RESOURCESLOT;
} else {
    slot = ENEMY_RESOURCESLOT;
}

removeCardFromHand(card);
card.position = "board";

with (slot) {
    ds_list_add(cards, other);
}
//show_EventPopup(spell, noone, "Summoning");
