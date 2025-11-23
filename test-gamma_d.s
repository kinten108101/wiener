.data
	float0:         .float 0.0
	f_constM:       .float 3.0
	desired:        .float 1.0, 2.0, 3.0
	input:          .float 4.0, 5.2, 6.5
	gamma_d:        .space 12
	msg_desired:    .asciiz "input d(n): "
	msg_input:      .asciiz "input x(n): "
	msg_output:     .asciiz "output:     "
.text
.globl main
	li $s0, 3      # M=3, CONSTANT FOR THE PROGRAM
main:
	### gamma_d ###
	la $t1, desired
	la $t2, input
	la $t5, gamma_d
	li $t0, 0
	l.s $f0, float0
	jal gamma_d_loop_l
    	
	la $a0, msg_desired
	li $v0, 4
	syscall

	li $t0, 0
	la $t1, desired
print_inputd_loop:
	beq $t0, $s0, print_inputd_loop_end
	
	li $v0, 2
	lwc1 $f12, 0($t1)
	syscall
	
	li $v0, 11
	li $a0, 32
	syscall
    	
	addi $t0, $t0, 1
	addi $t1, $t1, 4
	j print_inputd_loop 
print_inputd_loop_end:
	li $v0, 11
	li $a0, 10
	syscall

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
	la $t1, gamma_d
print_loop:
	beq $t0, $s0, print_loop_end
	
	li $v0, 2
	lwc1 $f12, 0($t1)
	syscall
	
	li $v0, 11
	li $a0, 32
	syscall
    	
	addi $t0, $t0, 1
	addi $t1, $t1, 4
	j print_loop 
print_loop_end:
	li $v0, 11
	li $a0, 10
	syscall
    	
exit:
	li $v0, 10
	syscall

gamma_d_loop_l:
	# Calculate gamma d
	# Loop l 0 -> M - 1
	bge $t0, $s0, gamma_d_done
	addiu $t3, $t0, 0
	sll $t4, $t3, 2
	add $t1, $t1, $t4
	j gamma_d_loop_n
	
gamma_d_loop_n:
	# Loop n l -> M - 1
	bge $t3, $s0, gamma_d_loop_n_done
	lwc1 $f1, 0($t1) # desired[n]
	lwc1 $f2, 0($t2) # input[n]
	mul.s $f3, $f1, $f2	
	add.s $f0, $f0, $f3
	addiu $t1, $t1, 4
	addiu $t2, $t2, 4
	addiu $t3, $t3, 1
	j gamma_d_loop_n
	
gamma_d_loop_n_done:
	l.s $f1, f_constM
	mtc1 $t0, $f4
	cvt.s.w $f4, $f4
	sub.s $f1, $f1, $f4 # M - l
	div.s $f0, $f0, $f1
	add $t5, $t5, $t4
	swc1 $f0, 0($t5)
	addiu $t0, $t0, 1
	la $t1, desired
	la $t2, input
	la $t5, gamma_d
	l.s $f0, float0
	j gamma_d_loop_l
	
gamma_d_done:
	li $t0, 0
	la $t1, desired
	la $t2, input
	la $t5, gamma_d
	l.s $f0, float0
	jr $ra
