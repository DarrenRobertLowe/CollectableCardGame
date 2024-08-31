/// setup_wand_particles();
particle_system = global.PARTICLE_SYSTEM;
particle_type = part_type_create();
particleCount = 1;

part_system_depth(particle_system, global.info_depth);

// Define the particle type
part_type_shape(particle_type, pt_shape_spark);
part_type_size(particle_type, 0.5, 1, 0.2, 0.5);
//part_type_colour_mix(particle_system, c_white, c_teal);
part_type_colour3(particle_type, c_white, c_yellow, c_teal);
part_type_alpha3(particle_type, 0.75, 0.25, 0);
part_type_speed(particle_type, 2, 4, -0.01, 0.5);
part_type_direction(particle_type, 0, 180, 1, 20);
part_type_gravity(particle_type, 0.3, 270);
part_type_life(particle_type, 10, 30);
