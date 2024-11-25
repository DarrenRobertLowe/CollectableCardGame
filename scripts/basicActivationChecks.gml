/// basicActivationChecks();

if  (owner.creatureResources >= creatureResourceCost)
and (owner.spellResources    >= spellResourceCost)
and (owner.enchantResources  >= enchantResourceCost) {
    return true;
} else {
    debug("Not enough mana in pool to cast, checking resource lane...");
    
    if (canAffordCasting(id)) {
        autoTapResources(global.TURN, id);
        
        if  (owner.creatureResources >= creatureResourceCost)
        and (owner.spellResources    >= spellResourceCost)
        and (owner.enchantResources  >= enchantResourceCost) {
            return true;
        }
    }
    // we could play a sound or have the text appear to the user somehow.
}
