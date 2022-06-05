.globl __start
.ent __start

.data
str: .asciiz "Abcd"

.text
__start:
la $s0, str
lb $t0, 0($s0)
addi $t0, $t0, 32
sb $t0, 0($s0)

li $v0, 4
move $a0, $s0
syscall
