		.data
vet:	.word  15, 64, 9, 2, 4, 5, 9, 1, 294, 52, -4, 5  
		.text
		.globl main
		.ent main

main:
		la $a0, vet         # indirizzo di vet
		li $a1, 12          # dimensione di vet
		jal monotono
		move $a0, $v1
		li $v0, 1
		syscall

li $v0, 10
syscall
.end main

monotono:
		subu $sp, $sp, 24
		li $v0, 0
		sw $s0, ($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)

		li $s0, 0
		move $s1, $a0
		subu $s2, $a1, 1
		li $s5, 0
		loop:
			lw $s3, ($s1)
			lw $s4, 4($s1)
			blt $s4 , $s3, azzeramento
			back:
			addi $s5, $s5, 1
			addi $s1, $s1, 4
			addi $s0, $s0, 1
			bne $s0, $s2, loop
			lw $s0, ($sp)
			lw $s1, 4($sp)
			lw $s2, 8($sp)
			lw $s3, 12($sp)
			lw $s4, 16($sp)
			lw $s5, 20($sp)
			addi $sp, $sp, 24
			jr $ra

		azzeramento:
			bgt $s5, $v0, swap
			backSwap:
			li $s5, 0
			j back
		swap:
			move $v0, $s5	
			sub $v1, $s0, $s5
			add $v1, $v1, 1
			j backSwap
