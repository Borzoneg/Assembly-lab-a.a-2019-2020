		.data
var1:	.word 12
var2: 	.space 4
		.text
		.globl main
		.ent main

main:
		li $t0, -1
		lw $t1, var1
		mult $t0, $t1
		mflo $t3
		sw $t3, var2

li $v0, 10
syscall
.end main