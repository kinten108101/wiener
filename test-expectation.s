.data
	float0:         .float 0.0
	f_constM:       .float 3.0
	desired:        .float 1.0, 2.0, 3.0
	msg_input:      .asciiz "input:  "
	msg_output:     .asciiz "output: "
.text
.globl main
	li $s0, 3      # M=3, CONSTANT FOR THE PROGRAM
main:
	la $t1, desired
	li $t0, 0
	l.s $f0, float0
	jal sum
	
	la $a0, msg_input
	li $v0, 4
	syscall
	
	li $t0, 0
	la $t1, desired
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
	
	la $a0, msg_output
	li $v0, 4
	syscall
	
	mov.s $f12, $f11       # f31 save sigma^2
	li $v0, 2
	syscall
	
	li $v0, 11
	li $a0, 10
	syscall
exit:
	li $v0, 10
	syscall

sum:
	# Calculate sum of desired array
	bge $t0, $s0, mean
	lwc1 $f1, 0($t1)
	add.s $f0, $f0, $f1
	addiu $t1, $t1, 4
	addiu $t0, $t0, 1
	j sum
	
mean:
	# Calculate mean of array
	l.s $f1, f_constM
	div.s $f2, $f0, $f1
	li $t0, 0
	l.s $f0, float0
	la $t1, desired
	j variance
	
variance:
	# Calculate variance with mean of desired array
	bge $t0, $s0, variance_done
	lwc1 $f1, 0($t1)
	sub.s $f1, $f1, $f2
	mul.s $f1, $f1, $f1
	add.s $f0, $f0, $f1
	addiu $t1, $t1, 4
	addiu $t0, $t0, 1
	j variance
	
variance_done:
	l.s $f1, f_constM
	div.s $f11, $f0, $f1		# f11 = variance with mean
	l.s $f0, float0
	li $t0, 0
	la $t1, desired
	jr $ra
