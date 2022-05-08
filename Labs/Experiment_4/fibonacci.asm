.globl main 
.data
N: 10
numbers: .word 0:9 
.text
main: 
	lw s0, N		
	la t0, numbers 
	
	addi t1, zero, 0 
	sw t1, 0(t0)
	addi t2, zero, 1
	sw t2, 4(t0)
	
	addi t0, t0, 8
	addi t4, zero, 2
	sub s0, s0, t4
	addi t4, zero, 1
	
	loop: 
		add t3, t2, t1
		addi t1, t2, 0
		addi t2, t3, 0
		sw t3, 0(t0)
		addi t0, t0, 4
		sub s0, s0, t4
		bne s0, zero, loop
		ecall 

		
		
		
		
	