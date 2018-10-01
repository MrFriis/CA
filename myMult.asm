.data
multiplier: .word 0x11111
multiplicand: .word 0x11111

.text
main:
	lw a0, multiplier
	lw a1, multiplicand
    jal x1, myMult
    add a1, zero, a0
    addi a0, zero, 1
    ecall
    addi a0, zero, 10
    ecall
    
    
myMult:
	li t0, 0 #Immediate product register
    li t1, 0 #Counter
    li t3, 1 #Constant
    li t4, 32
 loop:
 	andi t2, a0, 0x01
    bne t2, t3, shiftop
    add t0, t0, a1 #t0 = t0+multiplicand
 shiftop:
 	slli a1, a1, 1
    srli a0, a0, 1
    addi t1, t1, 1 #Count++
    bne t1, t4, loop
    add a0, zero, t0
    jalr x0, 0(x1)
    
   

    
    
    
    
