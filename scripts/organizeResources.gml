/// organizeResources(resources list)
/* The method runs on both hands and graveyards.
*/
 
var cards = argument0; // the list that represents the contents of the lane
cardSeparation = base_cardSeparation;


if (cards > 0) {
    var handsize = ds_list_size(cards);
    
    if (handsize > 5)
      then cardSeparation = (handAreaWidth / handsize);

    
    for (var i=0; i<handsize; i++) {
        var card = ds_list_find_value(cards, i);
        
        if (global.currentCard != card) {   // we want the current card being played to still be visible
            card.displayed = showContents;  // showContents is a boolean determined by the showHand button
        }
        
        
        if ((card.position != "hand")
        and (card.position != "graveyard") 
        and (card.position != "drawing")) {
            continue;
        }
        
        
        if (owner == global.player) {
            card.targetX = round(handX + (i * cardSeparation));
        } else {
            card.targetX = round(handX - (i * cardSeparation)); // opposite direction for enemy
        }
        
        
        card.depth = ((global.hand_depth - handsize) + i);
    }
}
