		.data
wVar: 	.word 3141592653

.text
.globl main
.ent main

main:
		li $t0, 10
		li $t3, 0
		lw $t1, wVar
		addu $t1, $t1, $0
notZero:
		divu $t1, $t0
		mflo $t1 # t1 = numero / 10
		mfhi $t2 # t2 = numero % 10
		sw $t2, ($sp)
		subu $sp, 4
		addi $t3, 1
		bne $t1, $0, notZero

		add $sp, 4
		li $v0, 11
printingLoop:
		lw $a0, ($sp)
		addi $a0, 48		
		syscall
		sub $t3, 1
		addi $sp, 4
		bne $t3, 0, printingLoop




li $v0, 10
syscall
.end main