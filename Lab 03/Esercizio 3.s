			.data
			MAX_INT=2147483647
			MIN_BY_DAY=1440
			MIN_BY_HOUR=60
bDays:		.byte 21
bHours:		.byte 12
bMins:		.byte 13
btrash: 	.byte 12
wRisulato: 	.space 4 

.text
.globl main
.ent main

main:
		li $t1, MIN_BY_DAY
		li $t2, MIN_BY_HOUR
		lw $t3, bMins
		lw $t4, bDays
		lw $t5, bHours

		add $t6, $t3, $0 
		
		mult $t1, $t4
		mflo $t7
		add $t6, $t6, $t7

		mult $t2, $t5
		mflo $t7
		add $t6, $t6, $t7
		
		sw $t6, wRisulato 

		lw $a0, wRisulato
		li $v0, 1
		syscall

li $v0, 10
syscall
.end main