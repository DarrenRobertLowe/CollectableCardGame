/// getDamageSpellsByStrongestCastable();
/* 
 * @returns list
 */
show_debug_message("running getDamageSpellsByStrongestCastable()");
// check if we have any DAMAGE_SPELLs
var spellQueue = ds_priority_create();
var cards = hand.contents;

for(var i=0; i<ds_list_size(cards); i++) {
    card = ds_list_find_value(cards, i);
    if (object_is_ancestor(card.object_index, DAMAGE_SPELL)) {
        show_debug_message("found a type of damage spell card in hand, but could be a heal...");
        
        if (card.attack > 0) {
            show_debug_message("It was a damage card!");
            
            if (card.castingCost <= mana) {
                show_debug_message("The card is within our casting budget!");
                ds_priority_add(spellQueue, card, card.attack);
            }
        }
    }
}

// convert the spell queue to a list
var spellList = ds_list_create();
while(ds_priority_size(spellQueue) > 0) {
    var card = ds_priority_delete_max(spellQueue)
    ds_list_add(spellList, card);
    show_debug_message(card);
}

show_debug_message("finished getDamageSpellsByStrongestCastable()");
return spellList;
