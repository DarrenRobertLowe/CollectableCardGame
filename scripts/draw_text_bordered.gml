///draw_text_bordered(x, y, string, inside colour, border colour, alpha);

var xx = argument0;
var yy = argument1;
var str = argument2;
var inColour = argument3;
var outColour = argument4;
var alpha = argument5;

draw_text_colour(xx, yy-1, str, outColour, outColour, outColour, outColour, alpha);
draw_text_colour(xx-1, yy, str, outColour, outColour, outColour, outColour, alpha);
draw_text_colour(xx, yy+1, str, outColour, outColour, outColour, outColour, alpha);
draw_text_colour(xx+1, yy, str, outColour, outColour, outColour, outColour, alpha);

draw_text_colour(xx, yy, str, inColour, inColour, inColour, inColour, alpha);
