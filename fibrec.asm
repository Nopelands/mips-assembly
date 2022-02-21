.globl __start
.ent __start

.data
n: .word 4

.text
__start:lw $a0, n 		#get n
	jal fib 		#fib(n)
	li $v0, 1 		#set syscall to print
	move $a0, $v1 
	syscall 		#print
	
	li $v0, 10 		#exit
	syscall

fib:	addi $sp, $sp, -12 	#move stack pointer by 3 words
	sw $a0, 8($sp) 		#stack push argument
	sw $s0, 4($sp) 		#stack push non-temp register
	sw $ra, 0($sp) 		#stack push return address
	
	beq $a0, $zero, return 	#if n == 0
	
	li $t0, 1
	beq $a0, $t0, return 	#elif n == 1
	
	addi $a0, $a0, -1
	jal fib 		#fib(n-1)
	move $s0, $v1 		#move output to non-temp register
	addi $a0, $a0, -1
	jal fib			#fib(n-2)
	add $v1, $s0, $v1	#output = fib(n-1) + fib(n-2)
	j cleanup
	
return: move $v1, $a0 		#return n
	j cleanup
	
cleanup:lw $ra, 0($sp) 		#stack pop return address
	lw $s0, 4($sp) 		#stack pop non-temp register
	lw $a0, 8($sp) 		#stack pop argument
	addi $sp, $sp, 12 	#move stack pointer back by 3 words
	jr $ra 			#return to caller
	
