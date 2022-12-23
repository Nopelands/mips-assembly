.data
# inicializar array ja com valores
array1: .word 2, 99, 77, 36, 42
# array vazio
array2: .space 200

.text
# acessar index arbitrario de um array
la $s0, array1 		# carregar o ponteiro para o inicio do array em um registrador
lw $a0, 12($s0) 	# carregar array1[3] (3*4) no registrador de print
li $v0, 1		    # print
syscall
# alternativamente
addi $s0, $s0, 12	# ptr = ptr + 3*4
lw $a0, ($s0)		# array1[3]
li $v0, 1		    # print
syscall
# alternativamente
li $t0, 12		    # carregar index desejado em t0
lw $a0, array1($t0)	# array1[$t0]
li $v0, 1		    # print
syscall

# carregar numeros arbitrarios em um array
la $s0, array2		     # carregar ponteiro para inicio do array em um registrador
# constantes
li $t0, 42		#a = 42  
li $t1, 84		#b = 84
li $t2, 21		#c = 21
# armazenar constantes no array
sw $t0, array2($zero) 	 # array2[0] = a
# alternativamente
sw $t1, 8($s0)		     # array2[2] = b
# alternativamente
addi $s0, $s0, 16	     # ptr = ptr + 4*4
sw $t2, ($s0)		     # array2[4] = c

