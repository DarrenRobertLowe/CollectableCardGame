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
if !(AI_finishedResourceCardPlaying) {
    if !(AI_paused()) {
        show_debug_message("*************** play resource cards ***************");
        AI_playResourceCards();
    }
}

// destruction spells
if  (AI_finishedResourceCardPlaying)
and !(AI_finishedDestructionSpellCasting) {
    if !(AI_paused()) {
        show_debug_message("*************** cast desctruction spells ***************");
        AI_playDestructionSpells();
    }
}

// summon monsters
if  (AI_finishedDestructionSpellCasting)
and !(AI_finishedSummoning) {
    if !(AI_paused()) {
        show_debug_message("*************** summon monsters ***************");
        AI_playCreatureCard();
    }
}

// Enchant creatures
if  (AI_finishedSummoning)
and !(AI_finishedEnchanting) {
    if !(AI_paused()) {
        show_debug_message("*************** enchant creatures ***************");
        AI_playEnchantments();
    }
}

// move to combat phase
if  (AI_finishedDestructionSpellCasting)
and (AI_finishedSummoning)
and (AI_finishedEnchanting)
and (global.GAME_PHASE == "main") {
    nextPhase();
}


// other spells
if  (AI_finishedSummoning)
and (AI_finishedDestructionSpellCasting)
and (AI_finishedEnchanting)
and !(AI_finishedAnySpellCasting)
and (global.GAME_PHASE == "aftermath") {
    listedCreatures = false; // clean up after combat
    if !(AI_paused()) {
        show_debug_message("*************** play remaining spells ***************");
        AI_playAnySpells();
    }
}

if  (AI_finishedDestructionSpellCasting)
and (AI_finishedSummoning)
and (AI_finishedEnchanting)
and (AI_finishedSummoning)
and (AI_finishedAnySpellCasting)
and (global.GAME_PHASE == "aftermath") {
    if !(AI_paused()) {
        show_debug_message("*************** finished turn ***************");
        nextPhase();
        exit;
    }
}
