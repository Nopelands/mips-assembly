.globl __start
.ent __start

.data
a: .word 3
b: .word 9

.text
__start:lw $a0, a 		#get a
	lw $a1, b		#get b
	jal sum 		#sum(a..b)
	li $v0, 1 		#set syscall to print
	move $a0, $v1 
	syscall 		#print
	
	li $v0, 10 		#exit
	syscall

sum:	addi $sp, $sp, -8 	#move stack pointer by 2 words
	sw $s0, 4($sp) 		#stack push non-temp register
	sw $ra, 0($sp) 		#stack push return address
	
	bgt $a0, $a1, fail 	#if a > b
	
	beq $a0, $a1, return 	#elif a == b
	
	move $s0, $a1		#move b to aux variable
	addi $a1, $a1, -1	#b = b - 1
	jal sum			#sum(a, b - 1)
	add $v1, $s0, $v1	#return b + sum(a, b - 1)
	j cleanup
	
return: move $v1, $a0 		#return a
	j cleanup
	
fail:	li $v1, 1		#return 1
	j cleanup

cleanup:lw $ra, 0($sp) 		#stack pop return address
	lw $s0, 4($sp) 		#stack pop non-temp register
	addi $sp, $sp, 8 	#move stack pointer back by 2 words
	jr $ra 			#return to caller
	
