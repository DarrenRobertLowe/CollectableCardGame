/// AI_playResourceCards();

/* Right now the AI will just play every resource card available
 * to them. This will need to be changed in the future when resource
 * playing gets limited to 1 card per turn, and will therefore need
 * to analyze what resource card is best to play given the current hand.
 */
var resourceCards = ds_list_create();

// get a list of resource cards we have in our hand
var size = ds_list_size(hand.contents);
if (size == 0) then show_debug_message("No cards in hand...");

for(var i=0; i<ds_list_size(hand.contents); i++) {
    var card = ds_list_find_value(hand.contents, i);
    
    show_debug_message("Card looking at: " +string(card));
    if (object_is_ancestor(card.object_index, RESOURCE_CARD)) {
        show_debug_message("Found resource card : " +string(object_get_name(card.object_index)));
        ds_list_add(resourceCards, card);
    }
}

show_debug_message("finished looking through hand for resource cards");
// if we have any resource cards...
size = ds_list_size(resourceCards);
if (size > 0) {
    // choose a random resource to play
    var card = ds_list_find_value(resourceCards, 0);
    playResource(card);
    //waitTime = room_speed;
} else {
    show_debug_message("No resource cards to play...");
    AI_finishedResourceCardPlaying = true;
}

// clean up
ds_list_destroy(resourceCards);
