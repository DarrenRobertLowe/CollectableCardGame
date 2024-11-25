///countCreatureResources(untapped resources list);
/* Returns the total Creature Resources in our 
 * own resource lane.
*/

var untappedResources = argument0;
var totalResourceCount = 0;

for (var i=0; i<ds_list_size(untappedResources); i++) {
    var resource = ds_list_find_value(untappedResources, i);
    totalResourceCount += resource.creatureResources;
}

return totalResourceCount;
