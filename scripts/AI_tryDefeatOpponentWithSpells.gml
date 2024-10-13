//AI_tryDefeatOpponentWithSpells()
show_debug_message("running AI_tryDefeatOpponentWithSpells()");
// go through each spell from weakest to strongest
var spellList = argument0;
var target = noone;

for (var s=ds_list_size(spellList)-1; s>=0; s--) {
    spell = ds_list_find_value(spellList, s);
    
    // target the enemy directly if it would kill them
    if (opponent.hp <= spell.attack) {
        target = opponent;
        break;
    } else if (attack > 0) {
        value = ( attack / (opponent.hp + epsilon) )
        if (value > damageSpellThreshold) {
            target = opponent;
            break;
        }
    }
}
show_debug_message("target is: " +string(target) );
return target;
