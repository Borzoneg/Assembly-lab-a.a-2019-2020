		.data
vect:	.word 2, 5, 12, 4, 345, 21
		.text
		.globl main
		.ent main

main:
		la $a0, vect
		li $a1, 6
		jal max
		move $a0, $v0
		li $v0, 1
		syscall
		j done
max:
		li $t3, 0
		move $t0, $a0

	loop:
		lw $t1, ($t0)
		bgt $t1, $t2, swap
	doneSwap:
		add $t3, $t3, 1
		add $t0, $t0, 4
		blt $t3, $a1, loop
		move $v0, $t2
		jr $ra

	swap:
		move $t2, $t1
		j doneSwap
		

done:	

li $v0, 10
syscall
.end main	