///allowSelectAsEffectTarget()

if (global.choosingEffectTarget == true) {
    if (isValidTarget(id)) {
        if (isMouseOver) {
            glowing = true;
            
            
            if (clicked) {
                clicked = false;
                global.target = id;
            }
        }
    }
}
