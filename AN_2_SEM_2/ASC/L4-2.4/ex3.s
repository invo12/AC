.data
	sir: .asciiz "a"
.text
main:
	lui $a0,0x1000
	addi $a1,$zero,8
	addi $v0,$zero,8
	syscall
	
	add $v0,$zero,$zero
	jal lungime
	
	add $t0,$v0,$zero	#nr caractere
	addi $v0,$zero,10
	syscall
	
lungime:
	addi $sp,$sp,-12
	sw $ra,0($sp)		#adresa revenire
	sw $a0,4($sp)		#sir
	sw $t0,8($sp)		#caracter curent
	
	lb $t0,0($a0)
	beq $t0,$zero,dupa_if
	addi $a0,$a0,1
	jal lungime
	addi $v0,$v0,1
dupa_if:
	lw $ra,0($sp)
    lw $a0,4($sp)
    lw $t0,8($sp)
	addi $sp,$sp,12
	
	jr $ra