			.data
strInt: 	.asciiz "Intero\n"
strNotInt: 	.asciiz "Non intero\n"

.text
.globl main
.ent main

main:
		li $v0, 12
		syscall
		
		li $t0, 10
		li $t1, 48
		li $t2, 57

		beq $v0, $t0, done
		blt $v0, $t1, notInt
		bgt $v0, $t2, notInt

		li $v0, 4
		la $a0, strInt
		syscall
		j main

notInt:
		li $v0, 4
		la $a0, strNotInt
		syscall
		j main

done: 	

			

li $v0, 10
syscall	
.end main