		.data
str: 	.asciiz "Inserire due numeri\n"
sep: 	.ascii 	";"
.text
.globl main
.ent main

main:
		li $v0, 4
		la $a0, str
		syscall

		li $v0, 5
		syscall
		move $t1, $v0
		
		li $v0, 5
		syscall
		move $t2, $v0 

		# x = t1; y = t2  
		add $t1, $t1, $t2 # x = t1 + t2; y = t2
		sub $t2, $t1, $t2 # x = t1 + t2; y = t1 + t2 - t2 = t1
		sub $t1, $t1, $t2 # x = t1 + t2 - t1 = t2; y = t1

		move $a0, $t1 # move t1 in a0 to print it
		li $v0, 1
		syscall
		la $a0, sep # put the separator in a0 to print it
		li $v0, 4
		syscall
		move $a0, $t2
		li $v0, 1
		syscall

li $v0, 10
syscall
.end main