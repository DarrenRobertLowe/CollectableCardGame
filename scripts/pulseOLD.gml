/// pulseOLD(pulse_factor, pulse_speed)
// returns float : pulse_value
var pulse_factor = argument0;
var pulse_speed  = argument1;

// Update the pulse factor over time
pulse_factor += pulse_speed;

// Optional: Adjust the speed if needed
if (pulse_factor > 2 * pi) {
    pulse_factor -= 2 * pi; // Reset the factor to keep it in range
}

// Calculate the pulsing value using the sine function
pulse_value = 0.5 + 0.5 * sin(pulse_factor); // Value oscillates between 0 and 1

return pulse_value;
