/// organizeHand(hand contents list)
var cards = argument0; // the list that represents the contents of the hand
cardSeparation = base_cardSeparation;

if (cards > 0) {
    var handsize = ds_list_size(cards);
    
    if (handsize > 5)
        then cardSeparation = (handAreaWidth / handsize);
    
    if (handsize > 0) {
        for (var i=0; i<handsize; i++) {
            var card = ds_list_find_value(cards, i);
            if ((card.position != "hand")
            and (card.position != "graveyard") 
            and (card.position != "drawing")){
                continue;
            }
            
            if (owner == global.player) 
              then card.targetX = round(handX + (i * cardSeparation));
              else card.targetX = round(handX - (i * cardSeparation));
            
            card.y = handY;
            
            if (card.position != "drawing") {
                card.depth = ((global.hand_depth - handsize) + i);
                
                if (showContents == true) {
                    card.displayed = true;
                    card.faceUp    = true;
                } else {
                    card.displayed = false;
                }
            }
        }
    }
}

