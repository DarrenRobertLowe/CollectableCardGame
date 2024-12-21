/// next_phase();

PHASE_CONTROLLER.showPhaseBanner = true;
PHASE_CONTROLLER.bannerTimer = PHASE_CONTROLLER.bannerTimerMax;

if (global.GAME_PHASE == "start") {
    global.GAME_PHASE = "draw";
    global.TURN = global.player;
    waitTime = room_speed;
    exit;
}


if !ds_list_empty(global.NEXT_PHASE_BLOCKERS) {
    var reason = ds_list_find_value(global.NEXT_PHASE_BLOCKERS, 0);
    show_debug_message("Cannot move to next phase! reason: " +string(reason));
    waitTime = room_speed;
    exit;
}


if (global.GAME_PHASE == "draw") {
    reset_AI_actions();
    
    if (ds_list_size(global.PAYMENT_PHASE_LIST) > 0) {
        global.GAME_PHASE = "payment";
    } else {
        global.GAME_PHASE = "main1";
    }
    
    waitTime = room_speed;
    exit;
}

if (global.GAME_PHASE == "payment") {
    global.GAME_PHASE = "main1";
    waitTime = room_speed;
    exit;
}


if (global.GAME_PHASE == "main1") {
    var contestant = global.TURN;
    var cardsOnBoard = getCreatures(contestant);
   
    if (anyCreaturesCanAttack(cardsOnBoard)) {
        global.GAME_PHASE = "combat";
        waitTime = room_speed;
        exit;
    } else {
        global.GAME_PHASE = "main2";
        waitTime = room_speed;
        exit;
    }
}

if (global.GAME_PHASE == "combat") {
    reset_AI_actions();
    global.GAME_PHASE = "main2";
    waitTime = room_speed;
    exit;
}

if (global.GAME_PHASE == "main2") {
    waitTime = room_speed;
    global.GAME_PHASE = "endturn";
}

if (global.GAME_PHASE == "endturn") {
    with (CREATURE_CARD) {
        attackedThisTurn = false;
        alarm[0] = 1; // recalculate stats
    }
    
    switch(global.TURN) {
        case(global.enemy):
            global.TURN = global.player;
            break;
        default:
            global.TURN = global.enemy;
            break;
    }
    
    phaseSetup_draw_phase();
    resetResources(global.TURN);
    untapResources(global.TURN);
    global.GAME_PHASE = "draw";
    exit;
}
