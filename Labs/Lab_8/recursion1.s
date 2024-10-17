.data
msg1: .asciiz "Please enter a number: "
msg2: .asciiz "\n"

.text
.globl main

# Main function
main:
    # Allocate stack frame
    addi $sp, $sp, -4
    
    # Print "Please enter a number: " message
    la $a0, msg1
    li $v0, 4
    syscall
    
    li $v0, 5  # get the users input
    syscall
    move $a0, $v0  #store the users input into $a0
    
    # Call recursion function
    jal recursion
    
    # Print output of recursion function
    add $a0, $v0, $zero
    li $v0, 1
    syscall
    
    # Print newline character
    la $a0, msg2
    li $v0, 4
    syscall
    
    # Exit program
    j end 

# Recursion function
recursion:
    # Allocate stack frame
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    # Check for base cases
    addi $t0, $a0, 1
    addi $t1, $0, -2
    bne $t0, $zero, not_minus_one
    
    addi $v0, $zero, 3

    j end_recursion
    
not_minus_one: 
    slt $t2, $t1, $a0		# branch on less than or equal
    beq $t2, $zero, base_case_two
   
    sw $a0, 4($sp)

    addi $a0, $a0, -3
    jal recursion

    #sw $v0, 8($sp)
    lw $a0, 4($sp)
    
    add $v0, $v0, $a0
    sw $v0, 8($sp)

	
    addi $a0, $a0, -2
    jal recursion

    lw $a0, 4($sp)
    lw $t4, 8($sp)

    add $v0, $t4, $v0
    

    j end_recursion
    
base_case_two:
    slt $t3, $a0, $t1
    bne $t3, $zero, output_two

    addi $v0, $zero, 1
    j end_recursion
    
output_two:
    addi $v0, $zero, 2
    
end_recursion:
    lw $ra, 0($sp)
    addi $sp, $sp, 12  # Pop stack frame
    jr $ra
    
# Terminating the program
end:
    addi $sp, $sp, 4  # Moving stack pointer back (pop the stack frame)
    li $v0, 10
    syscall


