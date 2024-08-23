/// sendToGraveyard(card instance)
var card = argument0;
var grave = card.owner.graveyard.contents;

// avoid duplicates
var ind = ds_list_find_index(grave, card);
if (ind > -1) {
    ds_list_delete(grave, ind);
}

// add to the graveyard
ds_list_add(grave, card);
removeCardFromHand(card);

card.position = "graveyard";
