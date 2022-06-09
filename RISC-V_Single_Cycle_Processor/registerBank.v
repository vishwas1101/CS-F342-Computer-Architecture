// The register file with 2 register reads and one write

module registerBank (

  input wire clk,    // Clock
  input wire rst_n,  // Reset

  // Read register inputs 
  input wire [4:0] readReg1, 
  input wire [4:0] readReg2,

  // Read data outputs 
  output reg [31:0] readData1,
  output reg [31:0] readData2,

  // Write register inputs
  input wire [4:0] writeReg,
  input wire regWrite,

  // Write Data 
  input wire [31:0] writeData
);

reg [31:0] Reg [31:0]; //An array of 32 32bit values
integer i;

always @(posedge clk, posedge rst_n)
  begin
    if(rst_n)
      begin
        for(i = 0; i < 32; i = i + 1)
          Reg[i] <= i;
      end
    else 
      begin 
        if(regWrite)
          Reg[writeReg] <= writeData;
      end 
  end 

always @(*)
  begin 
    readData1 = Reg[readReg1];
    readData2 = Reg[readReg2];
  end 

endmodule