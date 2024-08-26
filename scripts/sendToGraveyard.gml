/// sendToGraveyard(graveyard, card instance)
var graveyard = argument0;
var card      = argument1;


// remove from cardsInPlay list
ind = ds_list_find_index(card.owner.cardsInPlay, id);
if ((ind) > -1) {
    ds_list_delete(card.owner.cardsInPlay, ind);
}


// add to the graveyard
ds_list_add(graveyard.contents, card);

switch(card.position) {
    case "hand":
        removeCardFromHand(card);
    break;
    
    case "board":
        removeCardFromBoard(card);
    break;
    
    case "deck":
        removeCardFromDeck(card.owner.deck, card);
    break;
}

card.position = "graveyard";
