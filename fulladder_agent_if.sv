interface fulladder_agent_if (input wire clk); 

    logic [31:0] a = 0;
    logic [31:0] b = 0;
    wire [31:0] sum;
    wire resetn;
    
    task in(input logic [31:0] a_value, input logic [31:0] b_value);
        @(posedge clk);
        a <= a_value;
	    b <= b_value;
    endtask
        
endinterface:fulladder_agent_if
