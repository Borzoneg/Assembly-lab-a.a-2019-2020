.text
.globl main
.ent main

# Scrittura di un valore in un registro e sua verifica su QtSpim

main:
		li $t0, 10		# load of the value 10 in decimal in t0 register
		li $s0, 0xDC	# load of the value DC in hex in s0 register

li $v0, 10
syscall
.end main