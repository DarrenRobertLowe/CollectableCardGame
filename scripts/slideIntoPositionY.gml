///slideIntoPositionY();
if (y != targetY) {
    var dist = abs(targetY - y);
    var slideSpeed = ceil((dist + EPSILON) / slideSpeedMax);
    
    if (y < targetY) then y += slideSpeed;
    else if (y > targetY) then y -= slideSpeed;
    
    // clamp
    if (dist < snapDistance) {
        y = targetY;
    }
}
