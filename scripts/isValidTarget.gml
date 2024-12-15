///isValidTarget(card)
var target = argument0;

if !(exists(global.currentCard)) { 
    log("Error in isValidTarget(): global.currentCard does not exist!");
    exit;
}

//show_debug_message("global.currentCard: " + string(global.currentCard));

var validTargets = global.currentCard.validTargets;
var size = ds_list_size(validTargets);
//show_debug_message("global.currentCard.validTargets size is : " + string(size) );


for(var i=0; i<size; i++) {
    var value = ds_list_find_value(validTargets, i);
    //show_debug_message("validTarget is: " +string(value));
    switch(value) {
        case "contestant":
            if (isContestant(target))
              return true;
        break;
        
        case "any creature on board":
            //show_debug_message('Checking for "any creature on board"');
            if ((isCreature(target)) and (target.position == "board")) {
                //show_debug_message("This is a creature on board and therefore passes.");
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

//show_debug_message(string(id) + ": not a valid target");
