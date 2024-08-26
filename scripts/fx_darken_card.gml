/// fx_darken_card()
var width  = (sprite_get_width(sprite_index) * scale);
var height = (sprite_get_height(sprite_index) * scale);
draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_rectangle(x, y, x + width, y + height, false);
draw_set_alpha(1);
