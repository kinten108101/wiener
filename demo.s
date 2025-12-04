.data
input:          .space 40   # 10 floats = 10 * 4 bytes
desired:        .space 40       
# variable
MMSE:          .space 4    # 1 float    
y:              .space 40   # Mx1 x 4byte
gamma_d:        .space 40   # Mx1 x 4byte
gamma_d_T:      .space 40   # 1xM x 4byte (gamma_d transpose)
Rm:             .space 400  # MxM x 4byte
Rm_inverse:     .float 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0
0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0
0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0
0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0
0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0
det:		    .space 400 
cofactor:       .space 400  # MxM x 4byte
h:              .space 40   # Mx1 x 4byte
gamma_h_gamma:	.space 1		# 1 value
buffer_input:   .space 512
buffer_desired: .space 512  # save the string of float array
buffer_output:  .space 512  # save the string of float array
float0:         .float 0.0
f_constM:       .float 10.0
epsilon: 		.float 1e-12
input_file:     .asciiz "/home/kinten/u/wiener/data/input.txt"	
desired_file:   .asciiz "/home/kinten/u/wiener/data/desired.txt"
output_file:    .asciiz "/home/kinten/u/wiener/data/output.txt"
msg_done:       .asciiz "Files loaded successfully.\n"
msg_filter:     .asciiz "Filtered output: "
msg_MMSE:       .asciiz "MMSE: "
newline:        .asciiz "\n"
msg_output:     .space 512      # store final string

# debug log
MMSE_:      .asciiz "\nMMSE: \n"
h_:        .asciiz "\nh: \n"
y_:        .asciiz "\ny: \n"
Rm_:       .asciiz "\nRm: \n"
Rm_inv_:   .asciiz "\nRm_inverse: \n"
gamma_d_:  .asciiz "\ngamma_d: \n"
gamma_h_gamma_: .asciiz "\ngamma_h_gamma: \n"
sigma2_:  .asciiz "\nsigma^2: \n"


.text
.globl main
    li $s0, 10      # M=10, CONSTANT FOR THE PROGRAM

main:
    #### READ input.txt #### 
    la   $a0, input_file
    la   $a1, input          # destination array
    la   $a2, buffer_input
    jal  read_floats

    #### READ desired.txt ####
    la   $a0, desired_file
    la   $a1, desired
    la   $a2, buffer_desired
    jal  read_floats

################## CALCULATION ###################
	### sigma^2 => use normal sigma with mean ###
    la $t1, desired
    li $t0, 0
    l.s $f0, float0
    jal sum_square
    mov.s $f31, $f10       # f31 save sigma^2
    
    ### gamma_d ###
    la $t1, desired
    la $t2, input
    la $t5, gamma_d
    li $t0, 0
    l.s $f0, float0
    jal gamma_d_loop_l

    ### Rm ###
    la $t2, input
    la $t6, Rm
    li $t0, 0
    l.s $f0, float0
    jal R_M_loop_k

    ### DEBUG ###
    la   $a0, Rm_
    li   $v0, 4              # syscall: print string
    syscall
    la   $a0, Rm
    li $a1, 100
    jal  print_float_array
	### ### ###

	### Rm^-1 ###
    la $s1, Rm
	la $s2, Rm_inverse
	li $t0, 0
	li $s3, 100
	mtc1 $zero, $f0
	move $t1, $s1
	move $t2, $s2
    jal gauss_jordan_inverse
	
    ### h = Rm^-1 * gamma_d ### => test với Rm trước, inverse sau
    la $a0, h
    la $a1, Rm_inverse
    la $a2, gamma_d
    move $a3, $s0
    jal matmul
  	
    ### gamma_dT * h ###
    la $a0, gamma_h_gamma 
    la $a1, h
    la $a2, gamma_d
    li $a3, 1
    jal matmul
	
    ### MMSE
    la $t0, gamma_h_gamma
    lwc1 $f2, 0($t0)
	sub.s $f3, $f31, $f2 		# MMSE	
    la $t9, MMSE
    swc1 $f3, 0($t9)            # save MMSE

	
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
	sub $t2, $s0, $t1       # n - k
	addi $t2, $t2, -1
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

