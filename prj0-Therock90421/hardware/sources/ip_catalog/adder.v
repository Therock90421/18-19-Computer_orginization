`timescale 1ns / 1ps

module adder(
    input [7:0] operand0,
    input [7:0] operand1,
    output [7:0] result
    );

	/*TODO: Add your logic code here*/
    assign result = operand0+operand1;

endmodule
