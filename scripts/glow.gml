///glow
draw_set_blend_mode(bm_add);
draw_sprite_ext(glow_sprite, 0, x, y, scale, scale, image_angle, glow_colour, glowAlpha);
draw_set_blend_mode(bm_normal);
