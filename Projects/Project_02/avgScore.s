.data 

orig: .space 100	# In terms of bytes (25 elements * 4 bytes each)
sorted: .space 100

str0: .asciiz "Enter the number of assignments (between 1 and 25): "
str1: .asciiz "Enter score: "
str2: .asciiz "Original scores: "
str3: .asciiz "Sorted scores (in descending order): "
str4: .asciiz "Enter the number of (lowest) scores to drop: "
str5: .asciiz "Average (rounded down) with dropped scores removed: "
str6: .asciiz " "
str7: .asciiz "\n"


.text 

# This is the main program.
# It first asks user to enter the number of assignments.
# It then asks user to input the scores, one at a time.
# It then calls selSort to perform selection sort.
# It then calls printArray twice to print out contents of the original and sorted scores.
# It then asks user to enter the number of (lowest) scores to drop.
# It then calls calcSum on the sorted array with the adjusted length (to account for dropped scores).
# It then prints out average score with the specified number of (lowest) scores dropped from the calculation.
main: 
	addi $sp, $sp -4
	sw $ra, 0($sp)
	li $v0, 4 
	la $a0, str0 
	syscall 
	li $v0, 5	# Read the number of scores from user
	syscall
	move $s0, $v0	# $s0 = numScores
	move $t0, $0
	la $s1, orig	# $s1 = orig
	la $s2, sorted	# $s2 = sorted
loop_in:
	li $v0, 4 
	la $a0, str1 
	syscall 
	sll $t1, $t0, 2
	add $t1, $t1, $s1
	li $v0, 5	# Read elements from user
	syscall
	sw $v0, 0($t1)
	addi $t0, $t0, 1
	bne $t0, $s0, loop_in
	
	move $a0, $s0
	move $a1, $s0	# moved numscores to $a1
	jal selSort	# Call selSort to perform selection sort in original array
	
	li $v0, 4 
	la $a0, str2 
	syscall
	move $a0, $s1	# More efficient than la $a0, orig
	move $a1, $s0	# moved numscores to $a1
	jal printArray	# Print original scores
	li $v0, 4 
	la $a0, str3 
	syscall 
	move $a0, $s2	# More efficient than la $a0, sorted
	jal printArray	# Print sorted scores
	
	li $v0, 4 
	la $a0, str4 
	syscall 
	li $v0, 5	# Read the number of (lowest) scores to drop
	syscall
	move $a1, $v0
	sub $a1, $s0, $a1	# numScores - drop
	move $a0, $s2
	jal calcSum	# Call calcSum to RECURSIVELY compute the sum of scores that are not dropped
	
	# Your code here to compute average and print it
	
	lw $ra, 0($sp)
	addi $sp, $sp 4
	li $v0, 10 
	syscall
	
	
# printList takes in an array and its size as arguments. 
# It prints all the elements in one line with a newline at the end.
printArray:
    addi $sp, $sp, -8     # allocate space on the stack for $ra
    sw $ra, 0($sp)        # save the return address on the stack
    sw $a0, 4($sp)
    move $t4, $0          # initialize counter to 0
loop_print:
    bge $t4, $a1, end_print   # exit loop if counter equals array length
    sll $t5, $t4, 2       # multiply counter by 4 (since each array element is 4 bytes)
    add $t5, $a0, $t5     # add the result to the base address of the array to get the address of the current element
    lw $a0, 0($t5)        # load the current element into $a0
    li $v0, 1             # set the system call code for printing an integer (1)
    syscall               # print the integer
    
    li $v0, 4 		#print a space
    la $a0, str6
    syscall
	
    lw $a0, 4($sp)
    addi $t4, $t4, 1      # increment the counter
    bne $t4, $a1, loop_print
end_print:
    li $v0, 4             # set the system call code for printing a string (4)
    la $a0, str7       # load the address of the newline string into $a0
    syscall               # print the newline
    lw $ra, 0($sp)        # restore the return address from the stack
    addi $sp, $sp, 4      # deallocate the space used for $ra
    jr $ra                # return to the caller


	
	
# selSort takes in the number of scores as argument. 
# It performs SELECTION sort in descending order and populates the sorted array
# 	move $a0, $s0
# $s0 = numscores so $a0 = numscores
# $s2 = sorted list
selSort:
	# Your implementation of selSort here
    addi $sp, $sp, -8     # allocate space on the stack for $ra
    sw $ra, 0($sp)        # save the return address on the stack
    move $t4, $0          # initialize counter to 0
loop_copy:
    bge $t4, $a1, end_loop  # exit loop if counter equals array length
    
    move $s2, $s1	   # move orig[i] into sorted[i]

    addi $t4, $t4, 1      # increment the counter
    bne $t4, $a1, loop_copy
	
end_loop:
	lw $ra, 0($sp)        # restore the return address from the stack
    addi $sp, $sp, 4      # deallocate the space used for $ra
    
    # a1 = numscores - 1, t0 = i, t2 = maxIndex, t1 = j, t3 = temp, t4 = i t5 = sorted[j]
    #t5 = sorted[maxIndex]

end:
	jr $ra
	
# calcSum takes in an array and its size as arguments.
# It RECURSIVELY computes and returns the sum of elements in the array.
# Note: you MUST NOT use iterative approach in this function.
calcSum:
	# Your implementation of calcSum here
    jr $ra                # return to caller

