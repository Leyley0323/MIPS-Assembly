#task: counts the occurrences of K, N, I, G, H, T, R, and O in an input string

.data
newline: .asciiz "\n"
LetK: .asciiz "K: "
LetN: .asciiz "N: "
LetI: .asciiz "I: "
LetG: .asciiz "G: "
LetH: .asciiz "H: "
LetT: .asciiz "T: "
LetR: .asciiz "R: "
LetO: .asciiz "O: "
histogram: .asciiz "#"
buffer: .space 1024

.text
main:

#initialize registers for each letter
 	li $s0, 0 #K counter
 	li $s1, 0 #N counter
 	li $s2, 0 #I counter
 	li $s3, 0 #G counter
 	li $s4, 0 #H counter
 	li $s5, 0 #T counter
 	li $s6, 0 #R counter
 	li $s7, 0 #O counter
 	
 #read input string
 	li $v0, 8 # reads string
    	la $a0, buffer # address of buffer
    	li $a1, 1024 # max number of numbers to read
    	syscall

 # Set up for string processing
   	la $t0, buffer   
 
 processStrings:
 	lb $t1, 0($t0) 
 	beqz $t1, res #loop condition
 	
 #check for each letter
 	li $t2, 'K'
   	beq $t1, $t2, IncK
    	li $t2, 'k'
    	beq $t1, $t2, IncK
    
    	li $t2, 'N'
    	beq $t1, $t2, IncN
    	li $t2, 'n'
    	beq $t1, $t2, IncN
    
    	li $t2, 'I'
    	beq $t1, $t2, IncI
    	li $t2, 'i'
    	beq $t1, $t2, IncI
    
    	li $t2, 'G'
    	beq $t1, $t2, IncG
    	li $t2, 'g'
    	beq $t1, $t2, IncG
    
    	li $t2, 'H'
    	beq $t1, $t2, IncH
    	li $t2, 'h'
    	beq $t1, $t2, IncH
    
    	li $t2, 'T'
    	beq $t1, $t2, IncT
    	li $t2, 't'
    	beq $t1, $t2, IncT
    	
    	li $t2, 'R'
    	beq $t1, $t2, IncR
    	li $t2, 'r'
    	beq $t1, $t2, IncR
    
    	li $t2, 'O'
    	beq $t1, $t2, IncO
    	li $t2, 'o'
    	beq $t1, $t2, IncO
 	
 #incrementing counters
 nextChar:
 	addi $t0, $t0, 1 #moves to the next char
 	j processStrings
 	
IncK:
 	addi $s0, $s0, 1
    	j nextChar
    	
IncN:
    	addi $s1, $s1, 1
    	j nextChar
    	
IncI:
    	addi $s2, $s2, 1
    	j nextChar
    	
IncG:
    	addi $s3, $s3, 1
    	j nextChar
    	
IncH:
    	addi $s4, $s4, 1
    	j nextChar
    	
IncT:
    	addi $s5, $s5, 1
    	j nextChar
    	
IncR:
    	addi $s6, $s6, 1
    	j nextChar
    	
IncO:
    	addi $s7, $s7, 1
    	j nextChar

 #prints results
 res:
 	#Displays K
 	li $v0, 4
    	la $a0, LetK
    	syscall
    	li $v0, 1
   	move $a0, $s0
    	syscall
    	li $v0, 4
    	la $a0, newline
    	syscall
	
 	# Display N 
    	li $v0, 4
    	la $a0, LetN
    	syscall
    	li $v0, 1
    	move $a0, $s1
    	syscall
    	li $v0, 4
   	la $a0, newline
   	syscall
   	
   	# Display I 
    	li $v0, 4
    	la $a0, LetI
    	syscall
    	li $v0, 1
    	move $a0, $s2
    	syscall
    	li $v0, 4
    	la $a0, newline
    	syscall

   	# Display G 
    	li $v0, 4
    	la $a0, LetG
    	syscall
    	li $v0, 1
    	move $a0, $s3
    	syscall
    	li $v0, 4
    	la $a0, newline
    	syscall

    	# Display H 
    	li $v0, 4
    	la $a0, LetH
    	syscall
    	li $v0, 1
    	move $a0, $s4
    	syscall
    	li $v0, 4
    	la $a0, newline
    	syscall

   	# Display T 
    	li $v0, 4
    	la $a0, LetT
    	syscall
    	li $v0, 1
    	move $a0, $s5
    	syscall
    	li $v0, 4
    	la $a0, newline
    	syscall

   	 # Display R 
    	li $v0, 4
    	la $a0, LetR
    	syscall
    	li $v0, 1
    	move $a0, $s6
    	syscall
   	li $v0, 4
    	la $a0, newline
    	syscall
    
    	# Display O 
    	li $v0, 4
    	la $a0, LetO
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

# Display histogram
    	li $v0, 4
    	la $a0, LetK
    	syscall
    	move $t0, $s0
    	jal printH
	
   	li $v0, 4
    	la $a0, LetN
    	syscall
    	move $t0, $s1
    	jal printH
    	
    	li $v0, 4
    	la $a0, LetI
    	syscall
    	move $t0, $s2 
    	jal printH
    	
    	li $v0, 4
    	la $a0, LetG
    	syscall
   	move $t0, $s3 
    	jal printH

	li $v0, 4
    	la $a0, LetH
    	syscall
    	move $t0, $s4   
    	jal printH
    
    	li $v0, 4
    	la $a0, LetT
    	syscall
    	move $t0, $s5    
    	jal printH
    
    	li $v0, 4
    	la $a0, LetR
    	syscall
    	move $t0, $s6    
    	jal printH
    
    	li $v0, 4
    	la $a0, LetO
    	syscall
    	move $t0, $s7    
    	jal printH

	#exit program to avoid infinite loops
	li $v0, 10
	syscall
	
#print histogram
printH:
	beqz $t0, endH #if 0 end loop
	li $t1,0 #counter
	
hisLoop:
	beq $t1, $t0, endH
	li $v0, 4
    	la $a0, histogram #Print "#"
    	syscall
    
    	addi $t1, $t1, 1 #Increment counter
    	j hisLoop

endH:
    	li $v0, 4
    	la $a0, newline
    	syscall
    	jr $ra      