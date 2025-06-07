///alertEventSubscribers(map);
var map  = argument0;

if (ds_map_size(map) > 0) {
    var key = ds_map_find_first(map);
    
    if (is_undefined(key)) {
        show_debug_message("!!!!!! ERROR: alertEventSubscribers() says Key was undefined !!!!!");
    } else {
        var size = ds_map_size(map);
        var key  = ds_map_find_first(map);
        for (var i = 0; i < size; i++;) {
            var value = ds_map_find_value(map, key);
            
            show_debug_message("alertEventSubscribers: key: "+ string(key) + "  value:" +string(value));
            
            /*// -- Trigger the event for each listener --
            with(key) {
                show_debug_message("**** EVENT_HANDLER calling " +string(key) + " at event_user(" +string(value) + ") *****");
                event_user(value);
            }*/
            
            // add each event to the EVENT_HANDLER queue
            var newMap = ds_map_create();
            ds_map_add(newMap, key, value);
            ds_list_add(EVENT_HANDLER.events, newMap);
            
            key = ds_map_find_next(map, key);
        }
        
        // Trigger the next event
        nextEvent();
    }
}
