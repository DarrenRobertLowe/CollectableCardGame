/// build_deck(list of cards);
// Adds cards in a deck for a duel.

var cards = argument0;

var cardCount = ds_list_size(cards);

for(var i=0; i<cardCount; i++) {
    var card = ds_list_find_value(cards, i);
    ds_stack_push(playStack, card);
}

return playStack;
