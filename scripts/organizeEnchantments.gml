///organizeEnchantments(card);
/* 
 * Sorts all enchantments on the given card
*/
var parent  = argument0;
var cards = parent.enchantments;
enchantmentSeparation = base_enchantmentSeparation;


if (cards > 0) {
    var enchantmentCount = ds_list_size(cards);
    
    //parent.y += ((enchantmentCount-1) * enchantmentSeparation); // drop the card y a little with each enchantment
    
    for (var i=0; i<enchantmentCount; i++) {
        var enchantment = ds_list_find_value(cards, i);
        
        if (owner == global.player) {
            enchantment.targetY = round(parent.y - ((i+1) * enchantmentSeparation));
        } else {
            enchantment.targetY = round(parent.y + ((i+1) * enchantmentSeparation)); // opposite direction for enemy
        }
        
        enchantment.targetX = parent.x;
        enchantment.depth = (parent.depth + (i+1));
    }
}

