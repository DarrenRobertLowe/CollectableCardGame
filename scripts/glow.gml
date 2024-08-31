///glow

//glowAlpha = (glow_alpha_offset + glow_alpha_range * sin(current_time / glowSpeed));

draw_set_blend_mode(bm_add);
draw_sprite_ext(glow_sprite, image_index, x + glow_offset_x, y + glow_offset_y, scale * 1.1, scale * 1.1, 0, glow_colour, glowAlpha);
draw_set_blend_mode(bm_normal);
