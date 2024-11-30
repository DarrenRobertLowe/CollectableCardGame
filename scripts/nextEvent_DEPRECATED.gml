///nextEvent()
/*
var list = global.EVENT_LIST;

if (ds_list_size(list) > 0) {
    var event = ds_list_find_value(global.EVENT_LIST, 0);
    ds_list_delete(global.EVENT_LIST, 0);
    
    if (exists(event)) {
        with(event) {
            event_user(0); // perform the event
        }
    } else {
        log("Error in nextEvent(): Could not find event " + string(event) + "! Skipped to the next instead.");
        nextEvent();
    }
} else {
    nextPhase();
}
