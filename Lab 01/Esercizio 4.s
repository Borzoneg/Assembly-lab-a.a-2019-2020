		.data
wVar:	.word 0x3FFFFFF0

.text
.globl main
.ent main

# N.B THE PROGRAM IS BUGGED IN QTSPIM AND WON'T SHOW THE RIGHT VALUE

main:
		lw 	$t1, wVar # load of the word in memory
		sll $t1, $t1, 1 # multiplication by 2 using shift of the register
		li 	$t2, 40 # load of the immediate in t2
		addu $a0, $t1, $t2 # unsigned add to avoid overflow
		li $v0, 1 # print of the value
		syscall

li $v0, 10
syscall
.end main