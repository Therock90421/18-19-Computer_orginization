`timescale 10ns / 1ns

`define DATA_WIDTH 32

module alu_test
();

	reg [`DATA_WIDTH - 1:0] A;
	reg [`DATA_WIDTH - 1:0] B;
	reg [2:0] ALUop;
	wire Overflow;
	wire CarryOut;
	wire Zero;
	wire [`DATA_WIDTH - 1:0] Result;

	initial
	begin
		A = 32'h80000001;
		B = 32'h00000001;
		ALUop = 3'b110;
	end
	alu u_alu(
		.A(A),
		.B(B),
		.ALUop(ALUop),
		.Overflow(Overflow),
		.CarryOut(CarryOut),
		.Zero(Zero),
		.Result(Result)
	);

endmodule

