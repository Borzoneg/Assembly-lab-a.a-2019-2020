		.data
		ROW=4
		COL=6
		ROW_DIM=COL*4
		DIM=4*ROW*COL
wMat: 	.word	154, 123, 109, 86, 4, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0
sep:	.ascii ";"

.text
.globl main
.ent main

main:
	li $t0, 0
	outerLoop:
			li $t2, 0 # accumulator
			li $t3, 1 # counter of column	
			innerLoop:
					lw $t1, wMat($t0)
					add $t2, $t2, $t1
					addi $t3, 1
					addi $t0, 4
					blt $t3, COL, innerLoop
			
			sw $t2, wMat($t0)
			addi $t0, 4
			bne $t0, DIM, outerLoop

	li $t4, 0
	li $t5, 4
	outerLoop2:
			mul $t0, $t4, $t5
			li $t2, 0 # accumulator
			li $t3, 1 # counter of rows	
			innerLoop2:
					lw $t1, wMat($t0)
					add $t2, $t2, $t1
					addi $t3, 1
					addi $t0, ROW_DIM
					blt $t3, ROW, innerLoop2
			
			sw $t2, wMat($t0)
			addi $t0, ROW_DIM
			addi $t4, 1
			bne $t4, COL, outerLoop2


			# print loop
			li $t5, 0
	printLoop:
			li $v0, 1
			lw $a0, wMat($t5)
			syscall
			addi $t5, 4
			li $v0, 4
			la $a0, sep
			syscall
			bne $t5, DIM, printLoop

li $v0, 10
syscall
.end main	






