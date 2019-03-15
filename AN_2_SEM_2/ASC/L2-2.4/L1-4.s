.data
	len: .word 4
	a: .word 1, 2, 3, 4
	b: .word 0, 0, 0, 0
.text
	lui $t0,0x1000
	lw $t1,0($t0)		#t1 = len
	addi $t0,$t0,4
	add $t3,$t0,$zero	#t3=&a
	add $s0,$s0,$zero	#contor
for:
	addi $t3,$t3,4
	addi $s0,$s0,1
	bne $s0,$t1,for
	#t3 = &b
	add $s0,$zero,$zero
for1:
	lw $t2,0($t0)
	addi $t0,$t0,4
	sw $t2,0($t3)
	addi $t3,$t3,4
	addi $s0,$s0,1
	bne $s0,$t1,for1
	
	add $s0,$zero,$zero
for2:
	lw $s1,0($t0)
	addi $s0,$s0,1
	addi $t0,$t0,4
	bne $s0,$t1,for2