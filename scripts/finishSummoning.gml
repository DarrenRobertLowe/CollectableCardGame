///finishSummoning();

owner.creatureResources -= castingCost;

if (global.RULES_summoningSickness) {
    if (ds_list_find_value(abilities, "haste") == -1) {
        hasSummoningSickness = true;
    }
}
