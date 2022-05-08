.globl main
.data

value: .word 0x10, 0x20, 0

.text

main: 
	la t0, value
	lw t1, 0(t0)
	lw t2, 4(t0)
	add t3, t2, t1
	sw t3, 8(t0)
	
	ecall