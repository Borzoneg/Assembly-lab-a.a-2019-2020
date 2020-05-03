		.data
Serr:	.asciiz "Numero non rappresentabile su byte\n"
.text
.globl main
.ent main

main:
		li $t2, 255
		li $v0, 5
		syscall
		bgt $v0, $t2, notByte
		move $t0, $v0 # t0 = A

		li $v0, 5
		syscall
		bgt $v0, $t2, notByte
		move $t1, $v0 # t1 = B

		nor $t2, $t1, 0 # t2 = !B
		and $t3, $t0, $t2 # t3 = A && !B
		nor $t3, $t3, 0 # t3 = !(A && !B) 
		xor $t2, $t0, $t1 # t2 = A xor B
		or 	$t2, $t2, $t3 # t2 = C
		and $t2, $t2, 255 # 255 is 0x00 00 00 FF so that only the first 8 bit will be considered
		li $v0, 1
		la $a0, ($t2)
		syscall
		j done

		notByte:
			li $v0, 4
			la $a0, Serr
			syscall

		done:
li $v0, 10
syscall
.end main