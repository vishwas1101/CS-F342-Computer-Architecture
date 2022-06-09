module MEM_WB_stage (
  input clk,    // Clock
  input rst_n,  // Reset 

  input wire [31:0] memAluRes, memMemValue,
  input wire [9:0] memCtrlSig, 
  input wire [4:0] memRd, 

  output reg [31:0] wbAluRes, wbMemValue, 
  output reg [9:0] wbCtrlSig,
  output reg [4:0] wbRd
);

always @(posedge clk, posedge rst_n)
  begin 
    if(rst_n)
      begin 
        wbAluRes <= 32'b0;
        wbMemValue <= 32'b0;
        wbCtrlSig <= 9'b0;
        wbRd <= 5'b0;
      end 
    else 
      begin 
        wbAluRes <= memAluRes;
        wbMemValue <= memMemValue;
        wbCtrlSig <= memCtrlSig;
        wbRd <= memRd;
      end 
  end 
endmodule
