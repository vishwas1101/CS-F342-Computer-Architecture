.globl main
.data

N: .word 0x0a
value: .word 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70, 0x80, 0x90, 0xa0

.text

main: 
	lw s0, N		# get the value of N
	
	addi t0, zero, 0 	# stores the loop counter
	la t1, value
	repeat: 
		lw t2, 0(t1) 	# has the array element
		addi t2, t2, 5	# add constant 5
		sw t2, 0(t1)
		addi t1, t1, 4	# go to next addr of array
		addi t0, t0, 1  # go to next value of N 
		bne t0, s0, repeat # branch		