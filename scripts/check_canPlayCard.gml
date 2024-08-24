///check_canPlayCard();
var canPlay = true;

if (global.GAME_PHASE == "draw") {
    canPlay = false;
}

if  (position == "hand") {
    if  (global.GAME_PHASE != "main1")
    and (global.GAME_PHASE != "main2") {
        canPlay = false;
    }
}

return canPlay;
