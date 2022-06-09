module EX_MEM_stage (
  input wire clk,    // Clock
  input wire rst_n,  // Reset
  input wire flush,

  input wire [31:0] exPc, 
  input wire [31:0] exAluRes, exRegData2,
  input wire [4:0] exRd,
  input wire [9:0] exCtrlSig,

  output reg [31:0] memPc,
  output reg [31:0] memAluRes, memRegData2, 
  output reg [4:0] memRd,
  output reg [9:0] memCtrlSig
);
  
always @(posedge clk, posedge rst_n)
  begin 
    if(rst_n || flush)
      begin 
        memPc <= 32'b0;
        memAluRes <= 32'b0;
        memRegData2 <= 32'b0;
        memRd <= 5'b0;
        memCtrlSig <= 9'b0;
      end 
    else 
      begin 
        memPc <= exPc;
        memAluRes <= exAluRes;
        memRegData2 <= exRegData2;
        memRd <= exRd;
        memCtrlSig <= exCtrlSig;
      end 
  end 
endmodule