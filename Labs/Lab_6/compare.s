.data
n:	.word 25

str1: .asciiz "Less than\n"
str2: .asciiz "Less than or equal to\n"
str3: .asciiz "Greater than\n"
str4: .asciiz "Greater than or equal to\n"

.text

main: 
	la      $t1, n		#load the value of n = 25 to $t1
	lw      $t1, 0($t1)

	
	li 	$v0, 5		# get the users input
	syscall
	
	move 	$t0, $v0	#store the users input into $t0
	
	
	
	#slt 	$t2, $t0, $t1		# compare if users input $t0 is less then n ($t1)
	#bne 	$t2, $zero, LessThan
	
	blt	$t0, $t1, LessThan
	bge 	$t0, $t1, GreaterThanOrEqual
	bgt 	$t0, $t1, GreaterThan
	ble 	$t0, $t1, LessThanOrEqual
	
	LessThan: 
		li      $v0, 4       # code 4 == print string
		la      $a0, str1  # $a0 == address of the string
		syscall
		j 	end
	
	LessThanOrEqual: 
		li      $v0, 4       # code 4 == print string
		la      $a0, str2  # $a0 == address of the string
		syscall
		j 	end
		
	GreaterThan: 
		li      $v0, 4       # code 4 == print string
		la      $a0, str3  # $a0 == address of the string
		syscall
		j 	end
		
	GreaterThanOrEqual: 
		li      $v0, 4       # code 4 == print string
		la      $a0, str4  # $a0 == address of the string
		syscall
		j 	end
	end:
	
