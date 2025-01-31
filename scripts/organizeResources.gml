/// organizeResources(resources lane, resources list)

var lane  = argument0;
var cards = argument1; // the list that represents the contents of the lane
var targetX = lane.x;
var targetY = lane.y;
var verticalSeparation = lane.verticalSeparation;

var laneLength = ds_list_size(cards);
if (laneLength > 0) {
    //if (laneLength > 5)
     // then verticalSeparation = (laneHeight / laneLength);

    
    for (var i=0; i<laneLength; i++) {
        var card = ds_list_find_value(cards, i);
        
        card.targetX = targetX;
        card.targetY = round(targetY + (i * verticalSeparation));
        card.depth = (global.card_depth - i);
    }
}
