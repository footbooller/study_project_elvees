module tb();

    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import fulladder_test_pkg::*;   
    //подключение тестируемого компонента
    logic clk;
            
    tb_if intf(clk);
    fulladder_agent_if agent_if(clk);
    
    assign agent_if.resetn = intf.resetn;
    
    fulladder DUT(
    .a(agent_if.a),
    .b(agent_if.b),
    .sum(agent_if.sum),
    .clk(clk),
    .resetn(intf.resetn)
    );  
    initial begin 
        uvm_config_db #(virtual tb_if)::set(null,"uvm_test_top", "intf", intf);
        uvm_config_db #(virtual fulladder_agent_if)::set(null,"uvm_test_top", "agent_if", agent_if);
        run_test();
    end  
    //генерация clk 
    localparam clk_period = 10;
    initial begin 
	clk <= 0;
	forever begin 
	    #(clk_period);
	    clk = ~clk;
	end
	
    end

endmodule