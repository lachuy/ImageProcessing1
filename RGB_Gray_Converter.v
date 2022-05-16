module RGB_Gray_Converter#
  (parameter row = 1153, col = 2048)
  (input             clk,
   input        [7:0] data_red, data_green, data_blue,
   input signed [31:0]pixel,
   output reg   [7:0] data_filtered,
   output             done);

  reg [10:0]rgb_sum;
  
  always@(posedge clk)
  begin
    rgb_sum = 2*data_red + 5*data_green + data_blue;
    data_filtered = rgb_sum/8'd8;
  end
  
  assign done = (pixel >= row*col) ? 1 : 0;
endmodule

