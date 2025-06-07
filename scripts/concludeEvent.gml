///concludeEvent(id, event number);
var debugging = true;
var key   = argument0;
var targetValue = argument1;
var events  = EVENT_HANDLER.events;



// iterate through the events
// find maps that correspond with the key
// delete any that have a  matching value

var size = ds_list_size(events);

for(i=0; i<size; i++) {
    var map     = ds_list_find_value(events, i);
    var first   = ds_map_find_first(map);       // each map should only have 1 value, so this should do it.
    
    var value   = ds_map_find_value(map, key);
    
    if (value == targetValue) {
        if (debugging) then show_debug_message("deleting map for " +string(key) + " from events events");
        //ds_map_delete(map, key);
        ds_map_destroy(map);        // should be empty and never used again at this point
        ds_list_delete(events, i);  // so we don't have an empty entry in our events list
    }
}


with (EVENT_HANDLER) {
    event_user(global.EVENT_HANDLER_RING_BELL);
}
