.data
	sir: .asciiz "\nsalut lume\n"
	da: .asciiz "a"
.text
main:
	addi $v0,$zero,5
	syscall

	add $a0,$zero,$v0
	addi $v0,$zero,1
	syscall
	
	addi $v0,$zero,12
	syscall
	
	add $a0,$zero,$v0
	addi $v0,$zero,11
	syscall
	
	la $a0,da
	addi $a1,$zero,10
	addi $v0,$zero,8
	syscall
		
	addi $v0,$zero,4
	syscall
	
	addi $v0,$zero,10
	syscall
	
	