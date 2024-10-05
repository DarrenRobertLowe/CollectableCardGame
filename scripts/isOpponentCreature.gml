// isOpponentCreature(card)

var card = argument0;

if (exists(card)) {
    if (card.type == CREATURE_CARD) {
        if (card.owner != global.TURN) {
            return true;
        }
    }
}
