		.data
		.text
		.globl main
		.ent main

main:
		li $a0, 12
		li $a1, 2
		jal combina
		move $a0, $v0
		li $v0, 1
		syscall
		j done
		
combina:
		move $t0, $a0
		move $t1, $a1
		sub $t2, $a0, $a1
		add $t2, $t2, 1 # t0 = n-k+1
		li $t3, 1 # t3 will be numerator
		li $t4, 1 # t4 will be denominator
	numeratore:
		mul $t3, $t3, $t0
		sub $t0, $t0, 1
		bge $t0, $t2, numeratore
	denominatore:
		mul $t4, $t4, $t1
		sub $t1, $t1, 1
		bgt $t1, 1, denominatore

		div $t3, $t4
		mflo $v0

		jr $ra


done:

li $v0, 10
syscall
.end main