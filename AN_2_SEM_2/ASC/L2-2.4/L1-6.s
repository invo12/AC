.data
	len: .word 3
	a: .word 0, 2, 4
.text
	lui $t0,0x1000
	lw $s0,0($t0)	#s0 = len
	addi $t0,$t0,4
	add $s1,$zero,$zero	#index = 0
	add $s2,$zero,$zero #contorNrPare = 0
	addi $s3,$zero,1
for:
	lw $t1,0($t0)
	and $t1,$t1,$s3
	bne $t1,$zero,dupa_if
	addi $s2,$s2,1
dupa_if:
	addi $t0,$t0,4
	addi $s1,$s1,1
	bne $s1,$s0,for