################## CALCULATION ###################

	### Print input array ####
    la   $a0, h_
    li   $v0, 4              # syscall: print string
    syscall
    la   $a0, h
    move $a1, $s0
    jal  print_float_array

    #### Print desired array ####
    la   $a0, Rm_
    li   $v0, 4              # syscall: print string
    syscall
    la   $a0, Rm
    li $a1, 100
    jal  print_float_array

    #### Print desired array ####
    la   $a0, Rm_inv_
    li   $v0, 4              # syscall: print string
    syscall
    la   $a0, Rm_inverse
    li $a1, 100
    jal  print_float_array

    ### Print gamma_d ####
    la   $a0, gamma_d_
    li   $v0, 4              # syscall: print string
    syscall
    la   $a0, gamma_d
    move $a1, $s0
    jal  print_float_array

    #### Print desired array ####
    la   $a0, gamma_h_gamma_
    li   $v0, 4              # syscall: print string
    syscall
    la   $a0, gamma_h_gamma
    li  $a1, 3
    jal  print_float_array

    ####  Print sigma^2  ####
    la   $a0, sigma2_
    li   $v0, 4              # syscall: print string
    syscall
    mov.s $f12, $f31
    li   $v0, 2              # syscall: print float
    syscall

    #### Print desired array ####
    la   $a0, MMSE_
    li   $v0, 4              # syscall: print string
    syscall
    la $a0, MMSE
    li $a1, 1
    jal print_float_array
	
    ### Print y(n) ###
    la   $a0, y_
    li   $v0, 4              # syscall: print string
    syscall
    la   $a0, y
    move $a1, $s0
    jal  print_float_array

	#### Export file ####
	la $a0, output_file
	la $a1, y
	jal export_file

    # #### Exit ####
    # li   $v0, 10
    # syscall

exit:
    li $v0, 10
    syscall

############################################################
################## FUNCTIONS ###################
############################################################
# read_floats
# Arguments:
#   $a0 = filename
#   $a1 = destination array
#   $a2 = buffer
# temp reg: $t0, $t9, $t2, $t9
############################################################
read_floats:
    move $t0, $a0       # filename
    move $t9, $a1       # array
    move $t2, $a2
    addi $sp, $sp, -4
    sw $ra, 0($sp)       # temporary save ra

    # Open file
    li   $v0, 13         
    la   $a0, 0($t0)
    li   $a1, 0         # read-only
    syscall
    move $a0, $v0       # move descriptor to a0 to read/close file

    # Read file
    li   $v0, 14
    move $a1, $t2       # move buffer to a1
    li   $a2, 512
    syscall

    # Close file
    li   $v0, 16
    syscall  

    # Parse buffer into floats
    move $t0, $t2      # pointer to buffer, t0 new use

read_floats_loop:
    lb   $t2, 0($t0)       # read character
    beqz $t2, read_floats_done   # end of buffer
    beq  $t2, 13, read_floats_done     # carriage return for some window files

    # skip whitespace
    beq  $t2, 32, read_floats_skip     # space
    beq  $t2, 10, read_floats_skip     # newline

    # parse number
    jal  parse_float
    swc1 $f0, 0($t9)
    addi $t9, $t9, 4
    j   read_floats_loop    # t0 is already increase in the parse_float

read_floats_skip:
    addi $t0, $t0, 1
    j   read_floats_loop

read_floats_done:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
############################################################
# parse_float => when read_floats meet a number -> read the float right away
# Arguments:
#   $t0 = address to file content => reference from t0 in read_floats
# Returns:
#   $f0 = parsed float
# temp reg: $t0, $t3, $t4, $t5, $t6, $t7
############################################################
parse_float:
    li   $t3, 0        # integer part
    li   $t4, 0        # fractional part
    li   $t6, 1        # sign flag => final result mul with $t6

