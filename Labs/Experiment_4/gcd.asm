.globl main
.data
a: .word 98
b: .word 56
gcd: .word 0
.text 
main: 
	lw t0, a
	lw t1, b 		# Store values of the numbers
	la t2, gcd		# Store address of final answer
	gcdLoop: 
		bne t0, zero, aIsNotZero	# Check if a is not zero 
		sw t1, 0(t2) 			# Answer is b, if a is zero
		jal ra, end
		aIsNotZero:			
		bne t1, zero, bIsNotZero	# Check if b is not zero
		sw t0, 0(t2)			# Answer is a, if b is zero
		jal ra, end
		bIsNotZero: 			
		bne t0, t1, notEqual		# Check if a==b 
		sw t0, 0(t2)			# Answer is a, if a==b is zero
		jal ra, end  
		notEqual: 
		blt t0, t1, aLessThanb		# Check if a>b or a<b
		sub t0, t0, t1			# return to gcdLoop if (a, b-a) or with (a-b, b) depending on the above condition
		jal ra, gcdLoop
		aLessThanb:
		sub t1, t1, t0
		jal ra, gcdLoop
	end: 
		ecall