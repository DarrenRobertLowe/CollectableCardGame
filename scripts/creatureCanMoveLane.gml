///creatureCanMoveLane(creature id);
var creature        = argument0;
var currentSlot     = creature.slot;
var alternativeSlot = creature.slot.alternativeSlot;

if (!creature.movedLane) {
    if (creature.canMoveLane) {
        if (alternativeSlot.card == noone) {
            return true;
        }
    }
}
