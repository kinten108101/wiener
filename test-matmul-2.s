.data
	float0:         .float 0.0
	f_constM:       .float 3.0
	mat_a:          .float 1.0, 2.0, 3.0
	mat_b:          .float -1.0, 2.0, 3.0
	mat_c:          .space 12
	msg_input_a:    .asciiz "input a:\n"
	msg_input_b:    .asciiz "input b:\n"
	msg_output:     .asciiz "output:\n"
.text
.globl main
	li $s0, 3      # M=3, CONSTANT FOR THE PROGRAM
main:
	la $a0, msg_input_a
	li $v0, 4
	syscall

	li $t0, 0
	la $t1, mat_a
print_in_a_loop:
	li $t5, 1
	beq $t0, $t5, print_in_a_loop_end
	li $t2, 0

print_in_a_col_loop:
	beq $t2, $s0, print_in_a_col_loop_end
	
	li $v0, 2
	lwc1 $f12, 0($t1)
	syscall
	
	li $v0, 11
	li $a0, 32
	syscall

	addi $t2, $t2 1
	addi $t1, $t1, 4
	j print_in_a_col_loop
print_in_a_col_loop_end:
	li $v0, 11
	li $a0, 10
	syscall
    	
	addi $t0, $t0, 1
	j print_in_a_loop 
print_in_a_loop_end:
	li $v0, 11
	li $a0, 10
	syscall

	la $a0, msg_input_b
	li $v0, 4
	syscall
	
	li $t0, 0
	la $t1, mat_b
print_in_b_loop:
	beq $t0, $s0, print_in_b_loop_end
	
	li $v0, 2
	lwc1 $f12, 0($t1)
	syscall

	li $v0, 11
	li $a0, 10
	syscall
    	
	addi $t0, $t0, 1
	addi $t1, $t1, 4
	j print_in_b_loop 
print_in_b_loop_end:
	li $v0, 11
	li $a0, 10
	syscall

	la $a0, mat_c
	la $a1, mat_a
	la $a2, mat_b
	addi $a3, $zero, 1
	jal matmul
		
	la $a0, msg_output
	li $v0, 4
	syscall
	
	li $t0, 0
	la $t1, mat_c
print_out_loop:
	beq $t0, $s0, print_out_loop_end
	
	li $v0, 2
	lwc1 $f12, 0($t1)
	syscall

	li $v0, 11
	li $a0, 10
	syscall
    	
	addi $t0, $t0, 1
	addi $t1, $t1, 4
	j print_out_loop 
print_out_loop_end:
	li $v0, 11
	li $a0, 10
	syscall
    	
exit:
	li $v0, 10
	syscall

matmul:
	move $t0, $a0
	move $t9, $a1
	move $t2, $a2
	move $t3, $a3

	li  $t4, 0      # counter for row_loop
matmul_row_loop:
	bge $t4, $t3, matmul_finish 
	li $t5, 0       # counter for col_loop => USE BOTH FOR COL INDEX AND LOOP FOR Mx1 ARRAY
	lwc1 $f2, float0
matmul_col_loop:
	# idx 1st value
	bge $t5, $s0, matmul_col_finish    # s0 = M
	mul $t6, $t4, $s0   # row*M
	add $t6, $t6, $t5   # row*M + col
	sll $t6, $t6, 2     # *4 for word -> single precision
	# load 1st value
	add $t7, $t9, $t6   # base + offset
	lwc1 $f0, 0($t7)
	# idx 2nd value
	sll $t6, $t5, 2     # second is always (Mx1) => treat it like array
	add $t7, $t2, $t6   # base + offset
	lwc1 $f1, 0($t7)
	# cal
	mul.s $f0, $f0, $f1
	add.s $f2, $f2, $f0 # => f2 result

	addi $t5, $t5, 1
	j matmul_col_loop
matmul_col_finish:
	# idx for output value
	# Result is always a column vector, so just use row index
	move $t6, $t4    # row*M + 0
	sll $t6, $t6, 2     
	add $t7, $t0, $t6   # base + offset
	swc1 $f2, 0($t7)
	addi $t4, $t4, 1
	j matmul_row_loop

matmul_finish:
	jr $ra

