		.data
op1: 	.byte 150
op2:	.byte 100

.text
.globl main
.ent main

main:	
		lbu $t1, op1 # Load byte, is unsigned because 150 is represented with the whole 8 bit
		lbu $t2, op2 # Load unsigned byte
		add $a0, $t1, $t2 # add of the 2 variables
		li $v0, 1 # load the code for 'print int'
		syscall		

li $v0, 10
syscall
.end main