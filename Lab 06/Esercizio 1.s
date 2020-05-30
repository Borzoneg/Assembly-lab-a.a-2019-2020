		DIM=8
		.text
		.globl main
		.ent main
main:
		jal stampaTriangolo
		jal stampaQuadrato
		j done

stampaTriangolo:
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
		blt $t1, DIM, outerLoopTri
		jr $ra

stampaQuadrato:
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
			blt $t0, DIM, innerLoopQuad 
		add $t1, $t1, 1
		blt $t1, DIM, outerLoopQuad
		jr $ra
done:

li $v0, 10
syscall
.end main