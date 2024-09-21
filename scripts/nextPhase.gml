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
 
Then same again for the enemy equivalent.
*/

PHASE_CONTROLLER.showPhaseBanner = true;
PHASE_CONTROLLER.bannerTimer = PHASE_CONTROLLER.bannerTimerMax;

if (global.GAME_PHASE == "start") {
    global.GAME_PHASE = "draw";
    global.TURN = global.player;
    exit;
}


if !ds_list_empty(global.NEXT_PHASE_BLOCKERS) {
    var reason = ds_list_find_value(global.NEXT_PHASE_BLOCKERS, 0);
    show_debug_message("Cannot move to next phase! reason: " +string(reason));
    exit;
}


if (global.GAME_PHASE == "draw") {
    global.GAME_PHASE = "payment";
    
    if (ds_list_empty(global.PAYMENT_PHASE_LIST )) {
        global.GAME_PHASE = "main1";
    }
    exit;
}

if (global.GAME_PHASE == "payment") {
    global.GAME_PHASE = "main1";
    exit;
}

if (global.GAME_PHASE == "main1") {
    var player = global.TURN;
    var cardsOnBoard = getCreatures(global.player);
    
    if !ds_list_empty(cardsOnBoard) {
        for(var i=0; i<ds_list_size(cardsOnBoard); i++) {
            card = ds_list_find_value(cardsOnBoard, i);
            if (card.canAttack) {
                global.GAME_PHASE = "combat planning";
                exit; // end the loop and exit nextPhase() script
            }
        }
    }
    
    // no more creatures left on our side
    global.GAME_PHASE = "main2";
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
    
    phaseSetup_draw_phase();
    global.GAME_PHASE = "enemy_draw";
    exit;
}








// ENEMY
if !ds_list_empty(global.NEXT_PHASE_BLOCKERS) {
    var reason = ds_list_find_value(global.NEXT_PHASE_BLOCKERS, 0);
    show_debug_message("Cannot move to next phase! reason: " +string(reason));
    exit;
}


if (global.GAME_PHASE == "enemy_draw") {
    global.TURN = global.enemy;
    global.GAME_PHASE = "enemy_payment";
    reset_AI_decisions();
    
    if (ds_list_empty(global.ENEMY_PAYMENT_PHASE_LIST )) {
        global.GAME_PHASE = "enemy_main1";
    }
    exit;
}

if (global.GAME_PHASE == "enemy_payment") {
    global.GAME_PHASE = "enemy_main1";
    exit;
}

if (global.GAME_PHASE == "enemy_main1") {
    var player = global.TURN;
    var cardsOnBoard = getCreatures(global.enemy);
    
    if !ds_list_empty(cardsOnBoard) {
        for(var i=0; i<ds_list_size(cardsOnBoard); i++) {
            card = ds_list_find_value(cardsOnBoard, i);
            if (card.canAttack) {
                global.GAME_PHASE = "enemy_combat_planning";
                exit; // end the loop
            }
        }
    }
    
    // no more creatures left on our side
    global.GAME_PHASE = "enemy_main2";
    exit;
}

if (global.GAME_PHASE == "enemy_combat_planning") {
    global.GAME_PHASE = "enemy_combat";
    // resolve combat
    nextEvent();
    exit;
}

if (global.GAME_PHASE == "enemy_combat") {
    global.GAME_PHASE = "enemy_main2";
    reset_AI_decisions();
    exit;
}

if (global.GAME_PHASE == "enemy_main2") {
    global.GAME_PHASE = "enemy_endturn";
}

if (global.GAME_PHASE == "enemy_endturn") {
    with (CREATURE_CARD) {
        attackedThisTurn = false;
        alarm[0] = 1; // recalculate stats
    }
    
    phaseSetup_draw_phase();
    global.GAME_PHASE = "draw";
    global.TURN = global.player;
    exit;
}
