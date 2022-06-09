`timescale 10ns/1ns

module testBench;

reg clk;
reg rst_n;

CPU dut (.clk(clk), .rst_n(rst_n));

initial 
  begin
    clk = 0;
    rst_n = 1;
    #1
    rst_n = 0;
  end

always
    #5 clk = ~clk;

initial
    begin
        $dumpfile("cpuOut.vcd");
        $dumpvars(0, testBench);
    end

endmodule