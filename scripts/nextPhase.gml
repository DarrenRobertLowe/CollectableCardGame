/// next_phase();
/*
PHASES
"draw"
 - draw a card
"payment"
 - used for paying mana towards a monster's existance or enchantments, etc.
"main1"
 - summon, cast spells, use enchantments or effects
"combat planning"
 - assign combat targets
"combat"
 - combat resolves
"main2"
 - summon, cast spells, use enchantments or effects
"endturn"
 - some cards might have end of turn effects
*/

PHASE_CONTROLLER.showPhaseBanner = true;
PHASE_CONTROLLER.bannerTimer = PHASE_CONTROLLER.bannerTimerMax;

if (global.GAME_PHASE == "start") {
    global.GAME_PHASE = "draw";
    exit;
}

if (global.GAME_PHASE == "draw") {
    global.GAME_PHASE = "payment";
    exit;
}

if (global.GAME_PHASE == "payment") {
    global.GAME_PHASE = "main1";
    exit;
}

if (global.GAME_PHASE == "main1") {
    global.GAME_PHASE = "combat planning";
    exit;
}

if (global.GAME_PHASE == "combat planning") {
    global.GAME_PHASE = "combat";
    // resolve combat
    nextEvent();
    exit;
}

if (global.GAME_PHASE == "combat") {
    global.GAME_PHASE = "main2";
    exit;
}

if (global.GAME_PHASE == "main2") {
    global.GAME_PHASE = "endturn";
}

if (global.GAME_PHASE == "endturn") {
    with (CREATURE_CARD) {
        attackedThisTurn = false;
        alarm[0] = 1; // recalculate stats
    }
    global.GAME_PHASE = "draw";
    exit;
}
