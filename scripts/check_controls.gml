/// check_controls
global.controls_cancel = false;
global.controls_accept = false;


if (mouse_check_button_released(mb_left)) {
    global.controls_accept = true;
    mouse_clear(mb_left);
}

if (mouse_check_button_released(mb_right)) {
    global.controls_cancel = true;
    mouse_clear(mb_right);
}
