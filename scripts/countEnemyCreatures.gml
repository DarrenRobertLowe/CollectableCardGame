///countEnemyCreatures();

var count = 0;

with(CARDSLOT) {
    if (owner != global.TURN) {
        if (isCreature(card)) {
            count++;
        }
    }
}

return count;
