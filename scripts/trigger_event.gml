/// trigger_event(event_map);
/* Usage example:
 * trigger_event(EVENT_LISTENER.SpellCast);
 */

var event = argument0;

with (EVENT_LISTENER) {
    var key = ds_map_find_first(event_map);
     
    while (key != noone) {
        var callback = ds_map_find_value(event_map, key);
       
        if (exists(key)) {
            with (key) {
                event_perform(ev_other, ev_user12);
                script_execute(callback);
            }
        } else log("Warning! Non-existant key in trigger_event()!");
        
        key = ds_map_find_next(event_map, key);
    }
}
