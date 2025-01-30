module fulladder(
  input wire [31:0] a,
  input wire [31:0] b,  
  input wire clk,
  input wire resetn,
  
  output wire [31:0] sum
);
  reg [31:0] b_1;
  reg [31:0] a_1;
  
  always@(posedge clk or negedge resetn) begin
    if (~resetn) begin
	a_1 <= 32'b0;
	b_1 <= 32'b0;
    end
    else begin	
        a_1 <= a;
        b_1 <= b;
    end
  end
  
//  assign sum = a_1 + (b_1 & 32'h5);
  assign sum = a_1 + b_1;
  
endmodule 