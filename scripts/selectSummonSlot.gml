///selectSummonSlot()
/* Note: This is for CREATURE_CARD only */

// summon to slot
with(BACK_SLOT) {
    if (clicked) {
        if (card == noone) {
            other.slot = id;
            card = other.id;
            
            global.selectingSummonSlot = false;
            summonCreature(other.id);
        } else show_debug_message("Slot is occupied already by " +string(card));
    }
}
