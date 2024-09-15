///AI_playAnySpells();
show_debug_message("running AI_playAnySpells()");
var spellList = getDamageSpellsByStrongestCastable();

// target opponent directly with damage spells
for(var s=0; s<ds_list_size(spellList); s++) {
    var spell = ds_list_find_value(spellList, s);
    
    with(spell) {
        target = global.player;
        if ( basicActivationChecks() ) {
            event_user(0);  // cast spell
            waitTime = room_speed;
        }
    }
}


// TO DO: target friendly creatures with healing spells
// TO DO: target friendly creatures with enchantments


// target self with healing spells
var spellList = getHealingSpellsByStrongestCastable();
for(var s=0; s<ds_list_size(spellList); s++) {
    var spell = ds_list_find_value(spellList, s);
    
    with(spell) {
        target = id;
        if ( basicActivationChecks() ) {
            event_user(0);  // cast spell
            waitTime = room_speed;
        }
    }
}

AI_finishedAnySpellCasting = true;
show_debug_message("finished AI_playAnySpells()");
