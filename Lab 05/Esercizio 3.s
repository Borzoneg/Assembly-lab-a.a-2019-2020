		.data
msgInput: .asciiz "Inserisci i valori di A, b e C (separati da invio): "
msg_due_sol:.asciiz "Esistono due soluzioni reali"
msg_no_sol:.asciiz "Non esistono soluzioni reali"
msg_sol_coinc:  .asciiz "Due soluzioni coincidenti"

		.text
		.globl main
		.ent main

main:
		li $v0, 4
		la $a0, msgInput
		syscall

		li $v0, 5
		syscall
		move $t0, $v0	
		li $v0, 5
		syscall
		move $t1, $v0
		li $v0, 5
		syscall
		move $t2, $v0

		li $t3, 4
		mult $t1, $t1
		mflo $t4 # t4 = b^2

		mult $t3, $t0
		mflo $t5 # t5 = 4a

		mult $t5, $t2
		mflo $t5 # t5 = 4ac

		sub $t0, $t4, $t5
		slt $t1, $t0, $0
		beq $t1, 1, nonPresenti
		beq $t0, 0, coincidenti
		j dueSol

nonPresenti: 
		li $v0, 4
		la $a0, msg_no_sol
		syscall
		j done
coincidenti: 
		li $v0, 4
		la $a0, msg_sol_coinc
		syscall
		j done
dueSol:
		li $v0, 4
		la$a0, msg_due_sol
		syscall
done:

li $v0, 10
syscall
.end main