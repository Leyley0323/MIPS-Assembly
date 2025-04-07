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
    li $s0, 0  # K counter
    li $s1, 0  # N counter
    li $s2, 0  # I counter
    li $s3, 0  # G counter
    li $s4, 0  # H counter
    li $s5, 0  # T counter
    li $s6, 0  # R counter
    li $s7, 0  # O counter

    # Read input string
    li $v0, 8
    la $a0, buffer
    li $a1, 1024
    syscall

    la $t0, buffer

processString:
    lb $t1, 0($t0)  
    beqz $t1, res   

    # Convert lowercase to uppercase
    li $t4, 'a'  
    li $t5, 'z' 
    blt $t1, $t4, checkLetter
    bgt $t1, $t5, checkLetter
    addi $t1, $t1, -32  
    
checkLetter:
    li $t4, 'K'  
    beq $t1, $t4, incK
    
    li $t4, 'N'
    beq $t1, $t4, incN
    
    li $t4, 'I'
    beq $t1, $t4, incI
    
    li $t4, 'G'
    beq $t1, $t4, incG
    
    li $t4, 'H'
    beq $t1, $t4, incH
    
    li $t4, 'T'
    beq $t1, $t4, incT
    
    li $t4, 'R'
    beq $t1, $t4, incR
    
    li $t4, 'O'
    beq $t1, $t4, incO

nextChar:
    addi $t0, $t0, 1
    j processString

incK:
    addi $s0, $s0, 1
    j nextChar

incN:
    addi $s1, $s1, 1
    j nextChar

incI:
    addi $s2, $s2, 1
    j nextChar

incG:
    addi $s3, $s3, 1
    j nextChar

incH:
    addi $s4, $s4, 1
    j nextChar

incT:
    addi $s5, $s5, 1
    j nextChar

incR:
    addi $s6, $s6, 1
    j nextChar

incO:
    addi $s7, $s7, 1
    j nextChar

# Print results
res:
    li $v0, 4
    la $a0, LetK
    syscall
    li $v0, 1
    move $a0, $s0
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, LetN
    syscall
    li $v0, 1
    move $a0, $s1
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, LetI
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, LetG
    syscall
    li $v0, 1
    move $a0, $s3
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, LetH
    syscall
    li $v0, 1
    move $a0, $s4
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, LetT
    syscall
    li $v0, 1
    move $a0, $s5
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, LetR
    syscall
    li $v0, 1
    move $a0, $s6
    syscall
    li $v0, 4
    la $a0, newline
    syscall

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
    
    #print histogram
    li $v0, 4
    la $a1, LetK
    syscall
    move $a0, $s0
    jal printHistogram
    
    li $v0, 4
    la $a1, LetN
    syscall
    move $a0, $s1
    jal printHistogram
    
    li $v0, 4
    la $a1, LetI
    syscall
    move $a0, $s2
    jal printHistogram
    
    li $v0, 4
    la $a1, LetG
    syscall
    move $a0, $s3
    jal printHistogram
    
    li $v0, 4
    la $a1, LetH
    syscall
    move $a0, $s4
    jal printHistogram
    
    li $v0, 4
    la $a1, LetT
    syscall
    move $a0, $s5
    jal printHistogram
    
    li $v0, 4
    la $a1, LetR
    syscall
    move $a0, $s6
    jal printHistogram
    
    li $v0, 4
    la $a1, LetO
    syscall
    move $a0, $s7
    jal printHistogram
    
    # Exit program
    li $v0, 10
    syscall

printHistogram:
    beqz $a0, endH
    
    move $t0, $a0
    li $t1, 0  # Counter
    
    # Print letter label 
    li $v0, 4
    move $a0, $a1
    syscall

histLoop:
    beq $t1, $t0, endH
    li $v0, 4
    la $a0, histogram
    syscall
    
    addi $t1, $t1, 1
    j histLoop

endH:
    li $v0, 4
    la $a0, newline
    syscall
    jr $ra
