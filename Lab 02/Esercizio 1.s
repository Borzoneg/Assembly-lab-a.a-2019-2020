		.data
str: 		.asciiz "Inserire un numero\n"
strPari: 	.asciiz "Il numero è pari\n"
strDis: 	.asciiz "Il numero è dispari\n"

.text
.globl main
.ent main

main:
		li $v0, 4
		la $a0, str
		syscall
		li $v0, 5
		syscall
		move $t0, $v0
		
		andi $t1, $t0, 1
		beq $t1, 0, pari

		li $v0, 4
		la $a0, strDis
		syscall

		j done
		pari: 
				li $v0, 4
				la $a0, strPari
				syscall

		done:

	

li $v0, 10
syscall
.end main