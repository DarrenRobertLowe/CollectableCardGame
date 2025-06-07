///subscribe_to_event(event_map, subscriber id, event to run (callback))
/* example usage:
 * subscribe_to_event(EVENT_LISTENER.SpellCastSubscribers, id, event_user(12));
*/

var event_map     = argument0;
var subscriber_id = argument1;
var callback      = argument2;

ds_map_add(event_map, subscriber_id, callback);
