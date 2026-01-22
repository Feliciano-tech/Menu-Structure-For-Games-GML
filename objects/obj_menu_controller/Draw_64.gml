/* draw_set_font(fnt_consolas);
var xx = room_width/2;
var yy = room_height/3;
var spacing = 36;
var yellow = c_yellow;
var white = c_white;

for (var r = 0; r < ds_grid_height(page_grid); r++) {
    var txt = string(page_grid[# 0, r]);
    if (r == selected){
        draw_set_colour(yellow);
       
        txt = "> " + txt;
        
    }else {
    	draw_set_colour(white);
    }
    
     
    draw_text(xx, yy + r * spacing, txt);
}
*/


// Define a fonte usada no menu
draw_set_font(fnt_consolas);

// Alinhamento do texto
// Centro horizontal e vertical
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Posição base do menu na tela
var xx = room_width / 2;   // centro da tela
var yy = room_height / 3;  // um pouco acima do centro

// Espaçamento vertical entre os itens
var spacing = 36;



// pulso do selecionado (tempo)
var pulse = sel_scale_base + sin(current_time / 150) * sel_scale_pulse;

// Calcula o pulso do zoom baseado no tempo
// sin cria o efeito de "respiração"
var pulse = sel_scale_base + sin(current_time / 150) * sel_scale_pulse;

for (var r = 0; r < ds_grid_height(page_grid); r++) {
    
    // Texto do item atual
    var txt = string(page_grid[# 0, r]);

    // Posição Y deste item
    var y2 = yy + r * spacing;

    // Distância do item atual até o índice visual
    // Quanto menor, mais "em foco"
    var d = abs(r - sel_vis);

    // Converte a distância em foco
    // 1 = totalmente selecionado
    // 0 = longe do selecionado
    var focus = clamp(1 - d, 0, 1);

     // Mistura as cores baseado no foco
    // 0 = branco | 1 = amarelo
    var col = merge_color(c_white, c_yellow, focus);
    draw_set_color(col);

    // Escala do texto
    // Itens normais = 1
    // Selecionado = zoom + pulso
    var sc = lerp(1.0, pulse, focus);

    // Adiciona "> " somente no item realmente selecionado
    //var show_txt = (r == selected) ? ("> " + txt) : txt;
    var show_txt = (r == selected) ? (txt) : txt;

      // Se o item estiver em foco, desenha um highlight atrás
    if (focus > 0) {
        draw_set_alpha(0.22 * focus); // transparência suave
        draw_set_color(c_white);

        draw_rectangle(
            xx - 220,                 // esquerda
            y2 - (menu_item_h / 2),    // topo
            xx + 220,                 // direita
            y2 + (menu_item_h / 2),    // base
            false                     // sem preenchimento (contorno)
        );

        // Restaura alpha e cor
        draw_set_alpha(1);
        draw_set_color(col);
    }

        // Desenha o texto com escala (zoom)
    draw_text_transformed(
        xx,
        y2,
        show_txt,
        sc,  // escala X
        sc,  // escala Y
        0    // rotação
    );
}


// reset (boa prática)
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);