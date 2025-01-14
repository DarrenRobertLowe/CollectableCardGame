///movement_waveX(startX, startY, targetX, targetY, amplitude, frequency, xSpeedMax);

var startX      = argument0;
var startY      = argument1;
var endX        = argument2;
var endY        = argument3;
var amplitude   = argument4; // Maximum height of the wave
var freq        = argument5;
var xSpeedMax   = argument6;

// Determine the distance
var distanceX = targetX - startX;
var distanceY = endY - startY;


// Calculate the wave frequency (2 * PI * number of cycles)
var frequency = (freq * pi);

// In the update step of the particle
var progress = (x - startX) / distanceX;
var taper = 1 - progress; // reduces amplitude over the path
var yOffset = amplitude * taper * sin(progress * frequency);

// Update particle position
var xSpeed = xSpeedMax * sign(endX - startX);

// interpolate Y
var yProgress = (x - startX) / distanceX;
var yInterp   = startY + (distanceY * yProgress) + yOffset;

// Check if particle is about to overshoot endX
if (abs(x - endX) <= abs(xSpeed)) { 
    x = endX;
    y = endY; // Optional, if you want to set y to endY at the end point 
} else {
    x += xSpeed;
    y = yInterp;
}
