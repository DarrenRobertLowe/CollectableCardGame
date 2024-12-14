/// removeResource(resourceLane id, resource id);
var lane     = argument0;
var resource = argument1;
var thisLane = string(lane) + " (" + string(object_get_name(lane.object_index)) +")";
var thisCard = "Resource id:" +string(resource) + "(" + string(object_get_name(resource.object_index)) + ")";

// check for existing resource
if (ds_list_find_index(lane, resource) > -1) {
    var pos = ds_list_find_index(owner.resourceLane, id);
    ds_list_delete(owner.resourceLane, pos);
} else {
    log("Warning: " + thisCard + " was not found in the given resource lane list: " + thisLane + " and could not be removed.");
}
