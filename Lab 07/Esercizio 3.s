		.data

		.text
		.globl main
		.ent main

main:
		li $a0, 19
		jal 

calcolaSuccessivo:
		li $t0, 2
		li $t3, 3
		div $a0, $t0
		mfhi $t1
		beq $t1, 0, pari 
		mul $t2, $t3, $a0
		addi $t4, $t2, 1
back:
		li $v0, 1 
		move $a0, $t4
		syscall
		beq $t4, 1, end
		move $a0, $t4
		move $t7, $ra
		jal calcolaSuccessivo 
pari:
		mflo $t4
		j back
end:
		j $t7

li $v0, 10
syscall
.end main