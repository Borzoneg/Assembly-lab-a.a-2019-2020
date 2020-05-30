 		.data
str: 	.asciiz "Inserisci la lunghezza del lato\n"
 		.text
		.globl main
		.ent main
main:
		li $v0, 4
		la $a0, str
		syscall
		li $v0, 5
		syscall
		add $a0, $v0, $0
		jal stampaTriangolo
		jal stampaQuadrato
		j done

stampaTriangolo:
		add $t3, $a0, 0
		li $t1, 0
	outerLoopTri:
		li $t0, 0
		li $v0, 11
		li $a0, 10
		syscall
		add $t2, $t1, 1 	
		innerLoopTri:	
			li $v0, 11
			li $a0, 42
			syscall
			add $t0, $t0, 1
			blt $t0, $t2, innerLoopTri 
		add $t1, $t1, 1
		blt $t1, $t3, outerLoopTri
		add $a0, $t3, 0
		jr $ra

stampaQuadrato:
		add $t3, $a0, 0
		li $t1, 0
	outerLoopQuad:
		li $t0, 0
		li $v0, 11
		li $a0, 10
		syscall
		innerLoopQuad:
			li $v0, 11
			li $a0, 42
			syscall
			add $t0, $t0, 1
			blt $t0, $t3, innerLoopQuad 
		add $t1, $t1, 1
		blt $t1, $t3, outerLoopQuad
		jr $ra
done:

li $v0, 10
syscall
.end main