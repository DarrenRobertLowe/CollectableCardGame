/// drawZoomedCard();

draw_text(nameX, nameY, name);
var scale = 1;
var offsetY = -500;

// casting cost
draw_set_halign(fa_center);
draw_sprite_ext(spr_cost_circle, 0, castCircleX, castCircleY + offsetY, scale, scale, 0, c_white, 1);
draw_sprite_ext(spr_card_castingCost_numbers, castingCost, castingCostX, castingCostY + offsetY, scale, scale, 0, c_white, 1);
draw_set_halign(fa_left);


// art
draw_sprite_ext(image, image_index, artX, artY + offsetY, scale, scale, 0, c_white, 1);


// class text
switch (position) {
    case "hand":
    case "graveyard":
        draw_set_font(global.font_CardText_Hand);
    break;
    
    case "board":
        draw_set_font(global.font_CardText_Board);
    break;
}
draw_text(classX, classY + offsetY, class);


// abilities text
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


// description text
switch (position) {
    case "hand":
    case "graveyard":
        draw_set_font(global.font_CardText_Hand);
    break;
    
    case "board":
        draw_set_font(global.font_CardText_Board);
    break;
}

draw_text_ext(descriptionX, descriptionY + offsetY, str + string(description), separation, descriptionWidth);
