/// mouseOverCard();
var hand  = owner.hand;
var grave = owner.graveyard;

// prevent clicking through hand to cards below
if (position == "board") {
    if (hand.showContents == true)
    or (grave.showContents == true) {
        return false;
    }
}

// hand
ds_priority_clear(hand.cardHoverQueue);
var val = id;

// otherwise, find which card should be on top
with (CARD) {
    if (position == "hand") {
        if  (mouse_x > x)
        and (mouse_y > y)
        and (mouse_x < (x + sprite_width))
        and (mouse_y < (y + sprite_height)) {
            ds_priority_add(hand.cardHoverQueue, id, depth);
        }
    }
}

var val = ds_priority_find_min(hand.cardHoverQueue);
hand.currentCardHover = val;
return val;

