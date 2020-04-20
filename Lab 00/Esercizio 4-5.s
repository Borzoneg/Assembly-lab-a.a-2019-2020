			.data
			DIM = 4	# DIM is a constant
wVett:		.word 5, 7, 3, 4 # declaration and initialization of a vector
wResult: 	.space 4


.text
.globl main
.ent main

main:
		la $t0, wVett	# load the address of the first item in the vector in t0
		li $t1, 0		# set to zero the accumulator(t1) and the index(t3)
		li $t3, 0
		cicle:
				lw $t2, ($t0)		# load the word at address t0 in t2
				add $t1, $t1, $t2 	# add t2 to t1
				addi $t0, 0x04		# add 4 to the address to point to the next cell
				addi $t3, 1			# add 1 to the counter 
				bne $t3, DIM, cicle	# check if we cycled through the whole vector
		sw $t1, wResult # store the content of t1 in wResult
		lw $t4, wResult

li $v0, 10
syscall
.end main