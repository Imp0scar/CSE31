# Title: Demo code for CSE 031 Lecture 18 (Spring 2023)
# Author: Santosh Chandrasekhar

.data
n:      	.word 10
#m:		.word -8
newline:	.asciiz "\n"

.text
main: 	la $t3, n		# Load address of n into $t3
	lw $a0, 0($t3)		# Set $a0 = n (stored at $t3)
	
	#lw $a0, n
	
	jal fib			# Call fib(n)
	j finish		
		
fib: 	addi $sp, $sp, -12	# Make space for 3 words
	sw $ra, 8($sp)		# Save return address
	#sw $s0, 4($sp)		# Save $s0 (used later to store one of the returned values)
		
	addi $v0, $zero, 1	# $v0 = 1
	beq $a0, $zero, fin	# Base case 0
	addi $t0, $zero, 1	# $t0 = 1
	beq $a0, $t0, fin	# Base case 1 ($v0 = 1 from line 14 so no need to set it again)

	sw $a0, 0($sp)		# Need $a0 after jal
	addi $a0, $a0, -1 	# $a0 = n - 1
	jal fib			# fib(n - 1)

	lw $a0, 0($sp)		# restore $a0
	addi $a0, $a0, -2	# $a0 = n - 2
	
	sw $v0, 4($sp) 
	#add $s0, $zero, $v0	# Place fib(n-1) return value in $s0
	jal fib 		# fib(n - 2) 
	lw $t0, 4($sp)
	add $v0, $v0, $t0 	# $v0 = fib(n-1) + fib(n-2)
		
fin:	lw $s0, 4($sp) 		# Restore $s0
	lw $ra, 8($sp)		# Restore return address
	addi $sp, $sp, 12	# Pop the stack frame
	jr $ra			# Return to caller

finish:	add $a0, $zero, $v0	# Print return value of fib(n)
	li $v0, 1		
	syscall	
				
	li $v0, 10		# Terminate the program
	syscall			

