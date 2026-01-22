current_page = global.menu_start_page;
page_grid = global.page_map[current_page];
selected = 0;

// stack de histórico (array + topo)
page_stack = [];

function menu_goto(_page) {
    array_push(page_stack, current_page); // guarda a atual
    current_page = _page;
    page_grid = global.page_map[current_page];
    selected = 0;
}

function menu_back() {
    if (array_length(page_stack) > 0) {
        current_page = array_pop(page_stack);
        page_grid = global.page_map[current_page];
        selected = 0;
    }
}

function menu_open(_page) {
    page_stack = [];            // limpa histórico
    current_page = _page;
    page_grid = global.page_map[current_page];
    selected = 0;
}


menu_open(global.menu_start_page);



// teste


// Índice visual do menu

// Ele NÃO muda instantaneamente, anima até o "selected"
sel_vis = selected;

// Velocidade da animação de transição
// Quanto MAIOR, mais rápida a animação
// Valores bons: 0.1 (bem suave) até 0.3 (mais rápido)
sel_speed = 0.18;

// Escala base do item selecionado
// 1.0 = tamanho normal
sel_scale_base = 1.15;

// Intensidade do efeito de pulsar
// Quanto maior, mais perceptível o "respirar"
sel_scale_pulse = 0.06;

// Altura visual de cada item do menu
// Usado para centralizar o destaque (highlight)
menu_item_h = 36;