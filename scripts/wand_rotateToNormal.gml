///wand_rotateToNormal();
    
if (rotate != 0) {
    var epsilon = 0.00001;
    var dist = abs(rotate);
    
    if (dist > 0) {
        var spd = ((dist / rotateCorrectionSpeed));
        
        if (rotate > 0) {
            rotate -= spd;
        }
        if (rotate < 0) {
            rotate += spd;
        }
    }
}
