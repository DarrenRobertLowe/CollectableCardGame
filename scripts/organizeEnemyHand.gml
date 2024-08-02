/// organizeEnemyHand(hand)
var hand = argument0;
var cardSeparation = base_cardSeparation;

if (hand > 0) {
    var handsize = ds_list_size(hand);
    
    if (handsize > 5)
        then cardSeparation = (handAreaWidth / handsize);
    
    if (handsize > 0) {
        for (var i=0; i<handsize; i++) {
            var card = ds_list_find_value(hand, i);
            card.x = handX - (i * cardSeparation);
            card.y = handY;
            card.depth = ((global.hand_depth - handsize) + i);
            if (showHand == true) {
                card.displayed = true;
                card.faceUp    = true;
            } else {
                card.displayed = false;
            }
        }
    }
}

