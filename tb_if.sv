interface tb_if (input clk); 
    logic [31:0] a = 0;
    logic [31:0] b = 0;
    logic resetn;
    //reset 
    task res();
	resetn <= 0;
 	repeat(2) @(posedge clk); 
	resetn <= 1;
    endtask
    
    
    task in(input logic [31:0] a_value, input logic [31:0] b_value);
        @(posedge clk);
        a <= a_value;
	b <= b_value;
    endtask
    
    
endinterface:tb_if