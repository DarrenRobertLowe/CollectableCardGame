/// priorityQueueToList(priority queue)
/* Note: this does not destroy the priority
 * queue afterwards.
 */
var pqueue = argument0;
var list = ds_list_create();

while (ds_priority_size(pqueue) > 0) {
    ds_list_add(list, ds_priority_delete_max(pqueue));
}

return list;
