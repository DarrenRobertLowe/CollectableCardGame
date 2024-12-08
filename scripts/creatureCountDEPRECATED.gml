///creatureCount(CONTESTANT);

var contestant = argument0;
var totalCreatures = 0;

if (contestant == global.enemy) {
    with(ENEMY_CARDSLOT) {
        if (card != noone) {
            totalCreatures++;
        }
    }
}

return totalCreatures;
