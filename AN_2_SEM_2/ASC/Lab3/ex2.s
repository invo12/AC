.data
	a:
		.word 7, 6, 9, 8, 1, 3, 2	#3
.text

main:
	addi $sp,$sp,-8
	addi $t0,$zero,7
	sw $t0,0($sp)
	la $t1,a	#pseudo instructiune
	sw $t1,4($sp)
	jal count_even_array
	addi $sp,$sp,8
	j out
.end main	

count_even_array:
	addi ,$sp,$sp,-8	#alocam spatiu pentru $fp,$ra
	sw $ra,0($sp)
	sw $fp,4($sp)
	add $fp,$sp,8
	add $fp,$sp,8
	lw $t0,0($fp)	#t0 <- 7
	lw $t1,4($fp)	#t1 <- &a
	add $v0,$zero,$zero

loop:
	lw $t2,0($t1)
	andi $t2,1
	bne $t2,$zero,impar
	addi $v0,$v0,1
impar:
	addi $t1,$t1,4
	addi $t0,-1
	bne $t0,$zero,loop

	lw $ra,0($sp)
	lw $fp,4($sp)
	addi $sp,$sp,8
	jr $ra
.end count_even_array

out:
