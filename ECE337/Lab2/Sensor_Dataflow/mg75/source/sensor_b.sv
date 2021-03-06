// $Id: $
// File name:   sensor_b.sv
// Created:     9/3/2014
// Author:      Pranjit Kumar Kalita
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: behavioral.
module sensor_b(
  input wire [3:0] sensors,
  output reg error
  );
  
  always @ (sensors[0], sensors[1], sensors[2], sensors[3]) begin
    error = 1'b0;
    if (sensors[0] == 1)
      error = 1'b1;
    if ((sensors[2] == 1) & (sensors[1] == 1))
      error = 1'b1;
    if ((sensors[1] == 1) & (sensors[3] == 1))
      error = 1'b1;
  end
endmodule
