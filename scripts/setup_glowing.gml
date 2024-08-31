///setup_glowing();

// GLOWING EFFECTS
glowing = false;
glowAlpha = 1;
glowAlphaSwitch = 0;
glowSpeed = 0.05;
scale = 1;
glow_sprite = sprite_index;
glow_colour = c_aqua;

glow_offset_x = 0 - sprite_get_width(sprite_index) * 0.05;
glow_offset_y = 0 - sprite_get_height(sprite_index)* 0.05;

/* if using the sin function
glowSpeed = 500;
var min_glow_alpha = 0.2; // Minimum alpha value
var max_glow_alpha = 1.0; // Maximum alpha value
glow_alpha_range = (max_glow_alpha - min_glow_alpha) / 2;
glow_alpha_offset = min_glow_alpha + glow_alpha_range;
*/
