/// damage(target, amount);

var target = argument0;
var amount = argument1;

if (exists(target)) {
    target.hp -= amount;
    show_debug_message("damage dealt: " +string(amount) + " to " + string(target));
} else log_error("Invalid target for damage: " + string(target) +" does not exist!", true, global.DEBUG);
