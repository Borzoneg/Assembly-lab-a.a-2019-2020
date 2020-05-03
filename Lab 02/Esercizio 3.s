		.data
wVar1:	.word 	11
wVar2:	.word 	10
wVar3:	.word 	12
sep:	.ascii 	";"

.text
.globl main
.ent main

main:
		lw $t1, wVar1 # load of the three words in memory
		lw $t2, wVar2
		lw $t3, wVar3
		bgt $t1, $t2, swapAB # if(a>b) then swap (a, b)
	back1: 
		bgt $t1, $t3, swapAC # if(a>c) then swap (a, c)
	back2:
		bgt $t2, $t3, swapBC # if(b>c) then swap (b, c)
		j done # jump to done to prevent the swaps code to run 

	swapAB: # swap the 2 variable
		add $t0, $t1, 0 
		add $t1, $t2, 0
		add $t2, $t0, 0
		j back1 # and go back from where we arrived

	swapAC:
		add $t0, $t1, 0 
		add $t1, $t3, 0
		add $t3, $t0, 0
		j back2

	swapBC: # in this case jump back is useless
		add $t0, $t2, 0 
		add $t2, $t3, 0
		add $t3, $t0, 0

	done: 
		li $v0, 1 # print the 3 variables in ascending order
		add $a0, $t1, 0
		syscall
		li $v0, 4
		la $a0, sep
		syscall

		li $v0, 1
		add $a0, $t2, 0
		syscall
		li $v0, 4
		la $a0, sep
		syscall

		li $v0, 1
		add $a0, $t3, 0
		syscall
		li $v0, 4
		la $a0, sep
		syscall

li $v0, 10
syscall
.end main