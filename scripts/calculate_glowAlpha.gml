///calculate_glowAlpha();

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
