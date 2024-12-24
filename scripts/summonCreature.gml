/// summonCreature(card id)
var creature = argument0;
creature.activated = true;
show_EventPopup(creature, noone, "Summoning");

with(creature) {
    event_user(0); // the summon event
}
