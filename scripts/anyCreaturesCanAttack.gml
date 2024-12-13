///anyCreaturesCanAttack(list of creatures);
/* returns boolean 
 * Determines whether the given list of creatures contains
 * any that can attack.
 */
var creatures = argument0;

for(var i=0; i<ds_list_size(creatures); i++) {
    var creature = ds_list_find_value(creatures, i);
    
    if (creatureCanAttack(creature)) {
        return true;
    }
}
