///marchCreatureForward(creature);
var creature        = argument0;
var currentSlot     = creature.slot;
var alternativeSlot = creature.slot.alternativeSlot;

// swaparoo
alternativeSlot.card = creature;
currentSlot.card = noone;
creature.slot = alternativeSlot;
creature.movedLane = true;

waitTime = room_speed;
