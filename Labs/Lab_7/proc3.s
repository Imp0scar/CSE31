.data
p_msg: .asciiz "p + q: " 
z_msg: .asciiz "\n"
x:	.word 1
y:	.word 2
z:	.word 3


.text

Main:
# initialize local variables
   	la $t0, x
	lw $s0, 0($t0)		# s0 = x
		
	la $t0, y
	lw $s1, 0($t0)		# s1 = y
		
	la $t0, z
	lw $s2, 0($t0)		# s2 = z
    
    
    # call foo function with arguments x, y, z
    add $a0, $s0, $zero # m = x
    add $a1, $s1, $zero # n = y
    add $a2, $s2, $zero # o = z
    jal foo

    # calculate z = x + y + z + p + q
    add $s2, $s2, $s0 # z = z + x
    add $s2, $s2, $s1 # z = z + y
    add $s2, $s2, $v0 # z = z + foo(x,y,z)

    # print new line
    la $a0, z_msg
    li $v0, 4
    syscall
    
    #print z
	move $a0, $s2
    	li $v0, 1
    	syscall


    j End
    
    foo:
    	addi $sp, $sp, -12      # Allocate space for three words on the stack
    	sw $ra, 8($sp)         # Save the return address on the stack
    	sw $s1, 4($sp)
    	sw $s0, 0($sp)
	    
		
	# Call bar function for p and q
    add $t0, $a0, $a2   # a = m + o
    add $t1, $a1, $a2   # b = n + o
    add $t2, $a0, $a1   # c = m + n
   
    sub $t3, $a0, $a2   # a = m - o
    sub $t4, $a1, $a0   # b = n - m
    add $t5, $a1, $a1   # c = n + n
    
    add $a0, $t0, $zero		#move the value in $t0 to $a0
    add $a1, $t1, $zero		#move the value in $t1 to $a1
    add $a2, $t2, $zero		#move the value in $t2 to $a2
    
    
    
    jal bar
    add $s0, $v0, $zero #return the value into p
    
    add $a0, $t3, $zero		#move the value in $t3 to $a0
    add $a1, $t4, $zero		#move the value in $t4 to $a1
    add $a2, $t5, $zero		#move the value in $t5 to $a2
    
    
    jal bar
    add $s1, $v0, $zero  #return the value into q


    # Print p + q message
    la $a0, p_msg
    li $v0, 4
    syscall
    
    #print p + q
    add $a0, $s0, $s1
    li $v0, 1
    syscall

    add $v0, $s0, $s1 # return p + q into $v0
    
    # Deallocate stack frame
    	lw $ra,8($sp)
	lw $s1,4($sp)
	lw $s0,0($sp)
    	addi $sp, $sp, 12
    
    	jr $ra	#jump back to main now that its been restored
    	
bar:

sub $t0,$a1,$a0 	#first perform b-a
move $t1, $a2		
sllv $v0,$t0,$t1	#after logical shift left b-a<<c



jr $ra 		#jump to calling function return value in $v0

End:

li $v0,10 #exit code
    syscall

    	
    	
    	
    
    

