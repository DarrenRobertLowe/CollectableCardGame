///removeEnchantment(id)

var enchantment = argument0;
var target = enchantment.target;
var thisCard = "Enchantment " + string(enchantment) + " (" +string(object_get_name(enchantment.object_index)) + ")";

if (exists(target)) {
    var position = ds_list_find_index(target.enchantments, id);
    if (position > -1) {
        ds_list_delete(target.enchantments, position);
    } else log(thisCard + "'s target did not exist when attempting to remove self from enchantments list!");
} else log(thisCard + "'s target did not exist!");

