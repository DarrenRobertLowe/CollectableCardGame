///allowCancelSelectSummonSlot()

// allow summon CANCEL
if (global.controls_cancel) {
    global.selectingSummonSlot = false;
    global.currentCard = noone;
    unenforceHideCards();
    
    with(BACK_SLOT) {
        glowing = false;
    }
}
