module dataMemory (
  input wire clk,    // Clock
  input wire rst_n,  // reset

  input wire [31:0] addr,
  input wire [31:0] writeData,
  output wire [31:0] readData,

  input wire memWrite,
  input wire memRead
);

reg [7:0] dataMem [(2^32)-1:0];
integer i;

always@(posedge clk, posedge rst_n)
  begin
    if(rst_n)
      dataMem[i] <= 8'b0;
    else 
      begin 
        if(memWrite)
          begin
            dataMem[addr] <= writeData[7:0]; 
            dataMem[addr+1] <= writeData[15:8];
            dataMem[addr+2] <= writeData[23:16];
            dataMem[addr+3] <= writeData[31:24];
          end 
      end 
  end 

assign readData = (memRead)? {dataMem[addr+3], dataMem[addr+2], dataMem[addr+1], dataMem[addr+0]} : 32'bx;

endmodule