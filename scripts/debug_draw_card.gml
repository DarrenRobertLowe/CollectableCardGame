///debug_draw_card(hand, card);
var hand = argument0;
var card = argument1;
var contestant = hand.owner;

ds_list_add(hand.contents, card);
card.x = contestant.deck.x;
card.y = contestant.deck.y;
card.position = "drawing";
