# RISC-V-Single-Cycle-Processor

This repository contains the verilog files for a single cycle processor based on the RISC-V RV32I instruction set. The instructions implemented are AND, OR, ADD, SUB, BEQ, SW, LW. The intruction type (R, S, B, or I) and the 32 bit format can be seen in the RISC-V instruction set manual found (here.)[https://riscv.org/wp-content/uploads/2019/06/riscv-spec.pdf]

## Usage 

Install icarus verilog and GTKwave. 
Clone the git repo and implement the following commands in the terminal.

```bash
$ iverilog my_design testBench.v CPU.v
$ vvp my_design
```
Open `cpuOut.vcd` dump file in GTKwave. Drag and drop the signals which need to be analysed. 

## Architecture 

![](https://github.com/vishwas1101/RISC-V-Single-Cycle-Processor/raw/main/Architecture.jpg)