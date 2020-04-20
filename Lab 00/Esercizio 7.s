			.data
			DIM=5
wVett: 		.space 20
wMin:		.word 0xFFFFFFFF
strInput:	.asciiz "Inserire numeri\n"
separator: 	.ascii ";" 

.text
.globl main
.ent main

main:
		la $t0, wVett # address of the vector's cells
		li $t1, 0 # counter
		li $t2, 0x7FFFFFFF # minimum value, is initialized as the maximum number rapresentable in 4 byte
		li $v0, 4 # code to print the string
		la $a0, strInput # load the stirng in a0
		syscall 

		inputCicle:
					li $v0, 5 # load the code for input an integer
					syscall
					sw $v0, ($t0) # store the integer in the t1-th cell of the vector
					addi $t0, 4
					addi $t1, 1
					bne $t1, DIM, inputCicle

		la $t0, wVett
		li $t1, 0

		minCicle:
					lw $t3, ($t0) # load the word at address t0 in t3
					slt $t4, $t3, $t2 # if t3 < t2 t4 = 1
					beq $t4, 1, swap # if t4 == 1 jump to swap
		swapDone:
					addi $t0, 4
					addi $t1, 1
					beq $t1, DIM, done # if we've cicled through all the vector jump to end
					j minCicle # else stay in the cicle

		swap:
					lw $t2, ($t0) # put the content of t0 in t2
					j swapDone # come back to where we jumped

		done: 
					li $v0, 1 # print the minimum value
					la $a0, ($t2)
					syscall

li $v0, 10
syscall
.end main