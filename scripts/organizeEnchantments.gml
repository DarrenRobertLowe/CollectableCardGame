///organizeEnchantments(card);
/* 
 * Sorts all enchantments on the given card
*/
var card  = argument0;
var owner = card.owner;
var enchantments = card.enchantments;

var enchantmentCount = ds_list_size(enchantments);

if (enchantmentCount > 0) {
    if (owner == global.enemy) {
        card.y = (card.slot.y + (enchantmentCount * enchantmentSeparation)); // drop the card y a little with each enchantment
    }
    
    for (var i=0; i<enchantmentCount; i++) {
        var enchantment = ds_list_find_value(enchantments, i);
        
        enchantment.targetY = round(card.y - ((i+1) * enchantmentSeparation));
        enchantment.targetX = card.x;
        enchantment.depth = (card.depth + (i+1));
    }
}

