///startMainPhase();
var creatures = getCreatures(global.TURN);
for (var i=0; i<ds_list_size(creatures); i++) {
    var creature = ds_list_find_value(creatures, i);
    with(creature) {
        event_user(MAIN_PHASE_EVENT);
    }
}
