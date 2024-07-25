/// build_deck(list of cards);
// Adds and instantiates cards in a deck for a duel.

var cards = argument0;

var cardCount = ds_list_size(cards);

for(var i=0; i<cardCount; i++) {
    var cardID = ds_list_find_value(cards, i);
    var card = instance_create(0, 0, cardID);
    ds_stack_push(deck, card);
}

return deck;
