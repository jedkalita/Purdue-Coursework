// Verilog for ECE337 Lab 1
// The Following code is used to compare 2 16-bit quantites, a and b. The code 
// determines whether or not:
// a is greater than b, gt = 1, lt = 0, eq = 0
// a is less than b, gt = 0, lt = 1, eq = 0
// a is equal to b, gt = 0, lt = 0, eq = 1

// Use a tab size of 2 spaces for best viewing results


module comparator
(
	input wire [15:0] a,
	input wire [15:0] b,
	output wire gt,
	output wire lt,
	output wire eq
);

	reg gte;
	reg lte;
	reg GT;
	reg LT;
	reg EQ;

	always @ (a, b) begin: COM
		if (! (a > b))
			lte <= 1'b1;
		if (!(b > a))
			gte = 1'b1;
		
		if (! (lte == 1'b1)) begin
			assign GT = 1'b1;
			assign LT = 1'b0;
			assign EQ = 1'b0;
		end else if (! (gte == 1)) begin
			assign GT = 1'b0;
			assign LT = 1'b1;
			assign EQ = 1'b0;
		end else begin
			assign GT = 1'b0;
			assign LT = 1'b0;
			assign EQ = 1'b1;
	end
	end
endmodule;