/// removeFromDeck(deck, card)

var targetDeck = argument0;
var targetCard = argument1;

var ind = ds_list_find_index(targetDeck, card);

if (ind > -1) {
    ds_list_delete(targetDeck, card);
}
