///getUntappedResources(resources list);
/* Return: list of everything in the resources list that hasn't yet been tapped.
*/

var resources = argument0;
var untappedResources = ds_list_create();

for(var i=0; i<ds_list_size(resources); i++) {
    var resource = ds_list_find_value(resources, i);
    
    if (resource.activated == false) {
        ds_list_add(untappedResources, resource);
    }
}

return untappedResources;
