`timescale 100ns/1ns
module RGB_Gray_Converter_tb;
  
  parameter row = 1153, col = 2048;
  integer   file;
  
  reg       clk, start, write;
  reg [7:0] mem[row*col*3-1:0];
  reg [31:0]pixel;
  
  wire [7:0]data_filtered;
  wire      done;

  initial 
  begin
    $readmemh("pic_bmp.txt",mem);
    file = $fopen("pic_gray.txt","w");
  end

  initial
  begin
    clk   = 0;
    pixel = 0;
    start = 0;
    write = 0;
    #0.4 start  = ~start;
    #0.25 write = ~write;
  end
  
  always
  begin 
    #0.2 clk = ~clk;
  end
  
  always@(posedge clk)
  begin
    if (start)
    begin
      pixel = pixel+1;
    end
    
    if (write)
    begin
      $fwrite(file, "%x\n", data_filtered);
    end
    
    if (done)
    begin
      $fclose(file);
      write = 0;
    end
  end
  
  
  
  RGB_Gray_Converter c( .clk, .pixel,
                        .data_red(mem[pixel]), 
                        .data_green(mem[pixel + row*col]), 
                        .data_blue(mem[pixel + row*col*2]),
                        .data_filtered, .done);
endmodule

