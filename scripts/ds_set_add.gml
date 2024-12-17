///ds_set_add(ds_list, value);
/* Will only add the given value to the given list if
 * the list does not already contain that value.
 *
 * Returns: null
 */
 
var list = argument0;
var value = argument1;

if (ds_list_find_index(list, value) == -1) {
    ds_list_add(list, value);
}
