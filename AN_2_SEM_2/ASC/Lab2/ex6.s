#ideea programului:ca sa vezi daca un numar e par
#faci si pe biti cu numarul 1 si va ramane doar
#ultimul bit in numar dupa aceasta operatie
#daca numarul rezultat e 0 atunci e par
.data
	len: .word 10
	a: .word 1 ,2 ,3 ,4 ,5 ,6 ,8 ,10 ,12 ,3 
.text
	lui $t0,0x1000
	lw $t1,0($t0)		#len
	addi $t0,$t0,4		#sa ajungem pe adresa lui a
	addi $t2,$zero,1	#mask
	add $s0,$zero,$zero#counter
for:
	lw $s1,0($t0)
	and $s1,$s1,$t2
	bne $s1,$zero,end_if
	addi $s0,$s0,1
end_if:
	addi $t0,$t0,4
	addi $t1,$t1,-1
	bne $t1,$zero,for
end_for:
	
	