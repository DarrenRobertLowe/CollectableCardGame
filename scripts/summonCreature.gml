/// summonCreature(card id)
var creature = argument0;
show_debug_message("Creature is: "+string(creature));
creature.summoned = true;

with(BACK_SLOT) {
    glowing = false;
}

show_EventPopup(creature, noone, "Summoning");

with(creature) {
    event_user(0); // the summon event
}
