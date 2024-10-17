.data

str1: .asciiz "Please enter a number: "
str2: .asciiz  "Sum of even numbers is: "
str3: .asciiz  "Sum of odd numbers is: "
newline: .asciiz "\n"

.text

addi $t5, $t5, 0
addi $t6, $t6, 2
main: 
	li $s0, 0 # initialize even sum
    	li $s1, 0 # initialize odd sum
    	
	Loop:
	li      $v0, 4       # code 4 == print string 1
	la      $a0, str1  # $a0 == address of the string
	syscall             # Ask the operating system to 
                    		    # perform the service.
                    		    
	li 	$v0, 5		# get the users input
	syscall
	move 	$t0, $v0	#store the users input into $t0, pseudo instruction for addu $t0, $v0, $zero
	
	rem 	$t1, $t0, $t6
	beq 	$t1, $t5, even  	# branch on equal if user input is even(equal to 0) go to even
	
	odd:
	add 	$s1, $s1, $t0		#adds the odd user input numbers into $s1
	j 	end
	
	even: 
	add 	$s0, $s0, $t0		#adds the even user input numbers into $s0
	
	end:
	
	bne $t0, 0, Loop	#branch on not equal ( if $t0/user input == 0) go to Loop
	
	la $a0, newline		#print a new line
	li $v0, 4
        syscall
	
	li      $v0, 4       # code 4 == print string
	la      $a0, str2  # $a0 == address of the string
	syscall
	
	move 	$a0, $s0	#pseudo instruction for addu $a0, $s0, $zero
	li	$v0, 1		#print the sum of even numbers
	
	syscall
	    
	la $a0, newline		#print a new line
	li $v0, 4
        syscall
        
	li      $v0, 4       # code 4 == print string
	la      $a0, str3  # $a0 == address of the string
	syscall
	
	
	
	move 	$a0, $s1
	li	$v0, 1		#print the sum of odd numbers     
	syscall   
	
	  li $v0, 10
        syscall  
