///placeOnBoard(contestant, card id, BACK_LANE or FRONT_LANE);
var targetOwner = argument0;
var cardToPlace = argument1;
var lane        = argument2;
var board       = BOARD_CONTROLLER;
var slots       = board.freeSlots;

ds_list_clear(slots);

// find all the free slots and add them to the slots list
with (lane) {
    if (owner == targetOwner) {
        if (card == noone) {
            ds_list_add(slots, id); // the local var "slots" is accessible because of the "with" statment. Neat!
        }
    }
}

// add this card to the first available slot
if (ds_list_size(slots) > 0) {
    var slot = ds_list_find_value(slots, ds_list_size(slots)-1);
    slot.card = cardToPlace;
    cardToPlace.position = "board";
    cardToPlace.slot = slot;
    removeFromHand(cardToPlace);
    return slot;
} else {
    show_debug_message("No free slots for placing card!");
    return 0;
}
