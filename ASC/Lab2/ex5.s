#ideea programului:iei maxim si minim ca fiind primul element
#compari cu restul elementelor vectorului si daca gasesti
#unul mai mic ca minimul,minimul devine acel nr,iar daca
#unul e mai mare ca maximul,maximul devine acel nr si se
#continua procesul de comparare pana la finalul vectorului
.data
	len: .word 7
	a: .word 2 ,3 ,7 ,5 ,1 ,4 ,2
.text
	lui $t0,0x1000
	lw $t1,0($t0)	#len
	lw $s0,0($t0)	#min
	lw $s1,0($t0)	#max
	addi $t0,$t0,4
	addi $t1,$t1,-1
for:
	lw $s2,0($t0)
	slt $t2,$s2,$s0
	beq $t2,$zero,end_if1
	add $s0,$s2,$zero
end_if1:
	slt $t2,$s1,$s2
	beq $t2,$zero,end_if2
	add $s1,$s2,$zero
end_if2:
	addi $t1,$t1,-1
	addi $t0,$t0,4
	bne $t1,$zero,for
end_for:
	