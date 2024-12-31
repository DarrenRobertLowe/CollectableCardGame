/// triggerAbilitiesOnDamage(attacker id, damage amount);
var attacker = argument0;
var target   = argument1;
var amount   = argument2;

show_debug_message("triggerAbilitiesOnDamage() says: attacker is " +string(attacker) + ", target is "+ string(target));
// Drain
if (ds_list_find_index(attacker.abilities, "Drain") > -1) {
    if (isContestant(target)) {
        show_debug_message("Drain is sending HP to owner");
        damage(noone, attacker.owner, -amount); // using "attacker" here would cause an infinite loop
    }
}
