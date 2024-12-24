/// swapSlot(slotA, slotB);

var slotA = argument0;
var slotB = argument1;

var tempCard = slotB.card;
slotB.card = slotA.card;
slotA.card = tempCard;

if (slotA.card != noone) {
    slotA.card.slot = slotA;
}

if (slotB.card != noone) {
    slotB.card.slot = slotB;
}
