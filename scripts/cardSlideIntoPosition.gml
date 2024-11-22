///cardSlideIntoPosition();

var epsilon = 0.00001; // avoid division by zero

if (x != targetX) {
    //show_debug_message("Card x is sliding, target: " + string(targetX) + " id: " +string(id));
    var dist = abs(targetX - x);
    var cardSlideSpeed = ceil((dist + epsilon) / cardSlideSpeedMax);
    
    if (x < targetX) then x += cardSlideSpeed;
    else if (x > targetX) then x -= cardSlideSpeed;
    
    // clamp
    if (dist < cardSnapDistance) {
        x = targetX;
    }
}

// add y sliding
if (y != targetY) {
    //show_debug_message("Card y is sliding, target: " + string(targetY) + " id: " +string(id));
    var dist = abs(targetY - y);
    var cardSlideSpeed = ceil((dist + epsilon) / cardSlideSpeedMax);
    
    if (y < targetY) then y += cardSlideSpeed;
    else if (y > targetY) then y -= cardSlideSpeed;
    
    // clamp
    if (dist < cardSnapDistance) {
        y = targetY;
    }
}
