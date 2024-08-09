/// next_phase();
/*
PHASES
"draw"
 - draw a card
"payment"
 - used for paying mana towards a monster's existance or enchantments, etc.
"main1"
 - summon, cast spells, use enchantments or effects
"combat"
 - assign targets
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
    global.GAME_PHASE = "combat";
    exit;
}

if (global.GAME_PHASE == "combat") {
    // resolve combat
    while(ds_stack_size(global.EVENT_STACK) > 0) {
        var event = ds_stack_pop(global.EVENT_STACK);
        
        event_perform_object(event, ev_other, ev_user0);
            
    }
    
    global.GAME_PHASE = "main2";
    exit;
}

if (global.GAME_PHASE == "main2") {
    global.GAME_PHASE = "endturn";
    exit;
}

if (global.GAME_PHASE == "endturn") {
    global.GAME_PHASE = "draw";
    exit;
}
