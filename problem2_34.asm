# Exercise 2.34 in text book
# Created by Martin Skovsboel Friis
# Date: 27-09-18


.data
String: .asciiz "-66678"

.text
la x10, String #Load adress of String into x10
li t0, 10 # Multiplication factor
li t1, 0 #Hold final integer
li t2, 0 #Initialize i to 0
li s0, 1 #Sign

#Check for sign
lbu t4, 0(x10)
li s1, 43 #Plus
li s2, 45 #Minus
beq t4, s1, positive
beq t4, s2, negative

L1: add t3, x10, t2 # Address of current byte
	lbu t4, 0(t3) #t4 hold current character
    beq t4, zero, L2 #If character is zero stop
    addi t4, t4, -48 #Convert to integer
    blt t4, zero, fault #Include other character
    bge t4, t0, fault #Includes other character
    mul t1, t1, t0 #Multiply the integer with 10
    add t1, t1, t4 #Add the integer to final integer
    addi t2, t2, 1 #i++
    jal x0, L1 #Loop

L2:
	add a1, t1, zero #Add integer to print register
    mul a1, a1, s0 #Multiply with sign
    li a0, 1 #Print integer
    ecall
    li a0, 10 #Environment exit
    ecall

fault:
	addi a1, zero, -24
    li a0, 1 #Print integer
    ecall
    li a0, 10
    ecall

positive:
	addi t2, t2, 1 #Increment i
    jal x0, L1 #Jump to character conversion

negative:
	li s0, -1 #Negative integer
    addi t2, t2, 1 #Increment i
    jal x0, L1 #Jump to character conversion
