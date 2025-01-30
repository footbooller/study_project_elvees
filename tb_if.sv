interface tb_if (input wire clk); 

    logic resetn;
    //     DPI-начало 
    import "DPI-C" context task test();
    export "DPI-C" task seq_creator;
    export "DPI-C" task res;
    c_pkg::base_tr_gen local_base_tr_gen;//handle на базовый класс     
    
    task res();
	resetn <= 0;
 	repeat(1) @(posedge clk); 
	resetn <= 1;
    endtask
    
    task sv_test();
        test();    
    endtask
        
    task seq_creator(int a, int b);
        local_base_tr_gen.tr_gen(a, b);
    endtask
    

    
endinterface:tb_if
