///slideIntoPositionX();
if (x != targetX) {
    var dist = abs(targetX - x);
    var slideSpeed = ceil((dist + EPSILON) / slideSpeedMax);
    
    if (x < targetX) then x += slideSpeed;
    else if (x > targetX) then x -= slideSpeed;
    
    // clamp
    if (dist < snapDistance) {
        x = targetX;
    }
}
