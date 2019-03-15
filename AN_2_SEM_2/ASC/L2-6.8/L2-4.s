.data
	len: .word 3
	a: .word 1, 2, 3
	b: .word 0, 0, 0
.text
	lui $t0,0x1000
	lw $s0,0($t0)	#s0 = len
	addi $t0,$t0,4	#t0 = &a
	add $t1,$zero,$t0
	add $s1,$zero,$zero	#contor = 0
for:
	addi $t1,$t1,4
	addi $s1,$s1,1
	bne $s1,$s0,for
	#t1 = &b
	add $s1,$zero,$zero	#contor = 0
for1:
	lw $t2,0($t0)	#a[i]
	sw $t2,0($t1)	#b[i] = a[i]
	addi $s1,$s1,1
	addi $t0,$t0,4
	addi $t1,$t1,4
	bne $s1,$s0,for1
	
add $s1,$zero,$zero	#contor = 0
for2:
	lw $t2,0($t0)	#a[i]
	addi $t0,$t0,4
	addi $s1,$s1,1
	bne $s1,$s0,for2
	
	
	
	