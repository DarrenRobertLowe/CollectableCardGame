/// removeFromBoard(card)
show_debug_message("Sending " +string(id) + "("+string(object_get_name(object_index)) + ") to graveyard");
var targetCard = argument0;

with (CARDSLOT) {
    if (card == targetCard) {
        card = noone;
    }
}
