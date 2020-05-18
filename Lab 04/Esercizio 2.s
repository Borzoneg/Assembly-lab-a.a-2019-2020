		.data
str: 	.asciiz "0:add; 1:sot; 2:mol; 3:div\n"
wOpa: 	.word 2043
wOpb: 	.word 5

.text
.globl main
.ent main

main:
		lw $t0, wOpa
		lw $t1, wOpb
		li $v0, 4
		la $a0, str
		syscall
		li $v0, 5
		syscall
		beq $v0, 0, addOp
		beq $v0, 1, subOp
		beq $v0, 2, molOp
		div $a0, $t0, $t1
		j done

addOp:
		add $a0, $t0, $t1
		j done
subOp:
		sub $a0, $t0, $t1
		j done
molOp:	
		mul $a0, $t0, $t1
		j done

done:
		li $v0, 1
		syscall


li $v0, 10
syscall
.end main