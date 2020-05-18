		.data
		COL=10
		DIM=4 * 100
tavola:	.space DIM
sep: 	.ascii ";"

.text
.globl main
.ent main

main:
		la $t0, tavola
		li $t1, 1 # number to sum to each column (at first line'll be 1, at the second one will be 2, ...)
		li $t2, 0 # number to add to the address of the matrix and also counter

outerLoop:
		li $t3, 0 # reset of the accumulator
		li $t4, 0 # counter of column
		innerLoop:
				add $t3, $t3, $t1 # add to the accumulator
				sw $t3, tavola($t2) # store the value in the tab
				addi $t2, 4 # update of address of matrix
				addi $t4, 1 # update of counter of col computed
				bne $t4, COL, innerLoop
		addi $t1, 1
		bne $t2, DIM, outerLoop


		# simple print loop through the matrix
		li $t5, 0
printLoop:
		li $v0, 1
		lw $a0, tavola($t5)
		syscall
		addi $t5, 4
		div $a0, 10
		li $v0, 4
		la $a0, sep
		syscall
		bne $t5, DIM, printLoop


li $v0, 10
syscall
.end main	