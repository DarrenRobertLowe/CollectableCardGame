/// wand_rotate()

if (mouse_x != old_mouse_x) {
    var dist = abs(mouse_x - old_mouse_x);
    var spd = (rotateSpeed * dist);
    
    if (mouse_x > old_mouse_x) { // to the right
        rotate -= spd; // counter-clockwise
    } else {
        rotate += spd; // clockwise
    }
    
    if (rotate < rotateMin) then rotate = rotateMin;
    if (rotate > rotateMax) then rotate = rotateMax;
}
