# Title: Demo code for CSE 031 Lecture 14 (Spring 2023)
# Author: Santosh Chandrasekhar

.data # Define the program data.

a: .word 10
		
.text # Define the program instructions.
main: # Label to define the main program.

	# One way to load data onto $s1 and $s2
	#li $s1, 10		
	#li $s2, 5
	
	#The recommended way to set the set values of $s1 and $s2 is to first build the program, 
	#then set $s1 and $s2 using the pane on the right displaying register values, then running 
	#the program
	
	add $a0, $s1, $s2	#Register $s3 now holds the sum of $s1 and $s2
	
	#addi $a0, $s3, 0	#Load the value $s3 to be printed into $a0
	
	#Two other ways to load the value $s3 into $a0
	#add $a0, $s3, $zero
	#move $a0, $s3
	
	li $v0, 1 # Load 1 into $v0 to indicate printing of an integer
	syscall # Syscall reads the value in $v0, sees that it is 1, so it expects $a0 to 
		# contain the target VALUE that is then printed.

	li $v0, 10 # Load a 10 (halt) into $v0
	syscall # The program ends
