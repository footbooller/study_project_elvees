module tb();
    
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import fulladder_test_pkg::*;
    logic clk;
    wire [31:0] sum;
    
    //подключение тестируемого компонента
    tb_if intf(clk);
    
    fulladder DUT(
    .a(intf.a),
    .b(intf.b),
    .sum(sum),
    .clk(clk),
    .resetn(intf.resetn)
    );
       
       
initial begin 
    uvm_config_db #(virtual tb_if)::set(null,"uvm_test_top", "intf", intf);
    run_test();
end       
    
    
   
    
    int s = 0;
    localparam clk_period = 10;
    //генерация clk 
    initial begin 
	clk <= 0;
	
	forever begin 
	    #(clk_period);
	    clk = ~clk;
	end
    end
    
    
    
    
/*    
    task test_1();
        intf.res();
        
	for(int i = 0; i < 5; i = i + 1) begin
	    intf.in(i, i+1);
	end
    endtask*/
    
    
    
    //генерация входных сигналов
    
    task check(input logic [31:0] a, input logic [31:0] b);
 	@(posedge  clk);
	$display("check %t", $time());
	    if (sum !== a + b) begin
		$error("bad");$display("false\n");
		$finish();
	    end
	    else begin
		$display("true\n");
		s = s + 1;
	end
    endtask
    
//     initial begin 
// 	test_1();
// 	repeat(3) @(posedge clk);
// 	$finish();
//     end
    
    initial begin
	wait(intf.resetn === 1);
  	@(posedge clk);
	forever begin
	    check(intf.a, intf.b);
	end
	
    end
endmodule