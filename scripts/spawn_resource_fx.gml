///spawn_resource_fx(startX, startY, targetX, targetY, colour, minAmplitude, maxAmplitude);

var startX = argument0;
var startY = argument1;

var glowie = instance_create(startX, startY, fx_resource_glowie);

glowie.startX  = startX;
glowie.startY  = startY;
glowie.targetX = argument2;
glowie.targetY = argument3;
colour         = argument4;
glowie.colour  = colour;
glowie.pulse_factor = random(1);

var minScale = 0.25;
var maxScale = 2;
glowie.scale = minScale + random(maxScale - minScale);
glowie.image_alpha = random(1);

var minAmplitude = argument5;
var maxAmplitude = argument6;
var minFrequency = argument7;
var maxFrequency = argument8;

glowie.amplitude = minAmplitude + random(maxAmplitude - minAmplitude);
glowie.frequency = minFrequency + random(maxFrequency - minFrequency);



glowie.col_red   = colour_get_red(colour);
glowie.col_green = colour_get_green(colour);
glowie.col_blue  = colour_get_blue(colour);

