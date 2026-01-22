// Faz o índice visual (sel_vis) se aproximar do índice real (selected)
// lerp = interpolação linear
// Exemplo: lerp(0, 5, 0.2) vai chegar aos poucos em 5
sel_vis = lerp(sel_vis, selected, sel_speed);

// Se a diferença for muito pequena,
// "gruda" no valor final para evitar micro tremidas
if (abs(sel_vis - selected) < 0.001) {
    sel_vis = selected;
}




var rows = ds_grid_height(page_grid);

if (keyboard_check_pressed(global.key_down)) {
    selected = (selected + 1) mod rows;
}

if (keyboard_check_pressed(global.key_up)) {
    selected = (selected - 1 + rows) mod rows;
}



if (keyboard_check_pressed(global.key_enter)) {
    var type = page_grid[# 1, selected];
    var data = page_grid[# 2, selected];

    switch (type) {
        case menu_element_type.page_transfer:
            menu_goto(data);
            break;

        case menu_element_type.back:
            menu_back();
            break;

        case menu_element_type.script_runner:
            data();
            break;
    }
}

if (keyboard_check_pressed(vk_escape)) {
    if (array_length(page_stack) > 0) menu_back();
    else {
        // aqui você decide:
        // fechar menu / ignorar / sair do jogo
    }
}
 
