/// create_card(card object, owner id);

var cardToMake = argument0;
var owner = argument1;
var card = instance_create(-100, -100, cardToMake);
card.owner = owner;

with(card) {
    event_perform(ev_draw, 0);
}

return card;
