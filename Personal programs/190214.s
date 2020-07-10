		.data
Wvect:	.word 190, 199, 2
		.text
		.globl main
		.ent main

main:
	la $a0, Wvect
	jal calcola
	move $a0, $v0
	li $v0, 1
	syscall
	j done

calcola:
	subu $sp, $sp, 16
	sw $s0, ($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	lw $s0, ($a0)
	lw $s1, 4($a0)
	lw $s2, 8($a0)
	li $s3, 100
	sub $v0, $s1, $s0
	add $v0, $v0, $s2
	mul $v0, $v0, $s3
	div $v0, $s0
	mflo $v0
	lw $s0, ($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	jr $ra

done:

li $v0, 10
syscall
.end main