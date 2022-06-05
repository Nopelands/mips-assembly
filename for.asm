.data
resposta: 0

.text
li $t0, 10 #load 10 em t0
sw $t0, resposta #store t0 em resposta na memória

lw $a0, resposta #load conteúdo de resposta no registrador a0

li $v0, 1 #load valor da syscall print integer em v0
syscall #print
