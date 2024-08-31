///draw_text_bordered(x, y, string, inside colour, border colour);

var xx = argument0;
var yy = argument1;
var str = argument2;
var inColour = argument3;
var outColour = argument4;

draw_text_colour(xx, yy-1, str, outColour, outColour, outColour, outColour, 1);
draw_text(xx-1, yy, str);
draw_text(xx, yy+1, str);
draw_text(xx+1, yy, str);

draw_text_colour(xx, yy, str, inColour, inColour, inColour, inColour, 1);
