// 337 TA Provided Lab 2 8-bit adder wrapper file template
// This code serves as a template for the 8-bit adder design wrapper file 
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files
`timescale 1ns / 100ps
module adder_1bit
(
	input a,
	input b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);

assign sum = carry_in ^ (a ^ b);
assign carry_out = ((~carry_in) & b & a) | (carry_in & (b | a));
always @ (a, b, carry_in)
begin
  #(2) assert((a == 1'b1) || (a == 1'b0) || (b == 1'b1) || (b == 1'b0))
        $info("Input of a or b is not a digital logic value.");
     else
       $error("Input of a or b is a digital logic value.");
end
	
endmodule
