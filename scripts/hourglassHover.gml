/// hourglassHover();

if (hoverSwitch == false) {
        hoverAmount -= hoverAccel;
        if (hoverAmount <= hoverMin) {
            hoverSwitch = true;
        }
    }
    
    if (hoverSwitch == true) {
        hoverAmount += hoverAccel;
        
        if (hoverAmount >= hoverMax) {
            hoverSwitch = false;
        }
    }
    
    
    if (rotateSwitch == false) {
        rotateAmount -= rotateSpeed;
         if (rotateAmount <= rotateMin) {
            rotateSwitch = true;
        }
    }
    if (rotateSwitch == true) {
        rotateAmount += rotateSpeed;
        
        if (rotateAmount >= rotateMax) {
            rotateSwitch = false;
        }
    }
