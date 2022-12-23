.text
li $t1, 3                  # set the number of loop iterations
li $t0, 10                 # n = 10
loop: beq $t1, $zero, end  # checks if the loop is over
add $s0, $t0, $s0          # x = x + n
addi $t1, $t1, -1          # adjusts the iteration counter
j loop                     # jumps to the start of the loop
end: li $v0, 10            # sets syscall to exit the program
syscall                    # syscall
