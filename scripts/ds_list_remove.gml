/// ds_list_remove(list, value);
/* Searches the given list for the given value and
 * deletes it if it exists.
 *
 * Returns: Boolean - True if successful, False if not
 */

var list  = argument0;
var value = argument1;

var index = ds_list_find_index(list, value);

if (index > -1) {
    ds_list_delete(list, index);
    return true;
}

return false;
