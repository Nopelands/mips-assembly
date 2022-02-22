.data
array1: .word 2, 99, 77, 36, 42
array1size: .word 16

array2: .space 200


#queremos armazenar no array 2 todos os numeros em array que sao iguais a 36
.text
li $s2, 36 		#a = 36
lw $t0, array1size	
li $t1, 0		#indice do array 1 (i)
li $t2, 0		#indice do array 2 (j)
addi $t4, $t0, 4	#primeira posicao fora do array 1

loop:
lw $t3, array1($t1)	#t3 = array1[i]
beq $t3, $s2, match	#if t3 == a pula para match
addi $t1, $t1, 4	#i++
beq $t4, $t1, end	#if i > tamanho de array 1 pula para end
b loop

match:
sw $t3, array2($t2)	#array2[j] = t3
addi $t1, $t1, 4	#i++
addi $t2, $t2, 4	#j++
beq $t4, $t1, end	#if i > tamanho do array 1 pula para end
b loop

end:
lw $a0, array2($zero)	#carrega array2[0] em a0
li $v0, 1		#print
syscall
li $v0, 10		#exit
syscall
