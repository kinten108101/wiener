.text
.globl main

main:
    # Print original matrix
    la $a0, msg_original
    li $v0, 4
    syscall
    
    la $s2, matrix
    jal print_matrix
    
    # Compute inverse
    jal gauss_jordan_inverse
    
    # Print inverse matrix
    la $a0, msg_inverse
    li $v0, 4
    syscall
    
    la $s2, inverse_matrix
    jal print_matrix
    
    # Exit
    li $v0, 10
    syscall

# Prints a 10x10 matrix
# Input: $s2 = base address of matrix
# Uses: $t0-$t4, $f12
print_matrix:
    li $t0, 0               # $t0 = row counter
print_row:
    bge $t0, 10, print_done
    li $t1, 0               # $t1 = col counter
    
print_col:
    bge $t1, 10, print_newline
    
    # Calculate address: matrix[row][col] = base + (row*10 + col)*4
    mul $t2, $t0, 10
    add $t2, $t2, $t1
    sll $t2, $t2, 2
    add $t2, $t2, $s2
    
    # Load and print float
    lwc1 $f12, 0($t2)
    li $v0, 2
    syscall
    
    # Print space
    la $a0, space
    li $v0, 4
    syscall
    
    addi $t1, $t1, 1
    j print_col
    
print_newline:
    la $a0, newline
    li $v0, 4
    syscall
    
    addi $t0, $t0, 1
    j print_row
    
print_done:
    # Print extra newline
    la $a0, newline
    li $v0, 4
    syscall
    jr $ra

# Computes inverse of 10x10 matrix using Gauss-Jordan elimination
# Input: matrix and inverse_matrix already declared in .data
# Uses registers: $t0-$t9, $s2-$s4

gauss_jordan_inverse:
    la $s2, matrix          # $s2 = base address of matrix
    la $s3, inverse_matrix  # $s3 = base address of inverse matrix
    li $s4, 10              # $s4 = n = 10 (matrix size)
    
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
    
    # Calculate address: matrix[r][i] = matrix + (r*10 + i)*4
    mul $t3, $t2, $s4       # $t3 = r * 10
    add $t3, $t3, $t0       # $t3 = r*10 + i
    sll $t3, $t3, 2         # $t3 = (r*10 + i) * 4
    add $t3, $t3, $s2       # $t3 = address of matrix[r][i]
    lwc1 $f1, 0($t3)        # $f1 = matrix[r][i]
    abs.s $f1, $f1          # $f1 = |matrix[r][i]|
    
    c.le.s $f1, $f0         # if |matrix[r][i]| <= max_val
    bc1t skip_update
    mov.s $f0, $f1          # max_val = |matrix[r][i]|
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
    
    # Swap matrix[i][col] with matrix[pivot_row][col]
    mul $t3, $t0, $s4
    add $t3, $t3, $t2
    sll $t3, $t3, 2
    add $t3, $t3, $s2       # matrix[i][col]
    
    mul $t4, $t1, $s4
    add $t4, $t4, $t2
    sll $t4, $t4, 2
    add $t4, $t4, $s2       # matrix[pivot_row][col]
    
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
    
    # Swap inverse_matrix[i][col] with inverse_matrix[pivot_row][col]
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
    # 3. Normalize row, chia cho matrix[i][i] => xét tới hàng i thì cột i là dùng để normalize => đầu hàng là 1
    mul $t3, $t0, $s4
    add $t3, $t3, $t0
    sll $t3, $t3, 2
    add $t3, $t3, $s2
    lwc1 $f5, 0($t3)        # $f5 = divisor = matrix[i][i]
    
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
    
    # Get factor = matrix[r][i] => value đầu hàng của mấy hàng khác để nhân với 1 của pivot sau đó trừ
    mul $t3, $t2, $s4
    add $t3, $t3, $t0
    sll $t3, $t3, 2
    add $t3, $t3, $s2
    lwc1 $f7, 0($t3)        # $f7 = factor
    
    # Eliminate
    li $t4, 0               # $t4 = col
elim_matrix_col:
    bge $t4, $s4, elim_inverse_col
    
    # matrix[r][col] -= factor * matrix[i][col]
    mul $t5, $t2, $s4
    add $t5, $t5, $t4
    sll $t5, $t5, 2
    add $t5, $t5, $s2       # matrix[r][col]
    
    mul $t6, $t0, $s4
    add $t6, $t6, $t4
    sll $t6, $t6, 2
    add $t6, $t6, $s2       # matrix[i][col]
    
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
    
    # inverse_matrix[r][col] -= factor * inverse_matrix[i][col]
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
    jr $ra

