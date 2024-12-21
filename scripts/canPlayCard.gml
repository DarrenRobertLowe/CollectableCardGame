///check_canPlayCard();
canUse = true;

if (global.GAME_PHASE == "draw") {
    canUse = false;
}

if (position == "hand") {
    if  (global.GAME_PHASE != "main1")
    and (global.GAME_PHASE != "main2") {
        canUse = false;
    }
}

if (global.TURN != owner) {
    canUse = false;
}

if (object_is_ancestor(object_index, CREATURE_CARD)) {
    if (attackedThisTurn == true) {
        canUse = false;
    }
}

return canUse;
