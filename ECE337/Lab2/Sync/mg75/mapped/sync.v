
module sync ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   d;

  DFFSR d_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(d) );
  DFFSR sync_out_reg ( .D(d), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule

