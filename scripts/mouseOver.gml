///mouseOver();

if  (mouse_x > x)
and (mouse_y > y)
and (mouse_x < (x + sprite_width))
and (mouse_y < (y + sprite_width)) {
    return true;
}
else return false;
