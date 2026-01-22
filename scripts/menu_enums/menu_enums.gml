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
    pause,       // 7  - Pausa o jogo
    height       // 8 - Contagem total (não é uma página real)
    
     
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
    input,          // Reatribuir tecla
    back
}

//-----------------------------------------------------------