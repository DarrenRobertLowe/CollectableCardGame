///marchCreatureForward(creature);
var creature        = argument0;
var currentSlot     = creature.slot;
var alternativeSlot = creature.slot.alternativeSlot;

if (currentSlot.object_index == BACK_SLOT) {
    if (alternativeSlot.card == noone) {
        alternativeSlot.card = creature;
        currentSlot.card = noone;
        creature.slot = alternativeSlot;
    }
}
