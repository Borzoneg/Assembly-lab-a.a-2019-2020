		.data
		NRIGHE=4
		NCOLONNE=6
 matrice: .byte 113, 10, 95, 20, 60, 10, 51, 26, 120, 30, 56, 13, 102, 171, 21, 111, 17, 22, 204, 100, 230, 16, 76, 34,

 				# 113 	10	95	20	60	10 
 				# 51	26	120 30 	56	13 
 				# 102 	171	21	111 17 	22 
 				# 204	100	230	16	76	34
		.text
		.globl main
		.ent main

main:
		la $a0, matrice
		jal contaColonne
		move $a0, $v0
		li $v0, 1
		syscall
		j done

contaColonne:
		addi $sp, $sp, -32
		sw $s0, ($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)

		li $v0, 0
		li $s0, 0 # counter for columns
		li $s1, 0 # counter for rows
		li $s2, 0 # to add to get the right row (it goes from 0 up to 4 by 6)
		li $s3, 2
		li $s5, 0 # accumulator for odd
		li $s6, 0 # accumulatordor even
		outerLoop:	
			move $s2, $s0
			add $s2, $s2, $a0
			innerLoop:
				lb $s7, ($s2)
				div $s7, $s3
				mfhi $s4
				beq $s4, 0, pari
				add $s5, $s5, $s7
				back:
				add $s1, $s1, 1
				add $s2, $s2, 6
				bne $s1, NRIGHE, innerLoop
			bgt $s6, $s5, increment
			backInc:
			add $s0, $s0, 1
			bne $s0, NCOLONNE, outerLoop

		lw $s0, ($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $s4, 16($sp)
		lw $s5, 20($sp)
		lw $s6, 24($sp)
		lw $s7, 28($sp)
		addi $sp, $sp, 32
		jr $ra

		pari:
			add $s6, $s6, $s7
			j back
		increment:
			add $v0, $v0, 1
			j backInc

done:

li $v0, 10
syscall
.end main