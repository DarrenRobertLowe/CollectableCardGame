///draw_card(hand id, deck id);

var hand = argument0;
var deck = argument1;

show_debug_message("ds_stack_size(deck.playStack) : " + string(ds_stack_size(deck.playStack)));

if (ds_stack_size(deck.playStack) > 0) {
    var card = ds_stack_pop(deck.playStack);
    ds_list_add(hand, card);
    card.position = "hand";
    show_debug_message("card :" +string(card) + " added to hand.");
} else {
    show_debug_message("no cards left!");
    if (global.RULES_loseOnNoCards) {
        gameOver();
    }
}
