/// next_phase();
var drawPhaseText       = "DRAW PHASE - CLICK ON YOUR DECK TO DRAW A CARD";
var paymentPhaseText    = "PAYMENT PHASE"
var mainPhaseText       = "MAIN PHASE - SUMMON CREATURES, PLAY ENHANCEMENTS AND CAST SPELLS";
var combatPhaseText     = "COMBAT PHASE - CHOOSE YOUR ATTACKERS!";
var aftermathPhaseText  = "AFTERMATH PHASE - SUMMON CREATURES, PLAY ENHANCEMENTS AND CAST SPELLS";
var endTurnPhaseText    = "END TURN";


PHASE_CONTROLLER.showPhaseBanner = true;
PHASE_CONTROLLER.bannerTimer     = PHASE_CONTROLLER.bannerTimerMax;

if (global.GAME_PHASE == "start") {
    global.GAME_PHASE = "draw";
    setMarqueeText(drawPhaseText);
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
        setMarqueeText(paymentPhaseText);
    } else {
        global.GAME_PHASE = "main";
        startMainPhase();
        setMarqueeText(mainPhaseText);
    }
    
    waitTime = room_speed;
    exit;
}

if (global.GAME_PHASE == "payment") {
    global.GAME_PHASE = "main";
    startMainPhase();
    setMarqueeText(mainPhaseText);
    waitTime = room_speed;
    exit;
}


if (global.GAME_PHASE == "main") {
    var contestant   = global.TURN;
    var cardsOnBoard = getCreatures(contestant);
    
    if (anyCreaturesCanAttack(cardsOnBoard)) {
        global.GAME_PHASE = "combat";
        setMarqueeText(combatPhaseText);
        waitTime = room_speed;
        
        // clean up
        if (ds_exists(cardsOnBoard, ds_type_list)) { ds_list_destroy(cardsOnBoard);}
        exit;
    } else {
        global.GAME_PHASE = "aftermath";
        setMarqueeText(aftermathPhaseText);
        waitTime = room_speed;
        
        // clean up
        if (ds_exists(cardsOnBoard, ds_type_list)) { ds_list_destroy(cardsOnBoard);}
        exit;
    }
}

if (global.GAME_PHASE == "combat") {
    reset_AI_actions();
    global.GAME_PHASE = "aftermath";
    setMarqueeText(aftermathPhaseText);
    waitTime = room_speed;
    exit;
}

if (global.GAME_PHASE == "aftermath") {
    waitTime = room_speed;
    global.GAME_PHASE = "endturn";
    setMarqueeText(endTurnPhaseText);
}

if (global.GAME_PHASE == "endturn") {
    with (CREATURE_CARD) {
        alarm[0] = 1; // recalculate stats
        
        if (global.TURN == owner) {
            attackedThisTurn = false;
            activated = false;
        }
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
    setMarqueeText(drawPhaseText);
    exit;
}
