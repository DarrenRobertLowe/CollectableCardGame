///startMainPhase();

global.GAME_PHASE = "main";


// trigger Event Listeners
var map = EVENT_LISTENER.MainPhaseSubscribers;
alertEventSubscribers(map);

