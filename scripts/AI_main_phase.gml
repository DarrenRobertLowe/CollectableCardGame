///AI_main_phase()

// here we can run the logic per enemy type
// for now, we'll just make the most basic logic.

// play mana gathering cards
// AI_playManaCard;

// destruction spells
if !(AI_finishedDestructionSpellCasting) {
    show_debug_message("*************** cast desctruction spells ***************");
    AI_playDestructionSpells();
}

// summon monsters
if (AI_finishedDestructionSpellCasting)
and !(AI_finishedSummoning) {
    show_debug_message("*************** summon monsters ***************");
    AI_playCreatureCard();
}

// enchantments and other monster buffs
//if !(AI_finishedEnchantmentCasting) {
//    show_debug_message("*************** play enchantments and buffs ***************");
//    AI_playEnchantments();
//}

// other spells
if (AI_finishedSummoning)
and (AI_finishedDestructionSpellCasting)
and !(AI_finishedAnySpellCasting) {
    show_debug_message("*************** play remaining spells ***************");
    AI_playAnySpells();
}

if  (AI_finishedDestructionSpellCasting)
and (AI_finishedSummoning)
and ( AI_finishedAnySpellCasting) {
    show_debug_message("left main1 phase");
    nextPhase();
    exit;
}
