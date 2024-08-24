///draw_card(hand id, deck id);

var hand = argument0; // refers to the list that represents the contents of the hand
var deck = argument1;
var contestant = hand.owner;
var handController = hand;

show_debug_message("ds_stack_size(deck.playStack) : " + string(ds_stack_size(deck.playStack)));

if (ds_stack_size(deck.playStack) > 0) {
    var card = ds_stack_pop(deck.playStack);
    ds_list_add(hand.contents, card);
    
    card.y = global.player.deck.y;
    card.x = global.player.deck.x;
    card.position = "drawing";

    // remove a phase blocker
    var phaseBlockerIndex = ds_list_find_index(global.NEXT_PHASE_BLOCKERS, "draw card");
    if (phaseBlockerIndex > -1) {
        ds_list_delete(global.NEXT_PHASE_BLOCKERS, phaseBlockerIndex);
    }
} else {
    show_debug_message("no cards left!");
    if (global.RULES_loseOnNoCards) {
        gameOver();
    }
}
