		.data

		DIM = 5
		NEXT_COL = 4
		NEXT_ROW = 4*DIM
		NEXT_DIAG = 4*(DIM+1)

		matrix:  
		.word  1, 1, 9, 0, 0
		.word  1, 2, 0, 1, 0
		.word  9, 0, 3, 0, 0
		.word  0, 1, 0, 4, 0
		.word  0, 0, 0, 0, 5

		.text
		.globl main
		.ent main

main:
		li $t6, 0 # scans through the diagonal
		li $t2, 0 # counts how much values we gather out of the diagonal, if it is zero then the matrix is a diagonal 		 
		li $t5, 0 # index of diagonal we computed
		

outerLoop:
		add $t0, $t6, NEXT_COL # scans through row starting from [0,1]
		add $t1, $t6, NEXT_ROW # scans through column starting from [1,0]
		add $t7, $t5, 1 # index of element in a row/col we computed
		
		innerLoop:
			lw $t3, matrix($t0)
			lw $t4, matrix($t1)
			add $t2, $t2, $t3
			add $t2, $t2, $t4
			bne $t3, $t4, notSimmetric
			add $t0, $t0, NEXT_COL
			add $t1, $t1, NEXT_ROW
			add $t7, $t7, 1 
			bne $t7, DIM, innerLoop #TODO: va a 6 sull'ultimo ciclo

		add $t6, $t6, NEXT_DIAG
		add $t5, $t5, 1
		bne $t5, DIM, outerLoop
		beq $t2, 0, diagonal
		j simmetric

notSimmetric: 
		li $v0, 1
		la $a0, 0
		syscall
		j done

simmetric:
		li $v0, 1
		la $a0, 1
		syscall
		j done

diagonal:
		li $v0, 1
		la $a0, 2
		syscall

done:
li $v0, 10
syscall
.end main