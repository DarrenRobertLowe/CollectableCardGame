/// mouseOverCard();
ds_priority_clear(HAND_CONTROLLER.cardHoverQueue);
var val = id;

// keep us on top if we're already on top.
if (HAND_CONTROLLER.currentCardHover == id)
  then return id;

// otherwise, find which card should be on top
with (CARD) {
    if (position == "hand") {
        if  (mouse_x > x)
        and (mouse_y > y)
        and (mouse_x < (x + sprite_width))
        and (mouse_y < (y + sprite_width)) {
            ds_priority_add(HAND_CONTROLLER.cardHoverQueue, id, depth);
        }
    }
}


var val = ds_priority_find_min(HAND_CONTROLLER.cardHoverQueue);
HAND_CONTROLLER.currentCardHover = val;
return val;

