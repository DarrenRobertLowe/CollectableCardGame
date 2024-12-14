/// addResourceCardToLane(resourceLane id, resource id);
var lane     = argument0;
var resource = argument1;
var cards    = lane.cards;
var thisCard = "Resource id:" +string(resource) + "(" + string(object_get_name(resource.object_index)) + ")";

// check for existing resource
if (ds_list_find_index(cards, resource) > -1) {
    log("Warning: " + thisCard + " was already in the given resource lane list. It was removed and readded.");
    var pos = ds_list_find_index(cards, id);
    ds_list_delete(cards, pos);
}

// add to the list
ds_list_add(cards, id);
