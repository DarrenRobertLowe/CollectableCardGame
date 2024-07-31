///mouseOverCreature();
with (CARD) {
    if (position == "board") {
        if (type == CREATURE_CARD) {
            if (mouseOver()) {
                return id;
            }
        }
    }
}

return noone;
