/// removeCardFromHand(card id);
var card = argument0;

var handIndex = ds_list_find_index(card.owner.hand, card);
ds_list_delete(card.owner.hand, handIndex);
