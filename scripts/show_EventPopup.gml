///show_EventPopup(spell id, target id, keyword e.g. "Summoning");
var performer   = argument0;
var target      = argument1;
var keyword     = argument2;

var popup = instance_create(0, 0, POPUP_EventInfo);
popup.performer = performer;
popup.target    = target;
popup.keyword   = keyword;
