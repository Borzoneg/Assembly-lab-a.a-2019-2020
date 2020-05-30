		.data
str: 	.asciiz "asdrubale\n"
result:	.space 	5
		.text
		.globl main
		.ent main
main:
		li $t4, 10
		li $t1, 0 
		li $t2, 0 
		li $t3, 32
loop:
		la $t0, str($t1)
		lb $a0, ($t0)
		beq $a0, 10, done
		jal lowerCase
		sb $v0, result($t1)
		add $t1, $t1, 1
		j loop

lowerCase:
		sub	 $v0, $a0, $t3
		jr $ra

done:
		sb $t4, result($t1)
		li $v0, 4
		la $a0, result 
		syscall
		li $t1, 0


li $v0, 10
syscall
.end main