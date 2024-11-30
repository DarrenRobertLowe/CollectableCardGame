/// summonCreature(card id)
var spell = argument0;
spell.activated = true;
show_EventPopup(spell, noone, "Summoning");
event_user(0); // the summon event
