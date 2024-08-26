///draw_text_bordered(x, y, string, inside colour, border colour);

var xx = argument0;
var yy = argument1;
var str = argument2;
var inColour = argument3;
var outColour = argument4;

draw_set_colour(outColour);
draw_text(xx, yy-1, str);
draw_text(xx-1, yy, str);
draw_text(xx, yy+1, str);
draw_text(xx+1, yy, str);

draw_set_colour(inColour);
draw_text(xx, yy, str);
