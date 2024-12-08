/// canAttackDirectly(CONTESTANT id)

var contestant = argument0;
var result = false;

if (countEnemyCreatures() == 0) {// (creatureCount(contestant) == 0) {
    result = true;
}

// if result is still false -> check each creature if they can actually defend
// if result is still false -> check if an artifact/enchantment prevents attacking

return result;