.data
epsilon: .float 1e-12
msg_original: .asciiz "Original Matrix:\n"
msg_inverse: .asciiz "Inverse Matrix:\n"
space: .asciiz " "
newline: .asciiz "\n"

# matrix: .float 30.939 17.094444 3.3912501 -4.432857 -3.2533333 4.968 18.98 38.486668 16.65 0.0 17.094444 30.939 17.094444 3.3912501 -4.432857 -3.2533333 4.968 18.98 38.486668 16.65 3.3912501 17.094444 30.939 17.094444 3.3912501 -4.432857 -3.2533333 4.968 18.98 38.486668 -4.432857 3.3912501 17.094444 30.939 17.094444 3.3912501 -4.432857 -3.2533333 4.968 18.98 -3.2533333 -4.432857 3.3912501 17.094444 30.939 17.094444 3.3912501 -4.432857 -3.2533333 4.968 4.968 -3.2533333 -4.432857 3.3912501 17.094444 30.939 17.094444 3.3912501 -4.432857 -3.2533333 18.98 4.968 -3.2533333 -4.432857 3.3912501 17.094444 30.939 17.094444 3.3912501 -4.432857 38.486668 18.98 4.968 -3.2533333 -4.432857 3.3912501 17.094444 30.939 17.094444 3.3912501 16.65 38.486668 18.98 4.968 -3.2533333 -4.432857 3.3912501 17.094444 30.939 17.094444 0.0 16.65 38.486668 18.98 4.968 -3.2533333 -4.432857 3.3912501 17.094444 30.939
# matrix: .float 30.939     , 17.09444444,  3.39125   , -4.43285714, -3.25333333, 4.968     , 18.98      , 38.48666667, 16.65      ,  0.        , 17.09444444, 30.939     , 17.09444444,  3.39125   , -4.43285714, -3.25333333,  4.968     , 18.98      , 38.48666667, 16.65      , 3.39125   , 17.09444444, 30.939     , 17.09444444,  3.39125   , -4.43285714, -3.25333333,  4.968     , 18.98      , 38.48666667, -4.43285714,  3.39125   , 17.09444444, 30.939     , 17.09444444, 3.39125   , -4.43285714, -3.25333333,  4.968     , 18.98      , -3.25333333, -4.43285714,  3.39125   , 17.09444444, 30.939     , 17.09444444,  3.39125   , -4.43285714, -3.25333333,  4.968     , 4.968     , -3.25333333, -4.43285714,  3.39125   , 17.09444444, 30.939     , 17.09444444,  3.39125   , -4.43285714, -3.25333333, 18.98      ,  4.968     , -3.25333333, -4.43285714,  3.39125   , 17.09444444, 30.939     , 17.09444444,  3.39125   , -4.43285714, 38.48666667, 18.98      ,  4.968     , -3.25333333, -4.43285714, 3.39125   , 17.09444444, 30.939     , 17.09444444,  3.39125   , 16.65      , 38.48666667, 18.98      ,  4.968     , -3.25333333, -4.43285714,  3.39125   , 17.09444444, 30.939     , 17.09444444, 0.        , 16.65      , 38.48666667, 18.98      ,  4.968     ,
#          -3.25333333, -4.43285714,  3.39125   , 17.09444444, 30.939
matrix: .float 1.2 3.8 2.1 4.5 5.6 7.8 6.3 9.1 0.5 8.2
3.8 3.4 1.9 5.2 4.4 6.6 3.3 2.8 7.1 5.5
2.1 1.9 0.0 2.2 5.9 3.7 8.0 1.6 4.3 6.4
4.5 5.2 2.2 8.4 3.8 6.1 2.9 5.4 1.5 3.6
5.6 4.4 5.9 3.8 7.6 2.3 4.7 6.2 8.8 7.0
7.8 6.6 3.7 6.1 2.3 2.3 5.5 7.3 2.6 9.2
6.3 3.3 8.0 2.9 4.7 5.5 0.0 9.4 7.6 1.8
9.1 2.8 1.6 5.4 6.2 7.3 9.4 5.7 3.5 2.4
0.5 7.1 4.3 1.5 8.8 2.6 7.6 3.5 4.7 6.8
8.2 5.5 6.4 3.6 7.0 9.2 1.8 2.4 6.8 0.0

inverse_matrix: .float 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0
0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0
0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0
0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0
0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0

