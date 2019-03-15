.data
	len: .word 6
	a: .word 7, 2, 13, 8, -42, 22
.text
	lui $t0,0x1000
	lw $s0,0($t0)	#s0 = len
	addi $t0,$t0,4	#t0 = &a
	lw $s1,0($t0)	#s1 = min = a[0]
	lw $s2,0($t0)	#s2 = max = a[0]
	addi $s3,$zero,1	#contor
	addi $t0,$t0,4
for:
	lw $t2,0($t0)	#a[i]
	slt $t1,$t2,$s1
	beq $t1,$zero,dupa_if1
	add $s1,$zero,$t2
dupa_if1:
	slt $t1,$s2,$t2
	beq $t1,$zero,dupa_if2
	add $s2,$zero,$t2
dupa_if2:
	addi $t0,$t0,4
	addi $s3,$s3,1
	bne $s3,$s0,for
	



