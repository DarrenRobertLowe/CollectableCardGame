/// getHealingSpellsByStrongestCastable()
/* note: healing spells inherit from N_DAMAGE_SPELLS,
 * which inherit from DAMAGE_SPELLs.
 * 
 * @returns list
 */
 
// check if we have any healing spells
var spellQueue = ds_priority_create();
var cards = hand.contents;
for(var i=0; i<ds_list_size(cards); i++) {
    card = ds_list_find_value(cards, i);
    
    // spells
    if (card.type == DAMAGE_SPELL
    and card.attack < 0) {
        if (card.castingCost <= mana) {
            ds_priority_add(spellQueue, card, card.attack);
        }
    }
}

// convert the spell queue to a list
var spellList = ds_list_create();
while(ds_priority_size(spellQueue) > 0) {
    ds_list_add(spellList, ds_priority_delete_max(spellQueue));
}

return spellList;
