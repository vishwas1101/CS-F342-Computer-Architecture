// program counter 

module programCounter (
  
  input wire clk,    // Clock
  input wire clk_en, // Clock Enable
  input wire rst_n,  // Reset

  input wire [31:0] programCounterIn,
  output reg [31:0] programCounterOut
);

always @(posedge clk, posedge rst_n) 
  begin
    if(rst_n)
        programCounterOut <= 0;
    else if(clk_en)
        programCounterOut <= programCounterIn;
  end

endmodule