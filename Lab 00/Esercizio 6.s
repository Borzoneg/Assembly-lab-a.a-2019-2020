		.data
		DIM=5
wVett:	.space 20	
str:	.asciiz "Inserire numeri\n"
sep:	.ascii ";"

.text
.globl main
.ent main

main:
		la $a0, str # load the address of the string in a0
		li $v0, 4 # load the code for "print string" function in v0
		syscall # call to the S.O.
		la $t0, wVett # load the adddress of the vetor in t0
		li $t1, 0 # init of t1 as counter

	inputFor:
			li $v0, 5 # load code for "read integer" function
			syscall # call to the S.O.
			sw $v0, ($t0) # store the content of v0 (inputted by the user) in t0
			addi $t0, 4 # update of both the counter 
			addi $t1, 1
			bne $t1, DIM, inputFor #check if we're done

		la $t0, wVett # reinitialization of counters
		li $t1, 0
	
	outputFor:
			li $v0, 1 # load the code for "print an integer" to the operative system
			lw $a0, ($t0) # load content of t0 (t1-th cell of the vector)
			syscall
			li $v0, 4 # load the code to print a string
			la $a0, sep # load the separator to a0
			syscall # print the separator
			addi $t0, 4
			addi $t1, 1
			bne $t1, DIM, outputFor

li $v0, 10
syscall
.end main