parse_float_int_loop:
    lb   $t7, 0($t0)
    beqz $t7, parse_float_return
    beq  $t7, 13, parse_float_return     # carriage return for some window files
    beq  $t7, 32, parse_float_return
    beq  $t7, 10, parse_float_return
    beq  $t7, 45, parse_float_negative  # '-'=45

    beq  $t7, 46, parse_float_after_decimal   # '.'

    # digit
    addi $t7, $t7, -48     # ex: '0'->48(ASCII)
    mul  $t3, $t3, 10
    add  $t3, $t3, $t7
    addi $t0, $t0, 1
    j    parse_float_int_loop

parse_float_negative:
    li $t6, -1
    addi $t0, $t0, 1
    j parse_float_int_loop

parse_float_after_decimal:
    addi $t0, $t0, 1

parse_float_frac_loop:
    # cannot use approach like integer => track number of fractional part and divide it later
    lb   $t7, 0($t0)
    blt  $t7, 48, parse_float_finish
    bgt  $t7, 57, parse_float_finish
    addi $t7, $t7, -48
    mul  $t4, $t4, 10
    add  $t4, $t4, $t7
    addi $t0, $t0, 1
    j    parse_float_frac_loop

parse_float_finish:
    # convert to float
    mtc1 $t3, $f0           # move value of t3 to f0
    cvt.s.w $f0, $f0        # convert value in f0 to float

    mtc1 $t4, $f1
    cvt.s.w $f1, $f1

    # based on assignment, floating numbers have only 1 decimal point
    li $t5, 10
    mtc1 $t5, $f2
    cvt.s.w $f2, $f2
    div.s $f1, $f1, $f2
    add.s $f0, $f0, $f1

    # sign
    mtc1 $t6, $f2
    cvt.s.w $f2, $f2
    mul.s $f0, $f0, $f2
parse_float_return:
    jr $ra

############################################################
# print_float_array
# Arguments:
#   $a0 = address of float array
#   $a1 = number of floats
# Prints each float on a new line
# temp reg: $t0, $t9, $t2, $t3, $t4
############################################################
print_float_array:
    move $t0, $a0
    move $t9, $a1
    li   $t2, 0              # index = 0
print_loop:
    beq  $t2, $t9, done_print

    # load float from array
    sll  $t3, $t2, 2         # offset = index * 4
    add  $t4, $t0, $t3
    lwc1 $f12, 0($t4)

    # print float
    li   $v0, 2              # syscall: print float
    syscall

    # print newline
    li   $v0, 11
    # li   $a0, 10             # '\n'
    li   $a0, 32             # ' '
    syscall

    addi $t2, $t2, 1
    j    print_loop

done_print:
    jr $ra
############################################################
# export_file (level 1) called int2string => export y(n) (Mx1) to file
# Arguments:
#   $a0 = filename
#   $a1 = float array
############################################################
export_file:
    move $t0, $a0
    move $t1, $a1
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # convert load array to string
    li $t2, 0           # track index to write in output => final is the length
    li $t3, 0           # counter for array loop
    la $t9, buffer_output

export_file_loop:
    bge $t3, $s0, export_file_finish        # s0=M constant
    sll $t4, $t3, 2     # offset = index*4
    add $t4, $t1, $t4   # base + offset
    lwc1 $f0, 0($t4)
    
    # convert integer part
    trunc.w.s $f1, $f0
    mfc1 $t5, $f1 			# t5 correct but f1 is NaN => load f1 back from t5 and convert
    mtc1 $t5, $f1
    cvt.s.w $f1, $f1	
    bltz $t5, export_file_int_neg
    j export_file_reverse

export_file_int_neg:
    li $t6, -1
    mul $t5, $t5, $t6
    li $t6, 45
    add $t7, $t9, $t2      # base + offset
    sb $t6, 0($t7)          # save '-' to buffer
    addi $t2, $t2, 1

