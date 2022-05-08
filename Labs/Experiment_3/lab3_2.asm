.globl main
.data
N: .word 0x5
value: .word 0x50, 0x45, 0x32, 0x21, 0x11
.text
main: 
	lw s0, N		
	
	addi t4, zero, 1	
	loop_1:
	addi t0, zero, 1 	
	la t1, value	
		loop_2: 
		lw t2, 0(t1) 	
		lw t3, 4(t1)   			
		blt t2, t3, noSwap		
		sw t3, 0(t1) 
		sw t2, 4(t1) 	
		noSwap:
		addi t0, t0, 1
		addi t1, t1, 4 	
		bne t0, s0, loop_2	
		
	addi t4, t4, 1
	bne t4, s0, loop_1 
	
		