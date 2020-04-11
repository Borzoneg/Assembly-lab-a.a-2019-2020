		.data
wVar:	.word 3

.text
.globl main
.ent main

main:
		li $t0, 12 		# load an immediate in t0
		sw $t0, wVar	# store the content of t0 in wVar
		la $t1, wVar	# since I can't see the content of wVar from qtSpim i load the address of wVar
		lw $t2, ($t1)	# then put the content of wVar (at address t1) in t2
		
li $v0, 10
syscall
.end main