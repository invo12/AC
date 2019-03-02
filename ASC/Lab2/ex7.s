#ideea programului:verifici daca caracterul e litera mica
#comparandu-l cu 'a' si 'z' si apoi scazand diferenta intre
#'a' si 'A' in ASCII petru a converti in litera mare
.data
	a: .byte 'a' ,'b' ,'c' ,'0'
.text
	lui $t0,0x1000
	addi $t1,$zero,'0'
	addi $t2,$zero,'a'
	addi $t4,$t2,-1
	addi $t3,$zero,'z'
	addi $t3,$t3,1
	
while:
	lb $s0,0($t0)
	slt $s1,$s0,$t3
	beq $s1,$zero,end_if
	
	slt $s1,$t4,$s0
	beq $s1,$zero,end_if
	
	sub $s0,$s0,$t2
	addi $s0,$s0,'A'
	sb $s0,0($t0)
end_if:
	addi $t0,$t0,1
	bne $s0,$t1,while
end_while:

lui $t0,0x1000
while1:
	lb $s0,0($t0)
	addi $t0,$t0,1
	bne $s0,$t1,while1
end_while1: