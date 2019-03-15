.data
	a: .word 1, 2, 3
			#i, j, k
	rez: .word 0
.text
	addi $s0,$zero,2	#a = 2
	addi $s1,$zero,7	#b = 7
	addi $s2,$s1,-4		#c = 3
	add $s3,$s1,$s1		#f = 14
	
	add $t0,$zero,$zero	#t0 = 0
	add $t0,$s0,$s1
	add $t0,$t0,$s2
	sub $t1,$zero,$s3	#-f
	add $t0,$t0,$t1		#a+b+c-f
	addi $t0,$t0,5
	add $t0,$t0,$s0
	addi $t0,$t0,-10
	
	lui $t3,0x1000		#t3 = &a
	addi $t4,$zero,200
	lw $s4,0($t3)		#s4 = i
	lw $s5,4($t3)		#s5 = j
	lw $s6,8($t3)		#s6 = k
	
	add $t5,$s4,$s5		#i+j
	addi $t6,$s6,2		#k+2
	sub $t5,$zero,$t5
	sub $t6,$zero,$t6
	add $t4,$t4,$t5
	add $t4,$t4,$t6
	
	sw $t4,12($t3)
	
	
	
	
	
	
	