.data
	float0:         .float 0.0
	f_constM:       .float 10.0
	input:          .float 3.2, 2.8, 5.9, -2.3, -0.3, -8.3, 1.0, 9.1, 4.6, 5.6
	Rm:             .space 400
	msg_input:      .asciiz "input: "
	msg_output:     .asciiz "output:\n"
.text
.globl main
	li $s0, 10      # M=10, CONSTANT FOR THE PROGRAM
main:
	### Rm ###
	la $t2, input
	la $t6, Rm
	li $t0, 0
	l.s $f0, float0
	jal R_M_loop_k
    	
	la $a0, msg_input
	li $v0, 4
	syscall

	li $t0, 0
	la $t1, input
print_inputx_loop:
	beq $t0, $s0, print_inputx_loop_end
	
	li $v0, 2
	lwc1 $f12, 0($t1)
	syscall
	
	li $v0, 11
	li $a0, 32
	syscall
    	
	addi $t0, $t0, 1
	addi $t1, $t1, 4
	j print_inputx_loop 
print_inputx_loop_end:
	li $v0, 11
	li $a0, 10
	syscall

	la $a0, msg_output
	li $v0, 4
	syscall

	li $t0, 0
	la $t1, Rm
print_in_a_loop:
	beq $t0, $s0, print_in_a_loop_end
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

	
exit:
	li $v0, 10
	syscall
R_M_loop_k:
	# Calculate RM
	# Loop k 0 -> M - 1
	bge $t0, $s0, R_M_done
	li $t3, 0
	j R_M_loop_l
	
R_M_loop_l:
	# Loop l 0 -> M - 1
	bge $t3, $s0, R_M_loop_l_done
	sub $t4, $t3, $t0
	abs $t4, $t4
	la $t7, input
	sll $t8, $t4, 2
	add $t7, $t7, $t8
	j R_M_loop_n
	
R_M_loop_l_done:
	addiu $t0, $t0, 1
	j R_M_loop_k
	
R_M_loop_n:
	# Loop n |l - k| -> M - 1
	bge $t4, $s0, R_M_loop_n_done
	lwc1 $f1, 0($t2)
	lwc1 $f2, 0($t7)
	mul.s $f3, $f1, $f2
	add.s $f0, $f0, $f3
	addiu $t2, $t2, 4
	addiu $t7, $t7, 4
	addiu $t4, $t4, 1
	j R_M_loop_n
	
R_M_loop_n_done:
	l.s $f1, f_constM
	sub $t4, $t3, $t0
	abs $t4, $t4
	mtc1 $t4, $f4
	cvt.s.w $f4, $f4
	# sub.s $f1, $f1, $f4
	div.s $f0, $f0, $f1
	add $t7, $zero, $t3
    move $t8, $s0
	mul $t8, $t8, $t0
	add $t7, $t7, $t8
	sll $t7, $t7, 2
	add $t6, $t6, $t7
	swc1 $f0, 0($t6)
	addiu $t3, $t3, 1
	la $t2, input
	la $t6, Rm
	l.s $f0, float0
	j R_M_loop_l
	
R_M_done:
	li $t0, 0
	la $t2, input
	la $t6, Rm
	l.s $f0, float0
    jr $ra

