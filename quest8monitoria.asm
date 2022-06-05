.data
    # Dados das variáveis
    a: .word 3
    b: .word 9
.text    
    # Carregando os argumentos da função recursiva
    lw $a0, a
    lw $a1, b
    
    jal recursion # Chama função recursiva
    
    add $v1, $a0, $v1
    li $v0, 10 # Fim do programa
    syscall
    
    recursion:
        # Aloca espaço na stack
        addi $sp, $sp, -12
        sw $a0, 8($sp)
        sw $a1, 4($sp)
        sw $ra, 0($sp)
        
        bgt $a0, $a1, a_bgt_b # Verifica se a > b
        beq $a0, $a1, return # Ponto de retorno da função recursiva quando a=b inicialmente
        
        addi $a0, $a0, 1 # Incrementa "a" em uma unidade
        beq $a0, $a1, return # Ponto de retorno da função recursiva quando a=b durante as chamadas
        jal recursion
        add $v1, $a0, $v1 # Soma de todos os termos no intervalo
        j cleanUp
        
    return:
        move $v1, $a0
        j cleanUp
    
    cleanUp:
        # Restaura espaço na stack
        lw $ra, 0($sp)
        lw $a1, 4($sp)
        lw $a0, 8($sp)
        addi $sp, $sp, 12
        jr $ra # Retorna para a última chamada recursiva
    
    a_bgt_b:
        # $v1=1 se a>b e encerra o programa 
        li $v1, 1
        li $v0, 10
        syscall
