/// AI_playDestructionSpells()
/* Cast spells that can destroy enemy creatures
 * or enemy enchantments, etc.
 */
    
// determine what to cast or summon
if (AI_finishedDestructionSpellCasting == false) {
    var spellList = getDamageSpellsByStrongestCastable();   // get all the castable damage spells in order of power
    var opponentCreatures = getCreatures(global.player);    // get a list of enemy monsters
    var targetList = prioritiseCardsByAttack(opponentCreatures);
    
    /* Note: one thing we could do with the logic is add together the potential damage 
     * of multiple cards and if they add up to being >= target hp then we cast them one
     * after the other.
     */
    
    // go through each spell from weakest to strongest
    for (var s=ds_list_size(spellList)-1; s>=0; s--) {
        var spell = ds_list_find_value(spellList, s);
        show_debug_message("iterating through destruction spells..." + string(s));
        
        // go through each creature from strongest (or most threatening) to weakest
        for (var m=0; m<ds_list_size(targetList); m++) {
            show_debug_message("iterating through enemy monsters..." + string(m));
            target = ds_list_find_value(targetList, m);
            
            if (target.hp <= spell.attack) {
                // cast this spell on this target
                //if (spell.castingCost <= mana) {
                with(spell) {
                    target = other.target;
                    if ( basicActivationChecks() ) {
                        other.waitTime = room_speed;
                        event_user(0);  // cast spell                    
                        //exit;
                    }
                }
                //}
            }
        }
    }
    
    show_debug_message("finished casting destruction spells");
    AI_finishedDestructionSpellCasting = true;
}
