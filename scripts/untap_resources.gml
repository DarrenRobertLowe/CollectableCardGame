///untap_resources(contestant);

var contestant = argument0;

var cards = contestant.resourceLane.cards;

for (var i=0; i<ds_list_size(cards); i++){
    var card = ds_list_find_value(cards, i);
    
    with(card) {
        event_user(2); // untap
    }
}
