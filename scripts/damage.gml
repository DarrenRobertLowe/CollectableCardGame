/// damage(target, amount);

var target = argument0;
var amount = argument1;

if (exists(target)) {
    target.hp -= amount;
    
    
    // find the targX and targY for the DAMAGE_COUNTER
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
    
    if (object_is_ancestor(target.object_index, CREATURE_CARD)) {
        // update the stats
        with (target) {
            getCardSurface();
        }
        
        // destroyed?
        if (target.hp <= 0) {
            // create an explosion
            instance_create(
                target.x + ( (sprite_get_width(spr_card)  * target.scale) * 0.5), 
                target.y + ( (sprite_get_height(spr_card) * target.scale) * 0.5), 
                fx_explode);
            sendToGraveyard(target.owner.graveyard, target);
        }
    }
} else log("Error: Invalid target for damage: " + string(target) +" does not exist!");
