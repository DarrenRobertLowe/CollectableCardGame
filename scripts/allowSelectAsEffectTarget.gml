///allowSelectAsEffectTarget()

if (global.choosingEffectTarget == true) {
    if (isValidTarget(id)) {
        glowing = true;
        
        if (clicked) {
            clicked = false;
            global.target = id;
        }
    }
}
