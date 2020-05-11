			.data
			DIM=5
strInstr:	.asciiz "Inserire un numero alla volta\n"
.text
.globl main
.ent main

main:
		li $t1, 0
		li $t2, 0
		li $v0, 4
		la $a0, strInstr
		syscall
input:	
		li $v0, 5
		syscall
		move $t0,$v0 
		add $t1, $t1, $t0
		addi $t2, $t2, 1 
		bne $t2, DIM, input

		li $t2, DIM
		div $t1, $t2
		li $v0, 1
		mflo $a0
		syscall

li $v0, 10
syscall
.end main