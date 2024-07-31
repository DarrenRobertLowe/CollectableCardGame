/// create_card(card object, owner id);

var cardToMake = argument0;
var owner = argument1;
var card = instance_create(0, 0, cardToMake);
card.owner = owner;

return card;
