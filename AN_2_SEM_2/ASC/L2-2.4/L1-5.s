.data
	len: .word 5
	a: .word 16, 27, 3, -5, 20
.text
	lui $t0,0x1000
	lw $s0,0($t0)	#s0 = len
	addi $t0,$t0,4	#t0 = &a
	lw $t1,0($t0)
	add $s1,$t1,$zero	#s1 = min = a[0]
	add $s2,$t1,$zero	#s2 = max = a[0]
	addi $s3,$zero,1
	addi $t0,$t0,4
for:
	lw $t2,0($t0)
	addi $t0,$t0,4
	slt $at,$t2,$s1
	beq $at,$zero,dupa_if1
	add $s1,$zero,$t2	#min = a[i]
dupa_if1:
	slt $at,$s2,$t2
	beq $at,$zero,dupa_if2
	add $s2,$zero,$t2
dupa_if2:
	addi $s3,$s3,1
	bne $s3,$s0,for