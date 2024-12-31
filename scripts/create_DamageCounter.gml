///create_DamageCounter(target, amount);
var target = argument0;
var amount = argument1;


var targX = 0;
var targY = 0;

if (target == global.player) {
    targX = GUI.playerHPX;
    targY = GUI.playerHPY;
} else if (target == global.enemy) {
    targX = GUI.enemyHPX;
    targY = GUI.enemyHPY;
} else {
    targX = (target.x + ((sprite_get_width(target.sprite_index)  * target.scale) * 0.5));
    targY = (target.y + ((sprite_get_height(target.sprite_index) * target.scale) * 0.5));
}

var dmgCounter = instance_create(targX, targY, DAMAGE_COUNTER);
dmgCounter.value = amount;
