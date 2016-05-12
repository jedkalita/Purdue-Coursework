module sda_sel
  (
    input wire tx_out,
    input wire [1:0] sda_mode,
    output reg sda_out
    );
    always_comb begin
      if (sda_mode == 2'b00)
        sda_out = 1'b1;//IDLE
      else if (sda_mode == 2'b01)
        sda_out = 1'b0;//ACK
      else if (sda_mode == 2'b10)
        sda_out = 1'b1;//NACK
      else
        sda_out = tx_out;
    end
  endmodule
    
        
      