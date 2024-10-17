# Title: Demo code for CSE 031 Lecture 15 (Spring 2023)
# Author: Santosh Chandrasekhar

.data # Define the program data.
str1: .asciiz "Please enter a number: " # The string to print. Asciiz means it is null-terminated
str2: .asciiz "f (= g + h if i == j, = g - h otherwise): "
str3: .asciiz "\nValue of i << 31: "
newline: .asciiz "\n"
list:	.word 1, 2, 3, 4, 5, 6 # An array of integers
g:	.word 10
h:	.word 5

.text # Define the program instructions.
main: # Label to define the main program.

	la $t0, list	# Have $t0 point to the beginning of the array
	lw $a0, 12($t0) # Load the value list[3] to be printed into $a0
	li $v0, 1	# Load 1 into $v0 to indicate printing of an integer
	syscall	# Syscall reads the value in $v0, sees that it is 1, so it expects $a0 to 
		# contain the target VALUE that is then printed.

	sw $a0, 20($t0) # Store the value in $a0 at list[5]
	
	#print a newline
	li $v0, 4  # Load 4 into $v0 to indicate a print string
	la $a0, newline	# Load the address labelled as newline into $a0. This is where the
		     	# string "\n" is stored
	syscall # Syscall reads the value in $v0, sees that it is 4, so it expects $a0 to 
		# contain the ADDRESS of the null-terminated string (newline) that is then 
		# printed

	#print input prompt
	li $v0, 4
	la $a0, str1
	syscall
						
	li $v0, 5	# Read input (i) from user
	syscall
	move $s3, $v0	# $s3 represents i

	li $v0, 4 	# Print input prompt
	la $a0, str1 
	syscall
	li $v0, 5	# Read input (j) from user
	syscall
	move $s4, $v0	# $s4 represents j

	la $t0, g	# Load address labelled as g into $t0 (this is where 10 is stored)
	lw $s1, 0($t0)	# $s1 = g. Fetch the value stored at address in $t0 into $s1
	             	
	la $t0, h
	lw $s2, ($t0)	# $s2 = h

	beq $s3, $s4, True	# Check if i == j and if so, jump to the address labelled as True
	sub $s0, $s1, $s2	# f = g – h (false)
	j   Fin			# goto Fin (Need to jump over the next statement)
True: 	add $s0, $s1, $s2	# f = g + h (true)

Fin:	li $v0, 4	# Print ouput prompt
	la $a0, str2 
	syscall
	addi $a0, $s0, 0 # Print out value of f
	li $v0, 1		 
	syscall	
	
	li $v0, 4	# Print a newline
	la $a0, newline 
	syscall
	li $v0, 4	# Print ouput prompt
	la $a0, str3
	syscall
	sll $a0, $s3, 31
	li $v0, 1		 
	syscall	
	
	
	li $v0, 10 # Load a 10 (halt) into $v0
	syscall # The program ends
