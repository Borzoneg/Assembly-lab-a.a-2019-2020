# Given a year, report if it is a leap year.
				.data
message: 		.asciiz "Insert year to tell if it's leap\n"
strLeap: 		.asciiz "It's leap\n"
strNotLeap: 	.asciiz "It's not leap\n"

.text
.globl main
.ent main

main:
		la $a0, message
		li $v0, 4 # load the code for print string
		syscall
		
		li $v0, 5 # load the code for read integer
		syscall
		la $t0, ($v0) # load the year in the t0 register

		li $v0, 4

		li 	$t1, 400
		div $t0, $t1 # if the number is divisible by 400 is leap
		mfhi $t2
		beq $t2, 0, isLeap 
		
		li 	$t1, 4
		div $t0, $t1 # divide the year by 4
		mfhi $t2
		bne $t2, 0, notLeap # jump to end if it's not divisible by 4
		
		li 	$t1, 100
		div $t0, $t1
		mfhi $t2	
		beq $t2, 0, notLeap # if a number is divisible by 4 and by 100 it's not leap
	
		
	isLeap:
		la $a0, strLeap
		j done

	notLeap:
		la $a0, strNotLeap
		j done

	done:
		syscall

li $v0, 10
syscall
.end main