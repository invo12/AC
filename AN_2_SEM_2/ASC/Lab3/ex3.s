.text

main:
	addi $sp,$sp,-20
	addi $s0,$zero,4
	sw $s0,16($sp)
	addi $s0,$zero,8
	sw $s0,12($sp)
	addi $s0,$zero,12
	sw $s0,8($sp)
	addi $s0,$zero,-4
	sw $s0,4($sp)
	addi $s0,$zero,-8
	sw $s0,0($sp)
	jal maxim
	addi $sp,$sp,20
	j out
.end main

maxim:					#maxim(a,b,c,d,e)
	add $sp,$sp,-8
	sw $fp,4($sp)
	addi $fp,$sp,4	
	lw $v0,16($fp)		#v0 = a
	lw $s1,12($fp)		#s1 = b
	blt $s1,$v0,dupa1
	add $v0,$s1,$zero
dupa1:
	lw $s1,8($fp)		#s1 = c
	blt $s1,$v0,dupa2
	add $v0,$s1,$zero
dupa2:
	lw $s1,4($fp)		#s1 = d
	blt $s1,$v0,dupa3
	add $v0,$s1,$zero
dupa3:
	lw $s1,0($fp)		#s1 = e
	blt $s1,$v0,dupa4
	add $v0,$s1,$zero
dupa4:
	lw $fp,4($sp)
	addi $sp,$sp,8
	jr $ra
.end maxim

out:
