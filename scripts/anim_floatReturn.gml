///anim_floatReturn();
/* Takes an object that is hovering and rotating and 
 * returns it to the base state over time.
*/

if (hoverAmount < 0) {
    if (hoverAmount > -0.5) {
        hoverAmount = 0;
    } else {
        hoverAmount += 0.5;
    }
}

if (hoverAmount > 0) {
    if (hoverAmount < 0.5) {
        hoverAmount = 0;
    } else {
        hoverAmount -= 0.5;
    }
}

if (rotateAmount < 0) {
    if (rotateAmount > -1) {
        rotateAmount = 0;
    } else {
        rotateAmount ++;
    }
}

if (rotateAmount > 0) {
    if (rotateAmount < 1) {
        rotateAmount = 0;
    } else {
        rotateAmount--;
    }
}
