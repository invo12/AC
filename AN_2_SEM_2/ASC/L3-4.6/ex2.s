.data
	len: .word 6
	a: .word 1, 2, 4, 6, 8, 10
.text
main:
	lui $t0,0x1000	#t0 = &len
	lw $s0,0($t0)	#s0 = 6
	addi $t0,$t0,4	#t0 = &a
	
	addi $sp,$sp,-8
	sw $s0,4($sp)
	sw $t0,0($sp)
	jal numaraPar
	lw $t0,0($sp)
	lw $s0,4($sp)
	addi $sp,$sp,8
	j out
numaraPar:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	
	lw $s1,4($sp)	#addr
	lw $s2,8($sp)	#len
	add $s3,$zero,$zero	#i
	add $v0,$zero,$zero	#contor
for:
	lw $t1,0($s1)
	andi $t1,$t1,1
	bne $t1,$zero,dupa_if
	addi $v0,$v0,1		#contor++
dupa_if:
	addi $s3,$s3,1
	addi $s1,$s1,4
	bne $s3,$s2,for
	
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra
out: