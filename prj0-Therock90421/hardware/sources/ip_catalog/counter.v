`timescale 1ns / 1ps

`define STATE_RESET 8'd0
`define STATE_RUN 8'd1
`define STATE_HALT 8'd2

module counter(
    input clk,
    input [31:0] interval,
    input [7:0] state,
    output reg [31:0] counter
	);

	/*TODO: Add your logic code here*/
reg [31:0] temp;
	always@(posedge clk)
	begin
	if (state ==8'd0)
	begin
	counter<=32'd0;
	temp<=32'd0;
	end
	if(state ==8'd1)
	begin
	  temp = temp+1;
	  if(interval<= temp)
	    begin 
	      temp<=32'd0;
	      counter = counter + 1;
	    end
	  end
    end
    
endmodule
