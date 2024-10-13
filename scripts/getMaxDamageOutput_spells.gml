///getMaxDamageOutput_spells(contestant)
/* Note: this is a simplified process that assumes
 * N Damage cards only, not X damage, and doesn't
 * take into consideration any boosting effects or 
 * target weakness there might be.
 */
 
var contestant = argument0;
var spellList = getDamageSpellsByStrongestCastable(id);   // get all the castable damage spells in order of power
var tempMana = contestant.mana;
var outputDamage = 0;


for (var i=0; i<ds_list_size(spellList); i++) {
    var spell = ds_list_find_value(spellList, i);
    
    if (tempMana >= spell.castingCost) {
        tempMana -= spell.castingCost;
        outputDamage += spell.attack;
    }
}

return outputDamage;
