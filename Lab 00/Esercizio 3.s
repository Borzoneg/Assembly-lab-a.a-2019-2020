.data
wOpd1:   .word   10
wOpd2:   .word   24
wResult: .space	 4 

.text
.globl main
.ent main

main:
		lw $t0, wOpd1	# load the word at addres wOpd1 in t0
		lw $t1, wOpd2	# load the word at addres wOpd2 in t1
		add $t2, $t0, $t1	# add t0 and t1 and store it in t2
		sw $t2, wResult		# store the result in wResult
		lw $t3, wResult		# load the word in t3 to see it with qtSpim

li $v0, 10
syscall
.end main