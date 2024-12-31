///tryActivate();
if (canUse) {
    if (hasActivationAbility) {
        if (doubleClickWindow > 0) {
            activated = true;
            clicked = false;
        } else {
            doubleClickWindow = CONTROLS.doubleClickWindowMax;
        }
    }
}
