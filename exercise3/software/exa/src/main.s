.macro  DEBUG_PRINT     reg
	csrw 0x7b2, \reg
.endm

.macro SAVE_RETURN
	addi sp,sp,-32
	sw ra, 0(sp)
.endm

.macro RETURN
	lw ra, 0(sp)
	addi sp,sp,32
	ret
.endm

.text
myfunction:
	addi sp,sp,-32	# Allocate stack space
	
	# store any callee-saved register you might overwrite
	sw ra, 0(sp)
	
	# do your work
        addi    a0, zero, 12    # a0 <- 12
        addi    a1, zero, 4     # a1 <- 4
        call    div
        DEBUG_PRINT a0          # display the quotient
        DEBUG_PRINT a1          # display the remainder

        addi    a0, zero, 93    # a0 <- 93
        addi    a1, zero, 7     # a1 <- 7
        call    div
        DEBUG_PRINT a0          # display the quotient
        DEBUG_PRINT a1          # display the remainder

        lui     a0, (0x12345000>>12)
        ori     a0, a0, 0x678   # a0 <- 0x12345678
        addi    a1, zero, 255   # a1 <- 255
        call    div
        DEBUG_PRINT a0          # display the quotient
        DEBUG_PRINT a1          # display the remainder
	
	
	# load every register you stored above
	lw ra, 0(sp)
	addi sp,sp,32 	# Free up stack space
	ret

div:
	SAVE_RETURN

	# N = a0
	# D = a1 

	li t0, 0  # Q = t0
	li t1, 0  # R = t1
	li t2, 32 # i = t2

startloop:
	# for t2 = 31...0
	beq t2, zero, endloop

	# decrement i
	addi t2, t2, -1
	
	#DEBUG_PRINT t0
	#DEBUG_PRINT t1
	#DEBUG_PRINT t2

	# R := R << 1
	slli t1, t1, 1

	# R(0) := N(i)	
	# LSb of t3 is equal to N[i]
	srl  t3, a0, t2
	andi t3, t3, 1
	add  t1, t1, t3

	# if (R >= D)
	BLT t1, a1, endif

	# R -= D
	SUB t1, t1, a1

	# Q[i] = 1
	# t3[i] will contain a one
	li t3, 1
	sll t3, t3, t2
	add t0, t0, t3
	
endif:
	j startloop
	
	
endloop:
	# Q
	#DEBUG_PRINT t0
	# R
	#DEBUG_PRINT t1
	# i
	#DEBUG_PRINT t2

	li a0, 0
	li a1, 0
	add a0, zero, t0
	add a1, zero, t1

	RETURN

	

.global main		# Export the symbol 'main' so we can call it from other files
.type main, @function
main:
	addi sp,sp,-32 	# Allocate stack space
	sw ra, 0(sp)
	call myfunction # and jump to a function
	lw ra, 0(sp)
	addi sp,sp,32 	# Free up stack space
	ret
