
# program care calculeaza numarul de biti de 1 dintr-un cuvant

# // pseudocod aproximativ

# a0 = 0x0C 		// valoarea pentru care se face calculul 
# t0 = 32;			// numar de daplasri pentru t1
# t1 = 0x00000001;  // masca - valoare initiala
# v0 = 0;           // rezultatul calculului
# do {
#    if (t1 & a0) {	// si logic pe biti
#        v0++;
#    }
#    t0--;
#    t1 <<= 1;
# } while (t0);

.data
	value: .word 1, 2, 3, 4, 5
	len: .word 5
.text
	.globl main
	.ent main

main:
	la $s0, value
	la $s1,len
	lw $s1,0($s1)
	jal count_ones_array
	add $s1,$s1,$zero
	j out
.end main
	
count_ones:
	addi $t0, $zero, 32
	addi $t1, $zero, 1
	add $v0, $zero, $zero
	
repeat:	
	and $t2, $a0, $t1
	beq $t2, $zero, bit_is_zero
	add $v0, $v0, 1
bit_is_zero:
	sll $t1, $t1, 1
	addi $t0, $t0, -1
	bne $t0, $zero, repeat
	jr $ra
.end count_ones

count_ones_array:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	add $v1,$zero,$zero
for:
	lw $a0,0($s0)
	jal count_ones
	add $v1,$v1,$v0
	addi $s0,$s0,4
	addi $s1,$s1,-1
	bne $s1,$zero,for
end_for:
	add $v0,$zero,$v1
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra
.end count_ones_array

out:
.ent main
