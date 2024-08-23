/// removeCardFromHand(card id);
var card = argument0;
var hand = card.owner.hand;
var contents = hand.contents;

var index = ds_list_find_index(contents, card);
ds_list_delete(contents, index);