export_file_reverse:
    li $t8, 0           # store reverse integer before converting

export_file_reverse_loop:
    li $t6, 10
    div $t5, $t6
    mflo $t5            # quotion on $t5 for next loop
    mfhi $t7            # remainder for converting
    mul $t8, $t8, $t6
    add $t8, $t8, $t7
    bnez $t5, export_file_reverse_loop

export_file_int:
    move $t5, $t8       # save to t5 to convert integer part to string

export_file_int_loop:
    li $t6, 10
    div $t5, $t6
    mflo $t5            # quotion on $t5 for next loop
    mfhi $t7            # remainder for converting
    move $a0, $t7
    move $a1, $t9
    jal int2string
    bnez $t5, export_file_int_loop

export_file_fraction:
    sub.s $f2, $f0, $f1     # extract fraction
    abs.s $f2, $f2          # make fraction positive
    li $t5, 10  
    mtc1 $t5, $f3  
    cvt.s.w	$f3, $f3         
    mul.s $f4, $f2, $f3     # mul with 10 to shift 1 decimal point up         
    round.w.s $f4, $f4      # round integer => decimal point digit is rounded
    # cvt.w.s $f4, $f4
    mfc1 $t6, $f4           # move to extract last digit of integer (which is the decimal point)
    
    # add '.' to buffer
    li $t7, 46              # '.' = 46
    add $t8, $t9, $t2
    sb $t7, 0($t8)
    addi $t2, $t2, 1
    
    # convert decimal point digit to string
    li $t5, 10
    div $t6, $t5            
    mfhi $a0                # a0 is the decimal point digit to convert to string
    move $a1, $t9
    jal int2string
    
    # add ' ' to buffer
    li $t7, 32              # ' ' = 32
    add $t8, $t9, $t2
    sb $t7, 0($t8)
    addi $t2, $t2, 1

    # back to loop
    addi $t3, $t3, 1
    j export_file_loop

export_file_finish:
    li $t7, 0              # null terminator
    add $t8, $t9, $t2
    sb $t7, 0($t8)
    addi $t2, $t2, 1       # => THIS IS THE LENGTH OF OUTPUT (MAY NOT BE USED)

export_file_process:
    # copy all message into the final msg_output
    li $s1, 0               # track final msg_output length
    la $s2, msg_filter
    la $s3, msg_output      # <= FINAL OUTPUT STRING
    li $t9, 0               # counter for each file loop

export_file_msg_filter_copy:
    add $t3, $t9, $s2
    lb $t4, 0($t3)  
    beqz $t4, export_file_msg_filter_finish
    add $t3, $s1, $s3
    sb $t4, 0($t3)
    addi $s1, $s1, 1
    addi $t9, $t9, 1
    j export_file_msg_filter_copy

export_file_msg_filter_finish:
    la $s2, buffer_output
    li $t9, 0

export_file_buffer_output_copy:
    add $t3, $t9, $s2
    lb $t4, 0($t3)  
    beqz $t4, export_file_buffer_output_finish
    add $t3, $s1, $s3
    sb $t4, 0($t3)
    addi $s1, $s1, 1
    addi $t9, $t9, 1
    j export_file_buffer_output_copy

export_file_buffer_output_finish:
    li $t9, 10
    add $t3, $s1, $s3
    sb $t9, 0($t3)          # '/n'
    addi $s1, $s1, 1

    la $s2, msg_MMSE
    li $t9, 0

export_file_msg_mmse_copy:
    add $t3, $t9, $s2
    lb $t4, 0($t3)  
    beqz $t4, export_file_msg_mmse_finish
    add $t3, $s1, $s3
    sb $t4, 0($t3)
    addi $s1, $s1, 1
    addi $t9, $t9, 1
    j export_file_msg_mmse_copy

