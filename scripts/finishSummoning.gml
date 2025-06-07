///finishSummoning();
if (!freeCast) {
    owner.creatureResources -= creatureResourceCost;
    owner.spellResources    -= spellResourceCost;
    owner.enchantResources  -= enchantResourceCost;
}

summoned = true;
global.allowCancelCasting = true;
global.summoning = false;


/// clear phase blocker
var ind = ds_list_find_index(global.NEXT_PHASE_BLOCKERS, id);
if (ind > -1) {
    ds_list_delete(global.NEXT_PHASE_BLOCKERS, ind);
}
