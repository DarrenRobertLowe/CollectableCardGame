///getUntappedResources(resources list, untappedResources list);
resources = argument0;
untappedResources = argument1;

for(var i=0; i<ds_list_size(resources); i++) {
    var resource = ds_list_find_value(resources, i);
    
    if (resource.alreadyActivated == false) {
        ds_list_add(untappedResources, resource);
    }
}
