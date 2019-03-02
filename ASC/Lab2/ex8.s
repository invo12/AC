#idee program:bubble sort ordine descrescatoare

.data
	len: .word 5
	a: .word 5 ,4 ,2 ,1 ,3
.text
	lui $t0,0x1000
	lw $t1,0($t0)		#len
	addi $t1,$t1,-1		#mergem doar pana la len - 1 la bubble sort
	addi $t0,$t0,4
	add $t2,$t0,$zero	#salvam adresa de inceput a tabloului
	add $t3,$zero,$zero #ok = 0
while:
	addi $t3,$zero,1	#ok = 1
	add $t0,$t2,$zero
	add $s0,$zero,$zero	#i = 0
	for:
		lw $s1,0($t0)	#a[i]
		lw $s2,4($t0)	#a[i+1]
		slt $s3,$s1,$s2
		beq $s3,$zero,end_if
		
		add $s4,$s1,$zero	#aux = a[i]
		add $s1,$s2,$zero	#a[i] = a[i+1]
		add $s2,$s4,$zero	#a[i+1] = aux
		add $t3,$zero,$zero	#ok = 0
		
		sw $s1,0($t0)
		sw $s2,4($t0)
	end_if:
		addi $s0,$s0,1
		addi $t0,$t0,4
		bne $s0,$t1,for
	end_for:
	beq $t3,$zero,while
end_while:

add $t0,$zero,$t2
add $s0,$zero,$zero
addi $t1,$t1,1
for1:
	lw $s1,0($t0)
	addi $t0,$t0,4
	addi $s0,$s0,1
	bne $s0,$t1,for1
end_for1:
