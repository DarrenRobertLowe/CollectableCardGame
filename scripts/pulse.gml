/// pulse(current_value, max_value, min_value, speed)
// returns float : pulse_value
var current_value = argument0;
var max_value = argument1;
var min_value = argument2;
var spd = argument3;

// Calculate the mid-point and amplitude
var mid_point = (max_value + min_value) / 2;
var amplitude = (max_value - min_value) / 2;

// Update the pulse factor over time
pulse_factor += spd;

// Optional: Adjust the factor if needed
if (pulse_factor > 2 * pi) {
    pulse_factor -= 2 * pi; // Reset the factor to keep it in range
}

// Calculate the pulsing value using the sine function
var pulse_value = mid_point + amplitude * sin(pulse_factor);

return pulse_value;