export_file_msg_mmse_finish:
    ##############################################################
    ####### CONVERT MMSE TO STRING AND APPEND TO msg_output ######
    ##############################################################
    la $t9, MMSE
    lwc1 $f0, 0($t9)
    la $s4, msg_output
    
    # convert integer part
    trunc.w.s $f1, $f0
    mfc1 $t5, $f1 			# t5 correct but f1 is NaN => load f1 back from t5 and convert
    mtc1 $t5, $f1
    cvt.s.w $f1, $f1	
    bltz $t5, export_file_mmse_neg
    j export_file_mmse_reverse

export_file_mmse_neg:
    li $t6, -1
    mul $t5, $t5, $t6
    li $t6, 45
    add $t7, $s4, $s1      # base + offset
    sb $t6, 0($t7)          # save '-' to buffer
    addi $s1, $s1, 1

export_file_mmse_reverse:
    li $t8, 0           # store reverse integer before converting

export_file_mmse_reverse_loop:
    li $t6, 10
    div $t5, $t6
    mflo $t5            # quotion on $t5 for next loop
    mfhi $t7            # remainder for converting
    mul $t8, $t8, $t6
    add $t8, $t8, $t7
    bnez $t5, export_file_mmse_reverse_loop

export_file_mmse_int:
    move $t5, $t8       # save to t5 as the converted int to convert integer part to string

export_file_mmse_int_loop:
    li $t6, 10
    div $t5, $t6
    mflo $t5            # quotion on $t5 for next loop
    mfhi $t7            # remainder for converting
    move $a0, $t7
    move $a1, $s4
    move $t2, $s1
    jal int2string
    move $s1, $t2
    bnez $t5, export_file_mmse_int_loop

export_file_mmse_fraction:
    sub.s $f2, $f0, $f1     # extract fraction
    abs.s $f2, $f2          # make fraction positive
    li $t5, 10  
    mtc1 $t5, $f3  
    cvt.s.w	$f3, $f3         
    mul.s $f4, $f2, $f3     # mul with 10 to shift 1 decimal point up         
    round.w.s $f4, $f4      # round integer => decimal point digit is rounded
    # cvt.w.s $f4, $f4
    mfc1 $t6, $f4           # move to extract last digit of integer (which is the decimal point)
    
    # add '.' to buffer
    li $t7, 46              # '.' = 46
    add $t8, $s4, $s1
    sb $t7, 0($t8)
    addi $s1, $s1, 1
    
    # convert decimal point digit to string
    li $t5, 10
    div $t6, $t5            
    mfhi $a0                # a0 is the decimal point digit to convert to string
    move $a1, $s4
    move $t2, $s1
    jal int2string
    move $s1, $t2

    # # add null terminator
    # li $t7, 0              # null terminator
    # add $t8, $s4, $s1
    # sb $t7, 0($t8)
    # addi $s1, $s1, 1       # => THIS IS THE LENGTH OF OUTPUT

export_file_write:
    li $v0, 13
    la $a0, output_file
    li $a1, 1
    syscall
    move $a0, $v0       # => copy file descriptor to write/close

    li $v0, 14
    la $a1, msg_output
    move $a2, $s1
    syscall

    li $v0, 15
    syscall

export_file_exit:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

############################################################
# int2string (level 2) => convert and append int digit to string
# Arguments:
#   $a0 = digit
#   $a1 = addr of string buffer
# temp reg: $t2(reference)
############################################################
int2string:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    addi $a0, $a0, 48       # 9 + 48 = '9'
    add $a1, $a1, $t2       # base + offset
    sb $a0, 0($a1)
    addi $t2, $t2, 1        # increase to record idx and length

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra


############################################################

# use row-major approach => index = row*M + col
# matmul => only 2 case: (MxM)x(Mx1); (1xM)x(Mx1)
# Arguments:
#   $a0 = output matrix
#   $a1 = 1st matrix
#   $a2 = 2nd matrix => always (Mx1)
#   $a3 = No.rows of 1st matrix
############################################################
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

