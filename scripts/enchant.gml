///enchant(target, enchantment id);
var target = argument0;
var enchantment = argument1;

var position = ds_list_find_index(target.enchantments, enchantment);

// remove enchantment if it already exists somehow
if (position > -1) {
    ds_list_delete(target.enchantments, position);
    with(enchantment) {
        event_user(2); // remove effects
    }
}

// add the enchantment
ds_list_add(target.enchantments, id);
with(enchantment) {
    event_user(1); // apply effects
}
