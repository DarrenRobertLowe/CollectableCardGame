/// mouseOver();

if  (mouse_x > x - sprite_xoffset)
and (mouse_y > y - sprite_yoffset)
and (mouse_x < (x + sprite_width)  - sprite_xoffset)
and (mouse_y < (y + sprite_height) - sprite_yoffset) {
    return true;
}
else return false;
