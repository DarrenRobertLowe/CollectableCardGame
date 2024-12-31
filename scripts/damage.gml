/// damage(attacker, target, amount);
var attacker = argument0;
var target   = argument1;
var amount   = argument2;

// ESCAPE CONDITIONS
if (amount >= 0) {
    show_debug_message(string(attacker) +" is damaging "+ string(target) +" for "+ string(amount));
} else {
    show_debug_message(string(attacker) +" is healing "+ string(target) +" for "+ string(amount));
}

if (!exists(attacker)) {
    if (attacker != noone) { // we need this to allow abilities like drain to damage()
        log("Error: Invalid attacker in damage(): " + string(attacker) +" does not exist and is not noone (-4)!");
        exit;
    }
}

if (!exists(target)) {
    log("Error: Invalid target in damage(): " + string(target) +" does not exist!");
    exit;
}


// EVENT
target.hp -= amount;

if (attacker != noone) {
    triggerAbilitiesOnDamage(attacker, target, amount);
}

create_DamageCounter(target, amount);

if (object_is_ancestor(target.object_index, CREATURE_CARD)) {
    updateStats(target);
    
    if (target.hp <= 0) {
        destroyCreature(target);
    }
}
