				.data
strInt: 		.asciiz "Intero\n"
strNotInt: 		.asciiz "Non intero\n"
strOverflow: 	.asciiz "Overflow\n"

.text
.globl main
.ent main

main:
		li $t0, 10
		li $t1, 48
		li $t2, 57
		li $t3, 0
		li $t4, 0
		li $t6, 2147483647
cycle:
		li $v0, 12
		syscall
		beq $v0, $t0, done
		blt $v0, $t1, notInt
		bgt $v0, $t2, notInt
		j sumDigits
back:
		blt $t3, 0, overflow 
		j cycle
notInt:
		li $v0, 4
		la $a0, strNotInt
		syscall
		j cycle
sumDigits:
		sub $t5, $v0, 48 # get the cipher as int
		beq $t4, 0, notPow # jump at first pace
pow:
		mult $t3, $t0 # multiply the current number by 10
		mfhi $t7
		bne $t7, 0, overflow
		mflo $t3 

		sub $t7, $t6, $t3 # in t7 there is how much space "is left" 
		bgt $t5, $t7, overflow
		
		add $t3, $t3, $t5 # add the new cipher to the accumulator
		j back
notPow:
		add $t4, $t4, 1
		add $t3, $t3, $t5 # add to the accumulator
		j back
overflow:
		li $v0, 4
		la $a0, strOverflow
		syscall
		j main
done: 
		li $v0, 1
		add $a0, $t3, 0
		syscall			

li $v0, 10
syscall	
.end main