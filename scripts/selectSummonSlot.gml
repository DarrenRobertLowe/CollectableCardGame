///selectSummonSlot()
/* Note: This is for CREATURE_CARD only */

// summon to slot
with(BACK_SLOT) {
    if (clicked) {
        if (card == noone) {    // card slot free?
            other.slot = id;
            card = other.id;
            
            global.selectingSummonSlot = false;
            summonCreature(card);
        } else {                // card slot not free?
            if (global.allowSacrifice == true) {
                sendToGraveyard(card.owner.graveyard, card);
            } else {
                show_debug_message("Slot is occupied already by " +string(card));
            }
        }
    }
}
