/// AI_playDestructionSpells()
/* Cast spells that can destroy enemy creatures
 * or enemy enchantments, etc.
 */

// determine what to cast or summon
var haveSpellToCast = false;
var spell = noone;

if (AI_finishedDestructionSpellCasting == false) {
    var spellList = getDamageSpellsByStrongestCastable();   // get all the castable damage spells in order of power
    var opponentCreatures = getCreatures(global.player);    // get a list of enemy monsters
    var targetList = prioritiseCardsByAttack(opponentCreatures);
    
    /* Note: one thing we could do with the logic is add together the potential damage 
     * of multiple cards and if they add up to being >= target hp then we cast them one
     * after the other.
     */
    
    // If there are no monsters to target, just exit this whole script.
    // We can target the player directly after summoning monsters, etc.
    if (ds_list_size(targetList) == 0) {
        debug("no enemy creatures on which to cast spells");
        AI_finishedDestructionSpellCasting = true;
    }
     
    // go through each spell from weakest to strongest
    for (var s=ds_list_size(spellList)-1; s>=0; s--) {
        spell = ds_list_find_value(spellList, s);
        
        debug("iterating through destruction spells..." + string(s));
        
        // go through each creature from strongest (or most threatening) to weakest
        for (var m=0; m<ds_list_size(targetList); m++) {
            debug("iterating through enemy monsters..." + string(m));
            target = ds_list_find_value(targetList, m);
            
            if (target.hp <= spell.attack) {
                if (spell.castingCost <= mana) {
                    haveSpellToCast = true;
                    break;
                }
            }
        }
    }
    
    // cast spell on target
    if (haveSpellToCast) {
        var ind = ds_list_find_index(spellList, spell);
        ds_list_delete(spellList, ind);
        
        with(spell) {
            target = other.target;
            other.waitTime = room_speed;
            event_user(0);  // cast spell
        }
    }
    
    
    if (ds_list_size(spellList) == 0) {
        AI_finishedDestructionSpellCasting = true;
    }
    
    debug("finished casting destruction spells");
}
