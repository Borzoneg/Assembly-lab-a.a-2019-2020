		.data
		DIM=4
var1: 	.byte 'm'
var2: 	.byte 'i'
var3: 	.byte 'p'
var4: 	.byte 's'
var5: 	.byte 0 # stand for '\0' in ascii and tell the program where to stop printing when syscall 4 is called

.text
.globl main
.ent main

main:
		li $t3, 0 # initialization of counter
		li $t2, 32 # static number I've to subtract from the lower letter to capitalize it
		la $t0, var1 # load of address of the first letter
		upperFor:	
			lb $t1, ($t0) # load byte at t0 address
			sub $t1, $t1, $t2 # capitalize the letter
			sb $t1, ($t0) # store the capitalized letter in the t0 address, overwriting the lower one
			addi $t3, 1 # update of t3
			addi $t0, 1 # update of t0
			bne $t3, DIM, upperFor # check if cycle is over

		la $a0, var1 # load address of first letter in a0
		li $v0, 4 # code for 'write a string'
		syscall 



li $v0, 10
syscall
.end main