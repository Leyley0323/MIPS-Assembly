# Project 3 Part A 
# To compute the Half Debiased Estimate HDE(x) function 
# Leysha Antenor
# 4/2/25
# List of Registers used
# $t0 - Stores integer input
# $s0 - Stores input number in saved register
# $t4 - Stores exponent
# $t5 - Stores exponent / 2
# $f0 - Stores user input - float
# $f1 - Stores HDE - float
# $f2 - Temporary float storage
# $f10 - Stores float output

.data
zeroFloat: .float 0.0
halfFloat : .float 0.5
newLine: .asciiz "\n"

.text
# For printing float output purposes, load float 0.0 into $f10
l.s $f10, zeroFloat #f10 =0.0

#syscall for reading float user input of which to find the root function of
li $v0, 6 #Load service number
syscall 		#Syscall

mfc1 $t0, $f0 #save a copy(move) of input number of which to find the root function from $f0 into $t0, t0= input number 
move $s0, $t0 ##save a copy(move) of input number of which to find  root function from $f0 into $s0, s0= input number, in order to compute HDE function with it
jal HDE  ##call the function HDE to find thehalf debiased estimate of user input s0, the HDE value serves as the first educated guess for the Newtin's Method approximation


#Print float Syscall
#To Print HDE output value
li $v0, 2		#load service number
mov.s $f12, $f1 #load argument register with float HDE answer stored in f1 to print
syscall #syscall

#Exit Syscall
li $v0, 10 #LOad $v0 
syscall

#Define HDE function below here
HDE:
	#Shift left to remove S and then shift right to get E
	srl $t4, $t0, 23 #Shift user input Single Precision Floating Point binary format representation to remove S
	andi $t4, $t4, 0xFF #t4 should contain the excess 127 exponent

	#Subtract excess bias from E to get unbiased
	 addi $t4, $t4, -127 #finally $t4 should should contain the debiased exponent

	#divde by 2 
	sra $t5, $t4, 1 #finally $t5 should holds the half debiased exponent decimal answer of HDE function
	
	#Convert the binary value t5 to spfpbf into register f1
	mtc1 $t5, $f2		#copy(move) t5 to Co-processor 1  reg f2, f2 = holds HDE float	
	cvt.s.w $f1, $f2 #convert f2 value to single precision into reg f1, , f1 = holds HDE float in SPFPBF
	mfc1 $t2, $f1		#copy(move) single precision value from Co-processor 1 reg. $f1 to $t2 register, t2 = HDE value spfpbf, this will be needed for Part B of 
#project 
	
	jr $ra			#return to function calling address 
	


