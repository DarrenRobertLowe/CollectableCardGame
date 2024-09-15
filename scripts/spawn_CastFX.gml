///spawn_CastFX(target);
var target = argument0;

/// create the spell FX
instance_create(target.x, target.y, castFX);
castFX.target = target;

castFX.minX = target.x;
castFX.minY = target.y;
castFX.maxX = target.x + (sprite_get_width(target.sprite_index)  * target.scale);
castFX.maxY = target.y + (sprite_get_height(target.sprite_index) * target.scale);
