		.data
		DIM=4
		DIM_M =16
wVet1: 	.word 1, 2, 3, 4
wVet2: 	.word 5, 6, 7, 8
wMat: 	.space 64
sep: 	.ascii ";"
.text
.globl main
.ent main

main:
		la $t0, wMat # used to pass through matrix
		li $t4, 0 # counter of number of vet1 computed
		li $t7, 0 # number to add to the address from wich starts the first vector
		
outerLoop:
		lw $t1, wVet1($t7) # load the word at address = STARTING_CELL + NUMBER_OF_CELL_COMPUTED * 4
		li $t6, 0 # number to add to the address from wich starts the second vector
		li $t3, 0 # counter of number of vet2 computed

		innerLoop:
				lw $t2, wVet2($t6) # load the word at address = STARTING_CELL + NUMBER_OF_CELL_COMPUTED * 4
				mul $t5, $t1, $t2 # multplication of the value x1*yi
				sw $t5, ($t0) # store in the matrix
				addi $t0, 4 # update of matrix cell 
				addi $t3, 1 # update the value of column counter
				addi $t6, 4 # number to sum to the address of the vector to get the current number
				bne $t3, DIM, innerLoop # jump at inner loop if not computed all the y vector numbers

		addi $t7, 4
		addi $t4, 1 # update of the value of row counter
		bne $t4, DIM, outerLoop # jump at outer loop if not computed all the x vector numbers

		# simple print loop through the matrix
		li $t5, 0
printLoop:
		li $v0, 1
		lw $a0, wMat($t5)
		syscall
		addi $t5, 4
		li $v0, 4
		la $a0, sep
		syscall
		bne $t5, 64, printLoop

li $v0, 10
syscall
.end main