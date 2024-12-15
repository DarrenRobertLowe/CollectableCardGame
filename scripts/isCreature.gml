///isCreature(card);

var card = argument0;

if (exists(card)) {
    if (object_is_ancestor(card.object_index, CREATURE_CARD)) {
        //show_debug_message(string(card) + ": is a creature card");
        return true;
    }
}

//show_debug_message(string(card) + ": is NOT a creature card!");
