#ideea programului:aduni niste numere :)
.data
	a : 
		.word	 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
	#		  	 a, b, c, d, e, f, g, 28h, i, j, k
.text
	lui $t0,0x1000	#li $t0,0x10000000
#p1 rezultat in s2
	lw $s0,0($t0)
	lw $s1,4($t0)
	add $s2,$s0,$s1 #a+b
	add $s2,$s2,$s0
	lw $s0,8($t0)
	lw $s1,12($t0)
	sub $s1,$s0,$s1
	add $s2,$s2,$s1
	addi $s2,$s2,5
	addi $s2,$s2,-10
#p2 rezultat in t1
	lw $t2,32($t0)
	lw $t3,36($t0)
	addi $t1,$t1,200
	add $t4,$t2,$t3	#i+j
	sub $t1,$t1,$t4
	lw $t2,40($t0)
	addi $t2,$t2,2
	sub $t1,$t1,$t2
	