#part B of Project 1
#h = (f_ten + 16)/ g_ten ;
#i = (f_ten + g_ten) MOD h_remainder;

.data
newline: .asciiz "\n"
f_ten: .asciiz "f_ten = "
g_ten: .asciiz "g_ten = "
h_q: .asciiz "h_quotient = "
h_r: .asciiz "h_remainder = "
i_mod: .asciiz "i_mod = "

.text
main:
	#user input of f_ten
	li $v0, 5 #reads int
	syscall
	move $s6, $v0
	li $v0, 4 #prints newline
	la $a0, newline
	syscall
	
	#user input of g_ten
	li $v0, 5 #reads int
	syscall
	move $t4, $v0
	li $v0, 4 #prints newline
	la $a0, newline
	syscall
	
#calculate h = (f_ten + 16) / g_ten
	addi $t0, $s6, 16 #f_ten + 16
	move $t1, $t4 #g_ten

	li $t2, 0 
	move $t3, $t0
D:
	blt $t3, $t1, endD
	sub $t3, $t3, $t1
	addi $t2, $t2, 1
	j D
endD:
	move $s7, $t2 #stores the quetient
	move $t5, $t3 #stores the remainder
	
#calculate i=(f_ten + g_ten) MOD h_remainder
	add $t6, $s6, $t4 #f_ten + g_ten
   	move $t7, $t5  #h_remainder
    
   	li $t8, 0  
   	move $t9, $t6  

 D2:
 	blt $t9, $t7, endD2
 	sub $t9, $t9, $t7
 	addi $t8, $t8, 1
    	j D2
endD2:
    move $t0, $t9 #stores i_mod

#print f_ten
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
   	
#print g_ten
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
   	
#print h_quotient
	li $v0, 4
	la $a0, h_q
    	syscall
    	li $v0, 1
    	move $a0, $s7
    	syscall
    	li $v0, 4
    	la $a0, newline
   	syscall
   	li $v0, 4
    	la $a0, newline
   	syscall
   	
#print h_quotient
	li $v0, 4
	la $a0, h_r
    	syscall
    	li $v0, 1
    	move $a0, $t5
    	syscall
    	li $v0, 4
    	la $a0, newline
   	syscall
   	li $v0, 4
    	la $a0, newline
   	syscall
   	
#print h_quotient
	li $v0, 4
	la $a0, i_mod
    	syscall
    	li $v0, 1
    	move $a0, $t0
    	syscall
    	li $v0, 4
    	la $a0, newline
   	syscall
		
#exit program
	li $v0, 10
	syscall
