///isCreature(card);

var card = argument0;

if (exists(card)) {
    if (object_is_ancestor(card.object_index, CREATURE_CARD)) {
        return true;
    }
}
