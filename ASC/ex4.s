#ideea programului:gasesti unde incepe al doilea vector(primul for)
#copiezi din primul sir in al doilea(al doilea for)
#verifici daca s-a pus bine(al treilea for)
.data
	len: .word 3
	a: .word 1 ,2 ,3
	b: .word 0 ,0 ,0
	
.text
	lui $t0,0x1000		#a
	lui $t1,0x1000		#b
	lw $s0,0($t0)		#len
	add $t0,$t0,4
	add $t1,$t1,4
	add $s1,$zero,$zero	#contor
for:
	addi $s1,$s1,1
	addi $t1,$t1,4
	bne $s1,$s0,for
end_for:

	add $s1,$zero,$zero
for1:
	addi $s1,$s1,1
	lw $s2,0($t0)
	sw $s2,0($t1)
	addi $t0,$t0,4
	addi $t1,$t1,4
	bne $s1,$s0,for1
end_for1:
	add $s1,$zero,$zero
for2:
	addi $s1,$s1,1
	lw $s2,0($t0)
	addi $t0,$t0,4
	bne $s1,$s0,for2
end_for2: