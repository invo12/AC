.text
	addi $v0,$v0,5
	syscall

	add $a0,$zero,$v0
	add $v0,$zero,$zero
	jal suma
	
	add $a0,$zero,$v0
	addi $v0,$zero,1
	syscall
	
	addi $v0,$zero,10
	syscall
suma:
	addi $sp,$sp,-8
	sw $ra,0($sp)
	sw $a0,4($sp)
	
	bne $a0,$zero,dupa_if1
	lw $ra,0($sp)
	lw $a0,4($sp)
	addi $sp,$sp,8
	jr $ra
dupa_if1:
	add $v0,$v0,$a0
	addi $a0,$a0,-1
	jal suma
	lw $ra,0($sp)
	lw $a0,4($sp)
	addi $sp,$sp,8
	jr $ra