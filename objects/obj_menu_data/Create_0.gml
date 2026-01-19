//-----------------------------------------------------------
// Obtém largura e altura da view atual da câmera
global.view_width  = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);



//-----------------------------------------------------------
// Define teclas globais usadas no menu
global.key_enter  = vk_enter;
global.key_left   = vk_left;
global.key_right  = vk_right;
global.key_up     = vk_up;
global.key_down   = vk_down;


//-----------------------------------------------------------
//Enumeração das Paginas do Menu
//-----------------------------------------------------------

enum menu_page {
    main,        // 0  - Página principal
    newGame,     // 1  - Criar novo jogo
    settings,    // 2  - Configurações
    audio,       // 3  - Áudio
    difficulty,  // 4  - Dificuldade
    graphics,    // 5  - Gráficos
    controls,    // 6  - Controles
    exitGame,    // 7  - Fecha o jogo
    returnMenu,  // 8  - Retorna ao Menu Principal
    save,        // 9  - Salva o Progresso Atual
    load,        // 10 - Carrega o Ultimo Progresso Salvo
    height       // 11 - Contagem total (não é uma página real)
    
     
}

//-----------------------------------------------------------
//Enumeração dos Tipos de Elementos do Menu
//-----------------------------------------------------------

enum menu_element_type {
	script_runner, // Executa uma função/script
    page_transfer, // Troca de página
    slider,        // Barra deslizante (0 a 1, volume etc.)
    shift,         // Escolha múltipla (ex: dificuldade)
    toggle,        // Liga/desliga
    input          // Reatribuir tecla
}

//-----------------------------------------------------------
//Criação do Menu
//-----------------------------------------------------------

//Pagina Menu Principal
ds_menu_main = create_menu_page(
    
    ["NEW GAME"     , menu_element_type.script_runner  , start_newgame        ],
    ["LOAD GAME"    , menu_element_type.script_runner  , load_game            ],
    ["SETTINGS"     , menu_element_type.page_transfer  , menu_page.settings   ],
    ["EXIT"         , menu_element_type.script_runner  , exit_game            ]
    
);

//Pagina Menu de Pause
ds_resume_game = create_menu_page(
    
    ["RESUME"       , menu_element_type.script_runner  , resume_game          ],
    ["SAVE"         , menu_element_type.script_runner  , save_game            ],
    ["LOAD GAME"    , menu_element_type.script_runner  , load_game            ],
    ["SETTINGS"     , menu_element_type.page_transfer  , menu_page.settings   ],
    ["RETURN MENU"  , menu_element_type.page_transfer  , menu_page.returnMenu ],
    ["EXIT"         , menu_element_type.script_runner  , exit_game            ]
);

//Pagina de Configurações
ds_settings = create_menu_page(
    ["AUDIO"        , menu_element_type.page_transfer  , menu_page.audio      ],
    ["DIFFICULTY"   , menu_element_type.page_transfer  , menu_page.difficulty ],
    ["GRAPHICS"     , menu_element_type.page_transfer  , menu_page.graphics   ],
    ["CONTROLS"     , menu_element_type.page_transfer  , menu_page.controls   ],
    ["BACK"         , menu_element_type.page_transfer  , menu_page.main       ]
);




// Página de áudio
ds_menu_audio = create_menu_page(
    ["MASTER"       , menu_element_type.slider         , change_volume , 1, [0,1]],
    ["SOUNDS"       , menu_element_type.slider         , change_volume , 1, [0,1]],
    ["MUSIC"        , menu_element_type.slider         , change_volume , 1, [0,1]],
    ["BACK"         , menu_element_type.page_transfer  , menu_page.settings]	
);

// Página de dificuldade
ds_menu_difficulty = create_menu_page(
    ["ENEMIES"      , menu_element_type.shift, change_difficulty   , 0, ["EASY","NORMAL","HARD"] ],
    ["BACK"         , menu_element_type.page_transfer              ,         menu_page.settings  ]
);

// Página de gráficos
ds_menu_graphics = create_menu_page(
    ["RESOLUTION"   , menu_element_type.shift,  change_resolution  , 0, ["384 x 216","768 x 432","1152 x 648","1536 x 874","1920 x 1080"]],
    ["WINDOW MODE"  , menu_element_type.toggle, change_window_mode , 1, ["FULLSCREEN","WINDOWED"]],
    ["BACK"         , menu_element_type.page_transfer, menu_page.settings]
);

// Página de controles: reatribuição de teclas
ds_menu_controls = create_menu_page(
    ["UP"           , menu_element_type.input , "key_up"   ,  vk_up      ],
    ["LEFT"         , menu_element_type.input , "key_left" ,  vk_left    ],
    ["RIGHT"        , menu_element_type.input , "key_right",  vk_right   ],
    ["DOWN"         , menu_element_type.input , "key_down" ,  vk_down    ],
    ["BACK"         , menu_element_type.page_transfer, menu_page.settings]
);

// Página inicial do menu
page = 0


// Guarda todas as páginas em um array
menu_pages = [
    
    ds_menu_main,
    ds_resume_game,
    ds_settings,
    ds_menu_audio,
    ds_menu_difficulty,
    ds_menu_graphics,
    ds_menu_controls
];

/*
show_debug_message("-----------------------------------quantidade de paginas total-----------------------------------");

show_debug_message("menu_pages length = " + string(array_length(menu_pages)));

show_debug_message("------------------------------quantidade de colunas  e linhas em cada id------------------------------------");

for (var p = 0; p < array_length(menu_pages); p++) {
    var g = menu_pages[p];
    show_debug_message("PAGE " + string(p)
        + " id=" + string(g)
        + " cols=" + string(ds_grid_width(g))
        + " rows=" + string(ds_grid_height(g)));
     }

show_debug_message("-----------------------Verifica o conteudo de uma pagina-----------------------------------");
var g = ds_menu_main;

for (var yy = 0; yy < ds_grid_height(g); yy++) {
    var line = "";
    for (var xx = 0; xx < ds_grid_width(g); xx++) {
        line += "[" + string(g[# xx, yy]) + "] ";
    }
    show_debug_message("row " + string(yy) + ": " + line);
}

show_debug_message("------------------------------------------------------------------------");

valor = grid_id[# 0, 0];

show_debug_message("tabela" + valor);

show_debug_message("------------------------------------------------------------------------");

*/

