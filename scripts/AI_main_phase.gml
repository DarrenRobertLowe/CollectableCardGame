///AI_main_phase()

// here we can run the logic per enemy type
// for now, we'll just make the most basic logic.

// March creatures forward
if !(AI_finishedMarchingCreatures) {
    if !(AI_paused()) {
        show_debug_message("*************** march creatures forward ***************");
        AI_marchCreatures();
    }
}

// Play mana card
if (AI_finishedMarchingCreatures)
and !(AI_finishedResourceCardPlaying) {
    if !(AI_paused()) {
        show_debug_message("*************** play resource cards ***************");
        AI_playResourceCards();
    }
}

// destruction spells
if  (AI_finishedMarchingCreatures)
and (AI_finishedResourceCardPlaying)
and !(AI_finishedDestructionSpellCasting) {
    if !(AI_paused()) {
        show_debug_message("*************** cast desctruction spells ***************");
        AI_playDestructionSpells();
    }
}

// summon monsters
if  (AI_finishedMarchingCreatures)
and (AI_finishedResourceCardPlaying)
and (AI_finishedDestructionSpellCasting)
and !(AI_finishedSummoning) {
    if !(AI_paused()) {
        show_debug_message("*************** summon monsters ***************");
        AI_playCreatureCard();
    }
}

// Enchant creatures
if  (AI_finishedMarchingCreatures)
and (AI_finishedResourceCardPlaying)
and (AI_finishedDestructionSpellCasting)
and (AI_finishedSummoning)
and !(AI_finishedEnchanting) {
    if !(AI_paused()) { 
        AI_playEnchantments();
    }
}

// move to combat phase
if (global.GAME_PHASE == "main") 
and (AI_finishedMarchingCreatures)
and (AI_finishedResourceCardPlaying)
and (AI_finishedDestructionSpellCasting)
and (AI_finishedSummoning)
and (AI_finishedEnchanting) {
    show_debug_message("AI_main_phase says: I AM MAIN PHASOR");
    if !(AI_paused()) {
        show_debug_message("_____I am calling nextPhase() now_____");
        nextPhase();
    }
}


// end turn
if (global.GAME_PHASE == "aftermath")
and (AI_finishedMarchingCreatures)
and (AI_finishedResourceCardPlaying)
and (AI_finishedDestructionSpellCasting)
and (AI_finishedSummoning)
and (AI_finishedEnchanting) {
    if !(AI_paused()) {
        ds_list_clear(ourCreatures);
        ds_list_clear(theirCreatures);
        show_debug_message("*************** finished turn ***************");
        nextPhase();
        exit;
    }
}
