///glow
var glow_scale = scale; // (scale * 1.1);

draw_set_blend_mode(bm_add);
draw_sprite_ext(glow_sprite, image_index, x, y, glow_scale, glow_scale, 0, glow_colour, glowAlpha);
draw_set_blend_mode(bm_normal);

