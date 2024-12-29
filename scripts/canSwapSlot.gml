///canSwapSlot(card id);
var card = argument0;

if (slotIsEmpty(card.slot.alternativeSlot)) {
    return true;
}
