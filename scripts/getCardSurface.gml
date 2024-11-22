/// getCardSurface()
show_debug_message("running getCardSurface()");
var cardSurface = surface_create(sprite_get_width(spr_card), sprite_get_height(spr_card));

if (surface_exists(cardSurface)) {
    surface_set_target(cardSurface);
    draw_clear_alpha(c_white, 0);
    draw_set_halign(fa_left);
    draw_set_colour(c_black);
    
    // background
    draw_sprite(sprite_index, 1, 0, 0);
    
    // name
    draw_set_font(titleFont);
    draw_text(nameX, nameY, name);
    
    // casting cost
    draw_set_font(costFont);
    draw_set_halign(fa_center);
    draw_sprite(spr_cost_circle, 0, castCircleX, castCircleY);
    
    if (object_is_ancestor(id.object_index, CREATURE_CARD)) {
        draw_sprite(spr_card_castingCost_numbers, creatureResourceCost, castingCostX, castingCostY);
    }
    
    if (object_is_ancestor(id.object_index, ENCHANTMENT_CARD)) {
        draw_sprite(spr_card_castingCost_numbers, enchantResourceCost, castingCostX, castingCostY);
    }
    
    if (object_is_ancestor(id.object_index, SPELL_CARD)) {
        draw_sprite(spr_card_castingCost_numbers, spellResourceCost, castingCostX, castingCostY);
    }
        
    if (object_is_ancestor(id.object_index, RESOURCE_CARD)) {
        draw_sprite(spr_card_castingCost_numbers, castingCost, castingCostX, castingCostY);
    }
    
    draw_set_halign(fa_left);
    
    // art
    draw_sprite(image, image_index, artX, artY);
    
    // class text
    draw_set_font(classFont);
    draw_text(classX, classY, class);
    
    // abilities text
    draw_set_font(abilitiesFont);
    var str = "";
    for(var i=0; i<ds_list_size(abilities); i++) {
        var ability = ds_list_find_value(abilities, i);
        if !(is_undefined(ability)) {
            str += string(ability) + ", ";
        } else break;
    }
    // replace the last ", " with "."
    if (str != "") {
        str = string_copy(str, 1, string_length(str)-2);
        str += ".#"; // "." and newline
    }
    // description
    draw_set_font(descriptionFont);
    draw_text_ext(descriptionX, descriptionY, str + string(description), lineHeight, descriptionWidth);
    
    
    if (type = CREATURE_CARD) {
        // stat icons
        draw_sprite(spr_stat_icons, 0, attackIconX, attackIconY);
        draw_sprite(spr_stat_icons, 1, defenceIconX, defenceIconY);
        draw_sprite(spr_stat_icons, 2, hpIconX, hpIconY);
        
        // attack and hp(defence)
        draw_set_font(statsFont);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_set_color(c_black);
        
        // attack
        if (attack < baseAttack) then draw_set_color(c_orange);
        if (attack > baseAttack) then draw_set_color(c_green);
        draw_text(attackX,  attackY,  attack);
        
        // defence
        if (defence < baseDefence) then draw_set_color(c_orange);
        if (defence > baseDefence) then draw_set_color(c_green);
        draw_text(defenceX, defenceY, defence);
        
        // health
        if (hp < baseHp) then draw_set_color(c_red);
        draw_text(hpX, hpY, hp);
        
        // reset text
        draw_set_color(c_black);
        draw_set_halign(fa_left);
    }
    
    surfaceDrawn = true;
    surface_reset_target();
    
    // finish by creating the final sprite that will be used in the game
    cardSurfaceSprite = sprite_create_from_surface(cardSurface, 0, 0, sprite_get_width(spr_card), sprite_get_height(spr_card), false, false, 0, 0);
    
    // clean up
    if (surface_exists(cardSurface)) {
        surface_free(cardSurface);
    }
} // end of surface



