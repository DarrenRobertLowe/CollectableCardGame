///prioritiseCardsByAttack(list of cards)
show_debug_message("running prioritiseCardsByAttack");

var cards = argument0;

var targetQueue = ds_priority_create();
for(var i=0; i<ds_list_size(cards); i++) {              // prioritise the target
    var card = ds_list_find_value(cards, i);       
    ds_priority_add(targetQueue, card, card.attack);    // should be prioritised based on an "threat factor" of some sort
}

// convert the targetQueue to a list
var targetList = ds_list_create();
while(ds_priority_size(targetQueue) > 0) {
    var card = ds_priority_delete_max(targetQueue);
    ds_list_add(targetList, card);
    show_debug_message(card);
}

show_debug_message("finished prioritiseCardsByAttack()");
return targetList;
