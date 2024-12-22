///AI_main_phase()

// here we can run the logic per enemy type
// for now, we'll just make the most basic logic.

// play mana gathering cards
// AI_playManaCard;

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

// enchantments and other monster buffs
if  (AI_finishedDestructionSpellCasting)
and (AI_finishedSummoning) 
and !(AI_finishedEnchantmentCasting) {
    if !(AI_paused()) {
//      show_debug_message("*************** play enchantments and buffs ***************");
//      AI_playEnchantments();
        AI_finishedEnchantmentCasting = true; // remove when we actually have enchantment AI being worked on
    }
}

// move to combat phase
if  (AI_finishedDestructionSpellCasting)
and (AI_finishedSummoning)
and (AI_finishedEnchantmentCasting)
and (global.GAME_PHASE == "main") {
    nextPhase();
}


// other spells
if  (AI_finishedSummoning)
and (AI_finishedDestructionSpellCasting)
and (AI_finishedEnchantmentCasting)
and !(AI_finishedAnySpellCasting)
and (global.GAME_PHASE == "aftermath") {
    if !(AI_paused()) {
        show_debug_message("*************** play remaining spells ***************");
        AI_playAnySpells();
    }
}

if  (AI_finishedDestructionSpellCasting)
and (AI_finishedSummoning)
and (AI_finishedEnchantmentCasting)
and (AI_finishedSummoning)
and (AI_finishedAnySpellCasting)
and (global.GAME_PHASE == "aftermath") {
    if !(AI_paused()) {
        show_debug_message("*************** finished turn ***************");
        nextPhase();
        exit;
    }
}
