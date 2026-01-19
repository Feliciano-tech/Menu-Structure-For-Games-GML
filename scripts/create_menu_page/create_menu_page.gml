function create_menu_page(){

    //------------------------------------------------------
    
    // arg       = array que irá conter todos os itens do menu (cada posição é uma opção)
    // arg[i]    = armazena o array passado como argumento na chamada da função
    
    var arg = [];
    
    for (var i = 0; i < argument_count; i++) {
    	arg[i] = argument[i];
        
    }
    //------------------------------------------------------
    
    // cols  = variável numérica que armazena a quantidade de colunas necessárias para a grid
    // max() = retorna o maior valor entre o valor atual de 'cols' e o tamanho do array da opção atual

    var cols = 0;
    
    for (var i = 0; i < argument_count; i++) {
    	cols = max(cols, array_length(arg[i]));
    }
    
    //------------------------------------------------------
    //evitar edge-cases
    cols = max(cols, 1);
    //------------------------------------------------------
     
    var ds_grid_id = ds_grid_create(cols,argument_count);
    
    //------------------------------------------------------
    
    // yy         = índice da linha (qual opção do menu)
    // xx         = índice da coluna (qual campo dentro da opção)
    // a          = o array da linha atual (ex: ["Menu", tipo, dado, ...])
    // len        = quantidade de itens dentro de 'a' (tamanho do array da opção atual)
    // ds_grid_id = ID/referência da ds_grid criada (é onde os dados ficam armazenados)
    
    for (var yy = 0; yy < argument_count; yy++) {              
    	var a = arg[yy];                                                
        var len = array_length(a);                            
        
        for (var xx = 0; xx < len; xx++) {
        	ds_grid_id[# xx,yy] = a[xx];
        }
    }
    
     //------------------------------------------------------
    
     // retorna a grid com os valores salvos
    return ds_grid_id;
}