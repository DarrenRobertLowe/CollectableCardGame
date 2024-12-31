///isValidTarget(card)
var target = argument0;

if !(exists(global.currentCard)) { 
    log("Error in isValidTarget(): global.currentCard does not exist!");
    exit;
}

var validTargets = global.currentCard.validTargets;
var size = ds_list_size(validTargets);


for(var i=0; i<size; i++) {
    var value = ds_list_find_value(validTargets, i);
    switch(value) {
        case "contestant":
            if (isContestant(target))
              return true;
        break;
        
        case "any creature on board":
            if ((isCreature(target)) and (target.position == "board")) {
                return true;
              }
        break;
        
        case "allied creature on board":
            if ((isCreature(target)) and (target.position == "board") and target.owner == global.TURN)
              return true;
        break;
        
        case "enemy creature on board":
            if ((isCreature(target)) and (target.position == "board") and target.owner != global.TURN)
              return true;
        break;
    }
}
