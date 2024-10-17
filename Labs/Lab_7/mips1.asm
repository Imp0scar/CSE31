.text
.globl main
main:
addi $s0,$0,1 #x=5
addi $s1,$0,2 #y=10
addi $s2,$0,3 #z=15

move $a0,$s0 #passing argument into $a0=x
move $a1,$s1 #$a1=y
move $a2,$s2 #$a2=z
jal foo #calling function foo and return value in $v0

add $s2,$s1,$s2 #adding z=y+z
add $s2,$s2,$s0 #adding z=x+y+z
add $s2,$s2,$v0 #adding z=x+y+z+foo(x,y,z)

#printing integer value syscode 1 for printing an integer
li $v0,1
move $a0,$s2 #moving value in $a0 for printing
syscall

li $v0,10 #exit code
syscall

foo:
#below for line stores the value of register $s0,$s1 and return address register into stack
addi $sp,$sp, 12
sw $s0,0($sp)
sw $s1,4($sp)
sw $ra,8($sp)

# Call bar function for p and q
    add $t0, $a0, $a2   # a = m + o
    add $t1, $a1, $a2   # b = n + o
    add $t2, $a0, $a1   # c = m + n
   
    add $t3, $a0, $a2   # a = m - o
    sub $t4, $a1, $a0   # b = n - m
    add $t5, $a1, $a1   # c = n + n
    
    move $a0,$t0 #passing argument in $a0=m+n
move $a1,$t1 #passing argumeent in $a1=n+o
move $a2,$t2 #passing argument in $a2=o+m
jal bar #calling function bar and return value in $v0
move $s0,$v0 #return value in p

move $a0,$t3 #passing argument in $a0=m-o
move $a1,$t4 #a1=n-o
move $a2,$t5 #a2=n*2

jal bar #calling function bar and return value in $v0
move $s1,$v0 #return value in q

add $v0,$s0,$s1 #adding a p+q and return a value in $v0

#below for line retrives the original value in register and ra register
lw $s0,0($sp)
lw $s1,4($sp)
lw $ra,8($sp)
addi $sp,$sp, -12

jr $ra #jump to calling funtion

bar:
sub $t0,$a1,$a0 	#first perform b-a
sllv $v0,$t0,$a2 	#after logical shift left b-a<<c

jr $ra 		#jump to calling function return value in $v0








