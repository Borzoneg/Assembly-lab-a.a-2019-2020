					.data 
vettore:  			.byte 14, 16, 18, 134, 24, 22, 23, 149, 140, 141, 145, 146
vettoreCompresso:	.space 12 
					INTERVALLO_QUANT = 10 
.text
.globl main
.ent main

main: 
			subu $sp, $sp, 4 
			sb $ra, ($sp) 
			la $a0, vettore 
			li $a1, 12 
			la $a2, vettoreCompresso 
			jal comprimi 
			lb $ra, ($sp) 
			addu $sp, $sp, 4 
			jr $ra 
.end main

quantizza: 
			divu $t0, $a0, INTERVALLO_QUANT
			mulou $v0, $t0, INTERVALLO_QUANT 
			jr $ra 


comprimi:
			subu $sp, $sp, 24
			sw $ra, ($sp)
			sw $s0, 4($sp)
			sw $s1, 8($sp)
			sw $s4, 24($sp)

			move $s0, $a0
		
			lb $a0, ($s0)
			jal quantizza
			sb $v0, ($a2)
			move $s4, $v0

			li $s1, 0

		loop:
			lb $a0, ($s0)
			jal quantizza
			bne $v0, $s4, inserisci
		doneInserisci:
			addi $s1, $s1, 1
			addi $s0, $s0, 1
			bne $s1, $a1, loop

			lw $ra, ($sp)
			lw $s0, 4($sp)
			lw $s1, 8($sp)	
			lw $s4, 24($sp)
			addu $sp, $sp, 24
			jr $ra

		inserisci:
			sb $v0, ($a2)
			addi $a2, $a2, 1	
			move $s4, $v0
			j doneInserisci