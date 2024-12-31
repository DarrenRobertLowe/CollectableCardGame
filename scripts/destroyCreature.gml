///destroyCreature(target id);
var target = argument0; 

// create an explosion
instance_create(
    target.x + ( (sprite_get_width(spr_card)  * target.scale) * 0.5), 
    target.y + ( (sprite_get_height(spr_card) * target.scale) * 0.5), 
    fx_explode
);

// start the destruction event
with(target) {
    event_user(CONST_DESTROY_EVENT);
}
