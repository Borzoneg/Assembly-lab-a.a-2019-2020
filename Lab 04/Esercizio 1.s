		.data
		DIM=20
vet: 	.space 80
sep: 	.ascii ";"

.text
.globl main
.ent main

main:
	li $t0, 0 # counter of number of fibonacci
	li $t1, 1 # the current number of fibonacci
	li $t2, 0 # the precedent number of fibonacci
	la $t3, vet # address of the vet
loop:
	sw $t1, ($t3) # store the current number in memory
	add $t1, $t1, $t2 # sum the precedent number to the current one
	sub $t2, $t1, $t2 # subtract to get the number that were store in t1
	addi $t0, 1 # update counter of dim
	addi $t3, 4	# update the memory cell
	bne $t0, DIM, loop # condition

	# simple print loop to check if everythinkg works properly
	li $t0, 0
	li $t4, 0
printLoop:
	li $v0, 1
	lw $a0, vet($t4) 
	syscall
	li $v0, 4
	la $a0, sep
	syscall 
	addi $t0, 1
	addi $t4, 4
	bne $t0, DIM, printLoop


li $v0, 10
syscall
.end main