######################### DAnh #############################
sum_square:
	# Calculate sum of square of desired array
	bge $t0, $s0, var_done
	lwc1 $f1, 0($t1)
	mul.s $f1, $f1, $f1
	add.s $f0, $f0, $f1
	addiu $t1, $t1, 4
	addiu $t0, $t0, 1
	j sum_square
var_done:
	# Calculate variance without mean of desired array
	l.s $f1, f_constM
	div.s $f10, $f0, $f1 		# f10 = variance without mean
	l.s $f0, float0
	li $t0, 0
	la $t1, desired
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
	lwc1 $f1, 0($t1)
	lwc1 $f2, 0($t2)
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
	# sub.s $f1, $f1, $f4
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


############################# INVERSE #############################
gauss_jordan_inverse:
    la $s2, Rm          # $s2 = base address of Rm
    la $s3, Rm_inverse  # $s3 = base address of inverse Rm
    li $s4, 10              # $s4 = n = 10 (Rm size)
    
    li $t0, 0               # $t0 = i (current row)
    
outer_loop:
    bge $t0, $s4, done      # if i >= n, done
    
    # 1. pivot (absolute value lớn nhất của cột i) ===
    move $t1, $t0           # $t1 = pivot_row = i
    mtc1 $zero, $f0      # $f0 = max_val = 0.0 để track max
    abs.s $f0, $f0
    
    move $t2, $t0           # $t2 = r (row counter tìm pivot)
find_pivot:
    bge $t2, $s4, pivot_found
    
    # Calculate address: Rm[r][i] = Rm + (r*10 + i)*4
    mul $t3, $t2, $s4       # $t3 = r * 10
    add $t3, $t3, $t0       # $t3 = r*10 + i
    sll $t3, $t3, 2         # $t3 = (r*10 + i) * 4
    add $t3, $t3, $s2       # $t3 = address of Rm[r][i]
    lwc1 $f1, 0($t3)        # $f1 = Rm[r][i]
    abs.s $f1, $f1          # $f1 = |Rm[r][i]|
    
    c.le.s $f1, $f0         # if |Rm[r][i]| <= max_val
    bc1t skip_update
    mov.s $f0, $f1          # max_val = |Rm[r][i]|
    move $t1, $t2           # pivot_row = r
skip_update:
    addi $t2, $t2, 1
    j find_pivot
    
pivot_found:
    # Check pivot < epsilon (singular) => nếu có thì done
    lwc1 $f2, epsilon
    c.lt.s $f0, $f2       
    bc1t done             
    
    # 2. Swap row i với row pivot pivot_row
    beq $t0, $t1, no_swap # nếu khác thì đổi
    
    li $t2, 0               # $t2 = col counter
swap_matrix:
    bge $t2, $s4, swap_inverse
    
    # Swap Rm[i][col] with Rm[pivot_row][col]
    mul $t3, $t0, $s4
    add $t3, $t3, $t2
    sll $t3, $t3, 2
    add $t3, $t3, $s2       # Rm[i][col]
    
    mul $t4, $t1, $s4
    add $t4, $t4, $t2
    sll $t4, $t4, 2
    add $t4, $t4, $s2       # Rm[pivot_row][col]
    
    lwc1 $f3, 0($t3)
    lwc1 $f4, 0($t4)
    swc1 $f4, 0($t3)
    swc1 $f3, 0($t4)
    
    addi $t2, $t2, 1
    j swap_matrix
    
swap_inverse:
    li $t2, 0
swap_inv_loop:
    bge $t2, $s4, no_swap
    
    # Swap Rm_inverse[i][col] with Rm_inverse[pivot_row][col]
    mul $t3, $t0, $s4
    add $t3, $t3, $t2
    sll $t3, $t3, 2
    add $t3, $t3, $s3
    
    mul $t4, $t1, $s4
    add $t4, $t4, $t2
    sll $t4, $t4, 2
    add $t4, $t4, $s3
    
    lwc1 $f3, 0($t3)
    lwc1 $f4, 0($t4)
    swc1 $f4, 0($t3)
    swc1 $f3, 0($t4)
    
    addi $t2, $t2, 1
    j swap_inv_loop
    
