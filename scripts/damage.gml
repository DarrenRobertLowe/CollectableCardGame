/// damage(target, amount);

var target = argument0;
var amount = argument1;

if (exists(target)) {
    target.hp -= amount;
} else log_error("Invalid target for damage: " + string(target), true);
