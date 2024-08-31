///cardSlideIntoPosition();

var epsilon = 0.00001; // avoid division by zero

if (x != targetX) {
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
    var dist = abs(targetY - y);
    var cardSlideSpeed = ceil((dist + epsilon) / cardSlideSpeedMax);
    
    if (y < targetY) then y += cardSlideSpeed;
    else if (y > targetY) then y -= cardSlideSpeed;
    
    // clamp
    if (dist < cardSnapDistance) {
        y = targetY;
    }
}
