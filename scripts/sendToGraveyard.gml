/// sendToGraveyard(card instance)
var card = argument0;

ds_list_add(card.owner.graveyard, id);
var handIndex = ds_list_find_index(card.owner.hand, id);
ds_list_delete(card.owner.hand, handIndex);
