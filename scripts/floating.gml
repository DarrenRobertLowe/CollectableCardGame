///floating();

// Calculate the floating offset
var float_amplitude = 5; // Maximum height of the float
var float_speed = 500; // Speed of the float
var float_offset = float_amplitude * sin(current_time / float_speed);

// Draw the main sprite with the floating effect
draw_sprite_ext(sprite_index, 0, x, y + float_offset, 1, 1, 0, c_white, 1);
