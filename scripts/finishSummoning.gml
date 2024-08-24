///finishSummoning();

owner.mana -= castingCost;
ds_list_add(owner.cardsInPlay, id);

if (global.RULES_summoningSickness == true) {
    // if (ds_list_find_value(abilities, "haste" == -1)
    hasSummoningSickness = true;
}
