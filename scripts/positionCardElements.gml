/// positionCardElements()
castCircleX = x + (base_castCircleX * scale);
castCircleY = y + (base_castCircleY * scale);
castingCostX = x + (base_castingCostX * scale);
castingCostY = y + (base_castingCostY * scale);

nameX = x + (base_nameX * scale);
nameY = y + (base_nameY * scale);

classX = x + (base_classX * scale);
classY = y + (base_classY * scale);

artX = x + (base_artX * scale);
artY = y + (base_artY * scale);

descriptionX = x + (base_descriptionX * scale);
descriptionY = y + (base_descriptionY * scale);
separation = (base_separation * scale);
descriptionWidth = (base_descriptionWidth * scale);


if (type = CREATURE_CARD) {
    // position attack/defence
    attackX  = x + (base_attackX * scale);
    attackY  = y + (base_statValuesY * scale);
    defenceX = x + (base_defenceX * scale);
    defenceY = y + (base_statValuesY * scale);
    hpX      = x + (base_hpX * scale);
    hpY      = y + (base_statValuesY * scale);
    
    // position stat icons
    attackIconX  = x + (base_attackIconX * scale);
    attackIconY  = y + (base_iconY * scale);
    
    defenceIconX  = x + (base_defenceIconX * scale);
    defenceIconY  = y + (base_iconY * scale);
    
    hpIconX     = x + (base_hpIconX * scale);
    hpIconY     = y + (base_iconY * scale);
}
