			.data
input:  .asciiz "Introduci una stringa: "
outputVuoto: .asciiz "non hai inserito nessun carattere"
outputNoPalindromo: .asciiz "La stringa non e' palindroma"
outputPalindromo: .asciiz "La stringa e' palindroma"

			.text
			.globl main
			.ent main

main:
		li $v0, 4
		la $a0, input
		syscall
		move $t0, $sp 
		li $t1, 0 # counter for the number of char
inputLoop:
		li $v0, 12
		syscall
		beq $v0, '\n', fineLettura
		add $t1, $t1, 1
		sw $v0, ($t0)
		add $t0, $t0, 4
		j inputLoop

fineLettura:
		beq $t1, 0, noChars

		subu $t0, $t0, 4
		li $t2, 2
		li $t4, 0
		div $t1, $t2
		mflo $t1

cycleOnWord:
		lw $t2, ($sp) # first char of the string
		lw $t3, ($t0) # last char of the string
		bne $t2, $t3, notPali
		addu $sp, $sp, 4
		subu $t0, $t0, 4
		addi $t4, 1
		bne $t4, $t1, cycleOnWord 
		j pali

noChars: 
		li $v0, 4
		la $a0, outputVuoto
		syscall
		j done

notPali:
		li $v0, 4
		la $a0, outputNoPalindromo
		syscall
		j done
pali:
		li $v0, 4
		la $a0, outputPalindromo
		syscall

done:

li $v0, 10
syscall
.end main