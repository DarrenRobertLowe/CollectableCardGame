/// AI_playDestructionSpells()
/* Cast spells that can destroy enemy creatures
 * or enemy enchantments, etc.
 */

spell  = noone;
target = noone;

if (AI_finishedDestructionSpellCasting == false) {
    var spellList = getDamageSpellsByStrongestCastable(id);   // get all the castable damage spells in order of power
    
    // If there are no damage spells to use, just exit this whole script.
    if (ds_list_size(spellList) == 0) {
       debug("no damage spells to cast.");
       AI_finishedDestructionSpellCasting = true;
       exit;
    }
    
    /* Note: one thing we could do with the logic is add together the potential damage 
     * of multiple cards and if they add up to being >= target hp then we cast them one
     * after the other.
     */
    
    // direct attack the opponent?
    target = AI_tryDefeatOpponentWithSpells(spellList);
    if (target != noone) {
        AI_finishedDestructionSpellCasting = true;
        show_debug_message("DECIDED TO ZAP PLAYER!");
    }
    
    if (target == noone) {
        var opponentCreatures = getCreatures(global.player);    // get a list of enemy monsters
        var targetList = prioritiseCardsByAttack(opponentCreatures);
        
        // If we have monsters to target. try to find a spell that kills the most powerful one
        if (ds_list_size(targetList) > 0) {
            // go through each spell from weakest to strongest
            for (var s=ds_list_size(spellList)-1; s>=0; s--) {
                spell = ds_list_find_value(spellList, s);
                
                // go through each creature from strongest (or most threatening) to weakest
                debug("iterating through destruction spells..." + string(s));
                for (var m=0; m<ds_list_size(targetList); m++) {
                    debug("iterating through enemy monsters..." + string(m));
                    tempTarget = ds_list_find_value(targetList, m);
                    
                    if (tempTarget.hp <= spell.attack) {
                        if canAffordCasting(spell) {
                            target = tempTarget;
                            break;
                        }
                    }
                }
            }
            
            // if even our strongest spell can't defeat the weakest monster...
            if (target == noone) {
                // If monster hp is permanent, cast on the most threatening monster...
                if (global.RULES_HP_regeneration == false) {
                    target = ds_list_find_value(targetList, 0);
                }
                // if not permanent damage some logic is needed to determine if enough
                // spells can be cost to destroy the target creature. So we'd need a way
                // to calculate the max damage output, which we'll want anyway.
            }
        }
        
        
        // clean up
        if (ds_exists(opponentCreatures, ds_type_list)) {
            ds_list_destroy(opponentCreatures);
        }
    }
    
    
    // cast spell on target
    if (target != noone) {
        show_debug_message("CASTING " + string(spell.name) + " on " + string(target) );
        var ind = ds_list_find_index(spellList, spell);
        ds_list_delete(spellList, ind);
        
        with(spell) {
            target = other.target;
            other.waitTime = room_speed;
        }
        
        castSpell(spell);
        
        exit;
    } else {
        // if we reach here, we've exhausted all possibilities
        AI_finishedDestructionSpellCasting = true;
    }
}
