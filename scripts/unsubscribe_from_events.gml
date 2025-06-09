///unsubscribe_from_events(subscriber id)
/* Unsubs the card from all events.
*/

targetKey = argument0;

show_debug_message("Trying to unsub: targetKey is "+ string(targetKey));
var listOfSubscriptions = EVENT_LISTENER.subscriptions;

var map = ds_list_find_value(EVENT_LISTENER.subscriptions, 0);

var size = ds_list_size(listOfSubscriptions);
for(var i=0; i<size; i++) {
    var map = ds_list_find_value(listOfSubscriptions, i);
    show_debug_message("Trying to unsub: map is "+ string(map));
    
    var mapSize     = ds_map_size(map);
    var currentKey  = ds_map_find_first(map);
    if (mapSize > 0) {
        for(var j=0; j<mapSize; j++) {
            if (currentKey == targetKey) {
                ds_map_delete(map, currentKey);
                currentKey = ds_map_find_first(map);
                j=0;
                mapSize = ds_map_size(map);
                show_debug_message("Successfully unsubbed: "+string(targetKey));
            } else {
                show_debug_message("currentKey "+string(currentKey) +" did not match targetKey " +string(targetKey));
                currentKey = ds_map_find_next(map, currentKey);
            }
        }
    }
}
