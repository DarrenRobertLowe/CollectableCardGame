/// fight(attacker, defender);

var attacker = argument0;
var defender = argument1;

if !(exists(attacker)) {
    debug("attacker: " +string(attacker) + " does not exist!");
    exit;
}
if !(exists(defender)) {
    debug("defender: " +string(defender) + " does not exist!");
    exit;
}

// is the target a player?
if (object_is_ancestor(defender.object_index, CONTESTANT)) {
    debug("defender is a contestant, attacking directly");
    damage(defender, attacker.attack);
    attacker.attacking = false;
    attacker.attackedThisTurn = true;
    exit;
}

// who's on first?
var attackerInitiative = 0;
var defenderInitiative = 0;

if (ds_list_find_index(attacker.abilities, "First-strike") > -1) {
    attackerInitiative++;
}
if (ds_list_find_index(defender.abilities, "First-strike") > -1) {
    defenderInitiative++;
}


// attacker has initiative
if (attackerInitiative > defenderInitiative) {
    damage(defender, attacker.attack);
    
    // return damage?
    if (defender.hp > 0) {
        damage(attacker, defender.attack);
    }
}

// defender has initiative
if (defenderInitiative > attackerInitiative) {
    damage(attacker, defender.attack);
    
    // return damage?
    if (attacker.hp > 0) {
        damage(defender, attacker.attack);
    }
}

// neither has intiative
if (defenderInitiative == attackerInitiative) {
    damage(defender, attacker.attack);
    damage(attacker, defender.attack);
}

// finish
attacker.attacking = false;
attacker.attackedThisTurn = true;
