/// removeCardFromHand(card id);
var card = argument0;
show_debug_message("removing card from hand: " + string(card));
var hand = card.owner.hand;
var contents = hand.contents;

show_debug_message("hand id: " +string(hand));
var index = ds_list_find_index(contents, card);

if (index > -1) {
    ds_list_delete(contents, index);
}
