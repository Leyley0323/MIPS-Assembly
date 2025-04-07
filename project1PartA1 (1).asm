#task: f =(A x C - B X B) and g =(B x C + 3 X D) without using multiplication

.data 
prompt: .asciiz "Enter 4 integers for A, B, C, D respectively:\n\n"
newline: .asciiz "\n"
f_ten: .asciiz "f_ten = "
f_two: .asciiz "f_two = "
g_ten: .asciiz "g_ten = "
g_two: .asciiz "g_two = "

.text

main:
	#print the prompt
	li $v0, 4
	la $a0, prompt
	syscall

#read in integers A, B, C, D

	#A
	li $v0, 5 #reads int
	syscall
	move $s0, $v0
	li $v0, 4 #prints
	la $a0, newline
	syscall

	#B
	li $v0, 5 #reads int
	syscall
	move $s1, $v0
	li $v0, 4 #prints
	la $a0, newline
	syscall

	#C
	li $v0, 5 #reads int
	syscall
	move $s2, $v0
	li $v0, 4 #prints
	la $a0, newline
	syscall

	#D
	li $v0, 5 #reads int
	syscall
	move $s3, $v0
	li $v0, 4 #prints
	la $a0, newline
	syscall

#calculate A x C
	li $t0, 0 #result
	li $t1, 0
AC:
	bge $t1, $s2, endAC
	add $t0, $t0, $s0
	addi $t1, $t1, 1
	j AC
endAC:
	move $s4, $t0 #stores the result
	
#calculate B x B
	li $t0, 0 #result
	li $t1, 0
BB:
	bge $t1, $s1, endBB
	add $t0, $t0, $s1
	addi $t1, $t1, 1
	j BB
endBB:
	move $s5, $t0 #stores the result
	
#calculate f = A x C - B x B
	sub $s6, $s4, $s5
	
#calculate B x C
	li $t0, 0 #result
	li $t1, 0
BC:
	bge $t1, $s2, endBC
	add $t0, $t0, $s1
	addi $t1, $t1, 1
	j BC
endBC:
	move $t2, $t0 #stores the result
	
#calculate 3 x D
	li $t0, 0 #result
	li $t1, 0
D3:
	bge $t1, 3, end3D
	add $t0, $t0, $s3
	addi $t1, $t1, 1
	j D3
end3D:
	move $t3, $t0 #stores the result
	
#calculate g = B x C + 3 x D
	add $t4, $t2, $t3

#print f (decimal)
	li $v0, 4
	la $a0, f_ten
    	syscall
    	li $v0, 1
    	move $a0, $s6
    	syscall
    	li $v0, 4
    	la $a0, newline
   	syscall
   	li $v0, 4
    	la $a0, newline
   	syscall

#print f (binary)
	li $v0, 4
	la $a0, f_two
    	syscall
    	li $v0, 35 #changed to binary
    	move $a0, $s6
    	syscall
    	li $v0, 4
    	la $a0, newline
   	syscall
   	li $v0, 4
    	la $a0, newline
   	syscall
   	
#print g (decimal)
	li $v0, 4
	la $a0, g_ten
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	li $v0, 4
    	la $a0, newline
   	syscall
	
#print g (binary)
	li $v0, 4
	la $a0, g_two
	syscall
	li $v0, 35
	move $a0, $t4
	syscall
	li $v0, 4
	la $a0, newline
	syscall

# Exit program
	li $v0, 10
	syscall
