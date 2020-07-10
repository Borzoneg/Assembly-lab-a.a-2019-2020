			.data 
			DIM = 4
matrice:	.word 126, -988, 65, 52, 7, 0, 2, 643, 66, 532, 43, 9254, 5, -51, 4352, -452
sep: 		.ascii ";"
			
			.text
			.globl main
			.ent main

main:     
		la $a0, matrice
		li $a1, DIM
		li $t0, 0
		printLoop1:
		li $v0, 1
		lw $a0, matrice($t0)
		syscall
		addi $t0, 4
		li $v0, 4
		la $a0, sep
		syscall
		bne $t0, 64, printLoop1

		jal calcolaTrasp

		li $t0, 0
		printLoop:
		li $v0, 1
		lw $a0, matrice($t0)
		syscall
		addi $t0, 4
		li $v0, 4
		la $a0, sep
		syscall
		bne $t0, 64, printLoop


li $v0, 10
syscall
.end main

calcolaTrasp:
		subu $sp, $sp, 32
		sw $s0, ($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		move $s0, $a0
		li $s7, 1
		mul $s1, $a1, $a1
		outerLoop:
			add $s4, $s0, $a1
			add $s5, $s0, $s1 
			move $s6, $s7
			innerLoop:
				lw $s2, ($s4)
				lw $s3, ($s5)
				move $t0, $s2
				move $s2, $s3
				move $s3, $t0
				sw $s2, ($s4)
				sw $s3, ($s5)
				addi $s6, $s6, 1
				bne $s6, $a1, innerLoop
			addi $s7, $s7, 1
			add $s0, $s0, $t1
			add $s0, $s0, $a1
			blt $s7, $a1, outerLoop

		lw $s0, ($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $s4, 16($sp)
		lw $s5, 20($sp)
		lw $s6, 24($sp)
		lw $s7, 28($sp)
		add $sp, $sp, 32
		jr $ra
