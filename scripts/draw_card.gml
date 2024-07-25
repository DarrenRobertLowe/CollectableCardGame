///draw_card(hand id, deck id);

var hand = argument0;
var deck = argument1;

ds_list_add(hand, ds_stack_pop(deck.deck));
