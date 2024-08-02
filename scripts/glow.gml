///glow

if (glowAlphaSwitch = 0) {
    glowAlpha += glowSpeed;
    if (glowAlpha >= 1.5) {
        glowAlphaSwitch = 1;
    }
}

if (glowAlphaSwitch = 1) {
    glowAlpha -= glowSpeed;
    if (glowAlpha <= .2) {
        glowAlphaSwitch = 0;
    }
}

draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x-5, y-3, scale * 1.1, scale * 1.1, 0, c_aqua, glowAlpha);
draw_set_blend_mode(bm_normal);
