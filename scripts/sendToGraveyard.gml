/// sendToGraveyard(card instance)
var card = argument0;

// avoid duplicates
var ind = ds_list_find_index(card.owner.graveyard, card);
if (ind > -1) {
    ds_list_delete(card.owner.graveyard, ind);
}

// add to the graveyard
ds_list_add(card.owner.graveyard, card);
removeCardFromHand(card);

card.position = "graveyard";