no_swap:
    # 3. Normalize row, chia cho Rm[i][i] => xét tới hàng i thì cột i là dùng để normalize => đầu hàng là 1
    mul $t3, $t0, $s4
    add $t3, $t3, $t0
    sll $t3, $t3, 2
    add $t3, $t3, $s2
    lwc1 $f5, 0($t3)        # $f5 = divisor = Rm[i][i]
    
    li $t2, 0               # $t2 = col
normalize_matrix:
    bge $t2, $s4, normalize_inverse
    
    mul $t3, $t0, $s4
    add $t3, $t3, $t2
    sll $t3, $t3, 2
    add $t3, $t3, $s2
    
    lwc1 $f6, 0($t3)
    div.s $f6, $f6, $f5
    swc1 $f6, 0($t3)
    
    addi $t2, $t2, 1
    j normalize_matrix
    
normalize_inverse:
    li $t2, 0
normalize_inv_loop:
    bge $t2, $s4, eliminate
    
    mul $t3, $t0, $s4
    add $t3, $t3, $t2
    sll $t3, $t3, 2
    add $t3, $t3, $s3
    
    lwc1 $f6, 0($t3)
    div.s $f6, $f6, $f5
    swc1 $f6, 0($t3)
    
    addi $t2, $t2, 1
    j normalize_inv_loop
    
eliminate:
    # 4. Eliminate col => biến tất cả các hàng ở dưới thành 0
    li $t2, 0               # $t2 = r (row to eliminate)
elim_row_loop:
    bge $t2, $s4, next_pivot
    beq $t2, $t0, skip_row  # skip pivot row
    
    # Get factor = Rm[r][i] => value đầu hàng của mấy hàng khác để nhân với 1 của pivot sau đó trừ
    mul $t3, $t2, $s4
    add $t3, $t3, $t0
    sll $t3, $t3, 2
    add $t3, $t3, $s2
    lwc1 $f7, 0($t3)        # $f7 = factor
    
    # Eliminate
    li $t4, 0               # $t4 = col
elim_matrix_col:
    bge $t4, $s4, elim_inverse_col
    
    # Rm[r][col] -= factor * Rm[i][col]
    mul $t5, $t2, $s4
    add $t5, $t5, $t4
    sll $t5, $t5, 2
    add $t5, $t5, $s2       # Rm[r][col]
    
    mul $t6, $t0, $s4
    add $t6, $t6, $t4
    sll $t6, $t6, 2
    add $t6, $t6, $s2       # Rm[i][col]
    
    lwc1 $f8, 0($t5)
    lwc1 $f9, 0($t6)
    mul.s $f9, $f7, $f9
    sub.s $f8, $f8, $f9
    swc1 $f8, 0($t5)
    
    addi $t4, $t4, 1
    j elim_matrix_col
    
elim_inverse_col:
    li $t4, 0
elim_inv_col_loop:
    bge $t4, $s4, skip_row
    
    # Rm_inverse[r][col] -= factor * Rm_inverse[i][col]
    mul $t5, $t2, $s4
    add $t5, $t5, $t4
    sll $t5, $t5, 2
    add $t5, $t5, $s3
    
    mul $t6, $t0, $s4
    add $t6, $t6, $t4
    sll $t6, $t6, 2
    add $t6, $t6, $s3
    
    lwc1 $f8, 0($t5)
    lwc1 $f9, 0($t6)
    mul.s $f9, $f7, $f9
    sub.s $f8, $f8, $f9
    swc1 $f8, 0($t5)
    
    addi $t4, $t4, 1
    j elim_inv_col_loop
    
skip_row:
    addi $t2, $t2, 1
    j elim_row_loop
    
next_pivot:
    addi $t0, $t0, 1
    j outer_loop
    
done:
    jr $ra####
