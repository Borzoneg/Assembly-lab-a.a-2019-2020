		.data
n1: 	.byte 10
n2: 	.byte 0x10
n3: 	.byte '1'
res:	.space 1  

.text
.globl main
.ent main

main:
		lb	$t1, n1 # load the byte at address 'n1'
		lb	$t2, n2 # load the byte at address 'n2'
		lb	$t3, n3 # load the byte at address 'n3'
		sub $t0, $t1, $t2 # subtract t2=n2 from t1=n1
		add $t0, $t0, $t3 # add t3 = n3 to t0
		sb 	$t0, res # store the byte on memory to res address
		lb 	$t4, res # load the content of res address memory to t4 to verify

	

li $v0, 10
syscall
.end main