.data
	float0:         .float 0.0
	f_constM:       .float 3.0
	input:          .float 1.0, 2.0, 3.0
	h:              .float 4.0, 5.2, 6.5
	y:              .space 12
	msg_input:      .asciiz "input x(n): "
	msg_h:          .asciiz "input h(n): "
	msg_output:     .asciiz "output: "
.text
.globl main
	li $s0, 3      # M=3, CONSTANT FOR THE PROGRAM
main:

	### y(n)
	li $t0, 0			# -> n
y_n_loop:
	beq $t0, $s0, y_n_loop_finish
	li $t1, 0			# -> k
	la $t9, float0
	l.s  $f9, 0($t9)
y_k_loop:
	bgt $t1, $t0, y_k_loop_finish
	la $t9, h
	sll $t2, $t1, 2		# index* 4
	add $t9, $t9, $t2
	lwc1 $f4, 0($t9)		# -> h(k)
	la $t9, input
	sub $t2, $t0, $t1       # n - k
	sll $t2, $t2, 2
	add $t9, $t9, $t2
	lwc1 $f5, 0($t9)		# -> x(n-k)
	mul.s $f6, $f4, $f5
	add.s $f9, $f9, $f6 # sum h(k)x(n-k)
	addi $t1, $t1, 1
	j y_k_loop

y_k_loop_finish:
	la $t9, y
	sll $t2, $t0, 2
	add $t9, $t9, $t2
	swc1 $f9, 0($t9)
	addi $t0, $t0, 1
	j y_n_loop

y_n_loop_finish:
    	
	la $a0, msg_input
	li $v0, 4
	syscall

	li $t0, 0
	la $t1, input
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

	la $a0, msg_h
	li $v0, 4
	syscall

	li $t0, 0
	la $t1, h
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
	la $t1, y
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

