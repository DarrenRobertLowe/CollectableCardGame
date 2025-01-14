///autoShowHideHand();

if (!hand.forceHideContents) {
    if (mouse_y > yShowThreshold) {
        hand.handY = shownY;
    }
    
    if (mouse_y < yHideThreshold) {
        hand.handY = hiddenY;
    }
}
