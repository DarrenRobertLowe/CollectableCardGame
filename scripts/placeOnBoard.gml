///placeOnBoard(PLAYER_CARDSLOT or ENEMY_CARDSLOT, card id);
var cardslots = argument0;
var cardToPlace = argument1;
var board = BOARD_CONTROLLER;

ds_stack_clear(board.freeSlots);

with (cardslots) {
    if (card == noone) {
        show_debug_message("card == noone, pushing to stack!");
        ds_stack_push(board.freeSlots, id);
    } else {
        show_debug_message("card = " +string(card));
    }
}

if (ds_stack_size(board.freeSlots) > 0) {
    var slot = ds_stack_pop(board.freeSlots);
    slot.card = cardToPlace;
    
    cardToPlace.position = "board";
    
    removeCardFromHand(cardToPlace);
    return slot;
} else {
    show_debug_message("No free slots for placing card!");
    return 0;
}
