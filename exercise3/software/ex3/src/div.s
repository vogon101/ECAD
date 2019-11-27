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

.global div
.type div, @function
div:
	SAVE_RETURN

	# N = a0
	# D = a1 

	li t0, 0  # Q = t0
	li t1, 0  # R = t1
	li t2, 32 # i = t2

div_startloop:
	# for t2 = 31...0
	beq t2, zero, div_endloop

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
	BLT t1, a1, div_endif

	# R -= D
	SUB t1, t1, a1

	# Q[i] = 1
	# t3[i] will contain a one
	li t3, 1
	sll t3, t3, t2
	add t0, t0, t3
	
div_endif:
	j div_startloop
	
	
div_endloop:
	# Q
	#DEBUG_PRINT t0
	# R
	#DEBUG_PRINT t1
	# i
	#DEBUG_PRINT t2

	li a0, 0
	li a1, 0
	add a0, zero, t0

	RETURN

.global rem
.type rem, @function
rem:
	SAVE_RETURN

	#DEBUG_PRINT a0
	#DEBUG_PRINT a1

	# N = a0
	# D = a1 

	li t0, 0  # Q = t0
	li t1, 0  # R = t1
	li t2, 32 # i = t2
	li t3, 0

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
	li t3, 0
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
	add a0, zero, t1

	RETURN

	
