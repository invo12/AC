.data
	a: .word 2, 3, 4
.text

	lui $t0,0x1000	#t0 = &a
	lw $t1,0($t0)	#t1 = i
	lw $t2,4($t0)	#t2 = j
	lw $t3,8($t0)	#t3 = k
	
	addi $s0,$zero,200
	add $s1,$t1,$t2		#i+j
	sub $s0,$s0,$s1		#200-(i+j)
	addi $t3,$t3,2
	sub $s0,$s0,t3