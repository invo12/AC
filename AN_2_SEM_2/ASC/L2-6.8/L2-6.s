.data
	len: .word 4
	a: .word 1, 2, 4, 6
.text
	lui $t0,0x1000
	lw $s0,0($t0)	#s0 = len
	addi $t0,$t0,4	#&a
	add $s1,$zero,$zero	#contor = 0
	add $t2,$zero,$zero	#contorNrPare = 0
for:
	lw $t1,0($t0)	#a[i]
	andi $t1,$t1,1
	bne $t1,$zero,dupa_if
	addi $t2,$t2,1
dupa_if:
	addi $t0,$t0,4
	addi $s1,$s1,1
	bne $s1,$s0,for
	
	