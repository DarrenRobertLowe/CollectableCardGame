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
    reset_AI_decisions();
    global.GAME_PHASE = "payment";
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
    
    if !ds_list_empty(cardsOnBoard) {
        for(var i=0; i<ds_list_size(cardsOnBoard); i++) {
            card = ds_list_find_value(cardsOnBoard, i);
            if (card.canAttack) {
                global.GAME_PHASE = "combat";
                waitTime = room_speed;
                exit;
            }
        }
    } else {
        // no creatures so skip combat phase
        global.GAME_PHASE = "main2";
        waitTime = room_speed;
        exit;
    }
}

if (global.GAME_PHASE == "combat") {
    reset_AI_decisions();
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
    global.GAME_PHASE = "draw";
    exit;
}
