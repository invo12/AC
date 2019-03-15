.data
	mesaj: .asciiz "Introduceti un sir de caractere: "
	sir: .asciiz "a"
.text
	lui $a0,0x1000
	addi $v0,$zero,4
	syscall
	
	addi $a0,$a0,34
	addi $a1,$zero,8
	addi $v0,$zero,8
	syscall
	
	jal inversare
	
	addi $v0,$zero,10
	syscall
	
inversare:
	addi $sp,$sp,-12
	sw $ra,0($sp)		#adresa revenire
	sw $a0,4($sp)		#sir
	sw $t0,8($sp)		#caracter curent
	
	lb $t0,0($a0)
	beq $t0,$zero,dupa_if
	addi $a0,$a0,1
	jal inversare
	addi $v0,$zero,11
	add $a0,$t0,$zero
	syscall
dupa_if:
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $t0,8($sp)
	addi $sp,$sp,12
	
	jr $ra