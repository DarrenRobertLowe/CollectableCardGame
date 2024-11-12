///hasDefenders(contestant);
var contestant = argument0;

with (CARDSLOT) {
    if (card != noone) {
        if (card.owner == contestant) {
            if (creatureCanDefend(card)) {
                return true;
            }
        }
    }
}
