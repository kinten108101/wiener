.data 
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

newline: .asciiz "\n"
.text
.globl main
main:
	la $s1, matrix
	la $s2, inverse_matrix
	li $s0, 10
	li $t0, 0
	li $s3, 100
	mtc1 $zero, $f0
	move $t1, $s1
	move $t2, $s2
step1_0a:
	lwc1 $f1, 0($s1)
	c.eq.s $f1, $f0
	bc1f step1_1a
	j step1_0b
step1_0b:
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	lwc1 $f2, 0($t1)
	c.eq.s $f2, $f0
	bc1t step1_0b
	add.s $f1, $f1, $f2 
	swc1 $f1, 0($s1)
	
	lwc1 $f1, 0($s2)
	lwc1 $f2, 0($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 0($s2)
	
	lwc1 $f1, 4($s1)
	lwc1 $f2, 4($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 4($s1)
	
	lwc1 $f1, 4($s2)
	lwc1 $f2, 4($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 4($s2)
	
	lwc1 $f1, 8($s1)
	lwc1 $f2, 8($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 8($s1)
	
	lwc1 $f1, 8($s2)
	lwc1 $f2, 8($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 8($s2)
	
	lwc1 $f1, 12($s1)
	lwc1 $f2, 12($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 12($s1)
	
	lwc1 $f1, 12($s2)
	lwc1 $f2, 12($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 12($s2)
	
	lwc1 $f1, 16($s1)
	lwc1 $f2, 16($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 16($s1)
	
	lwc1 $f1, 16($s2)
	lwc1 $f2, 16($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 16($s2)
	
	lwc1 $f1, 20($s1)
	lwc1 $f2, 20($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 20($s1)
	
	lwc1 $f1, 20($s2)
	lwc1 $f2, 20($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 20($s2)
	
	lwc1 $f1, 24($s1)
	lwc1 $f2, 24($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 24($s1)
	
	lwc1 $f1, 24($s2)
	lwc1 $f2, 24($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 24($s2)
	
	lwc1 $f1, 28($s1)
	lwc1 $f2, 28($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 28($s1)
	
	lwc1 $f1, 28($s2)
	lwc1 $f2, 28($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 28($s2)
	
	lwc1 $f1, 32($s1)
	lwc1 $f2, 32($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 32($s1)
	
	lwc1 $f1, 32($s2)
	lwc1 $f2, 32($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 32($s2)
	
	lwc1 $f1, 36($s1)
	lwc1 $f2, 36($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 36($s1)
	
	lwc1 $f1, 36($s2)
	lwc1 $f2, 36($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 36($s2)
	
	move $t1, $s1
	move $t2, $s2
	j step1_1a
	
step1_1a:
	lwc1 $f1, 44($s1)
	c.eq.s $f1, $f0
	bc1f step1_2a
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j step1_1b
step1_1b:
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	lwc1 $f2, 4($t1)
	c.eq.s $f2, $f0
	bc1t step1_1b
	add.s $f1, $f1, $f2 
	swc1 $f1, 44($s1)
	
	lwc1 $f1, 44($s2)
	lwc1 $f2, 4($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 44($s2)
	
	lwc1 $f1, 40($s1)
	lwc1 $f2, 0($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 40($s1)
	
	lwc1 $f1, 40($s2)
	lwc1 $f2, 0($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 40($s2)
	
	lwc1 $f1, 48($s1)
	lwc1 $f2, 8($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 48($s1)
	
	lwc1 $f1, 48($s2)
	lwc1 $f2, 8($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 48($s2)
	
	lwc1 $f1, 52($s1)
	lwc1 $f2, 12($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 52($s1)
	
	lwc1 $f1, 52($s2)
	lwc1 $f2, 12($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 52($s2)
	
	lwc1 $f1, 56($s1)
	lwc1 $f2, 16($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 56($s1)
	
	lwc1 $f1, 56($s2)
	lwc1 $f2, 16($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 56($s2)
	
	lwc1 $f1, 60($s1)
	lwc1 $f2, 20($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 60($s1)
	
	lwc1 $f1, 60($s2)
	lwc1 $f2, 20($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 60($s2)
	
	lwc1 $f1, 64($s1)
	lwc1 $f2, 24($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 64($s1)
	
	lwc1 $f1, 64($s2)
	lwc1 $f2, 24($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 64($s2)
	
	lwc1 $f1, 68($s1)
	lwc1 $f2, 28($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 68($s1)
	
	lwc1 $f1, 68($s2)
	lwc1 $f2, 28($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 68($s2)
	
	lwc1 $f1, 72($s1)
	lwc1 $f2, 32($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 72($s1)
	
	lwc1 $f1, 72($s2)
	lwc1 $f2, 32($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 72($s2)
	
	lwc1 $f1, 76($s1)
	lwc1 $f2, 36($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 76($s1)
	
	lwc1 $f1, 76($s2)
	lwc1 $f2, 36($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 76($s2)
	
	move $t1, $s1
	move $t2, $s2
	j step1_2a
	

step1_2a:
	lwc1 $f1, 88($s1)
	c.eq.s $f1, $f0
	bc1f step1_3a
	addi $t1, $t1, 80
	addi $t2, $t2, 80
	j step1_2b
step1_2b:
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	lwc1 $f2, 8($t1)
	c.eq.s $f2, $f0
	bc1t step1_2b
	add.s $f1, $f1, $f2 
	swc1 $f1, 88($s1)
		
	lwc1 $f1, 88($s2)
	lwc1 $f2, 8($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 88($s2)
	
	lwc1 $f1, 80($s1)
	lwc1 $f2, 0($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 80($s1)
	
	lwc1 $f1, 80($s2)
	lwc1 $f2, 0($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 80($s2)
	
	lwc1 $f1, 84($s1)
	lwc1 $f2, 4($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 84($s1)
	
	lwc1 $f1, 84($s2)
	lwc1 $f2, 4($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 84($s2)
	
	lwc1 $f1, 92($s1)
	lwc1 $f2, 12($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 92($s1)
	
	lwc1 $f1, 92($s2)
	lwc1 $f2, 12($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 92($s2)
	
	lwc1 $f1, 96($s1)
	lwc1 $f2, 16($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 96($s1)
	
	lwc1 $f1, 96($s2)
	lwc1 $f2, 16($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 96($s2)
	
	lwc1 $f1, 100($s1)
	lwc1 $f2, 20($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 100($s1)
	
	lwc1 $f1, 100($s2)
	lwc1 $f2, 20($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 100($s2)
	
	lwc1 $f1, 104($s1)
	lwc1 $f2, 24($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 104($s1)
	
	lwc1 $f1, 104($s2)
	lwc1 $f2, 24($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 104($s2)
	
	lwc1 $f1, 108($s1)
	lwc1 $f2, 28($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 108($s1)
	
	lwc1 $f1, 108($s2)
	lwc1 $f2, 28($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 108($s2)
	
	lwc1 $f1, 112($s1)
	lwc1 $f2, 32($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 112($s1)
	
	lwc1 $f1, 112($s2)
	lwc1 $f2, 32($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 112($s2)
	
	lwc1 $f1, 116($s1)
	lwc1 $f2, 36($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 116($s1)
	
	lwc1 $f1, 116($s2)
	lwc1 $f2, 36($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 116($s2)
	
	move $t1, $s1
	move $t2, $s2
	j step1_3a
	
step1_3a:
	lwc1 $f1, 132($s1)
	c.eq.s $f1, $f0
	bc1f step1_4a
	addi $t1, $t1, 120
	addi $t2, $t2, 120
	j step1_3b
step1_3b:
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	lwc1 $f2, 12($t1)
	c.eq.s $f2, $f0
	bc1t step1_3b
	add.s $f1, $f1, $f2 
	swc1 $f1, 132($s1)
	
	lwc1 $f1, 132($s2)
	lwc1 $f2, 12($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 132($s2)
	
	lwc1 $f1, 120($s1)
	lwc1 $f2, 0($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 120($s1)
	
	lwc1 $f1, 120($s2)
	lwc1 $f2, 0($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 120($s2)
	
	lwc1 $f1, 124($s1)
	lwc1 $f2, 4($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 124($s1)
	
	lwc1 $f1, 124($s2)
	lwc1 $f2, 4($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 124($s2)
	
	lwc1 $f1, 128($s1)
	lwc1 $f2, 8($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 128($s1)
	
	lwc1 $f1, 128($s2)
	lwc1 $f2, 8($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 128($s2)
	
	lwc1 $f1, 136($s1)
	lwc1 $f2, 16($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 136($s1)
	
	lwc1 $f1, 136($s2)
	lwc1 $f2, 16($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 136($s2)
	
	lwc1 $f1, 140($s1)
	lwc1 $f2, 20($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 140($s1)
	
	lwc1 $f1, 140($s2)
	lwc1 $f2, 20($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 140($s2)
	
	lwc1 $f1, 144($s1)
	lwc1 $f2, 24($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 144($s1)
	
	lwc1 $f1, 144($s2)
	lwc1 $f2, 24($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 144($s2)
	
	lwc1 $f1, 148($s1)
	lwc1 $f2, 28($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 148($s1)
	
	lwc1 $f1, 148($s2)
	lwc1 $f2, 28($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 148($s2)
	
	lwc1 $f1, 152($s1)
	lwc1 $f2, 32($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 152($s1)
	
	lwc1 $f1, 152($s2)
	lwc1 $f2, 32($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 152($s2)	
	
	lwc1 $f1, 156($s1)
	lwc1 $f2, 36($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 156($s1)
	
	lwc1 $f1, 156($s2)
	lwc1 $f2, 36($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 156($s2)
	
	move $t1, $s1
	move $t2, $s2
	j step1_4a
	
step1_4a:
	lwc1 $f1, 176($s1)
	c.eq.s $f1, $f0
	bc1f step1_5a
	addi $t1, $t1, 160
	addi $t2, $t2, 160
	j step1_4b
step1_4b:
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	lwc1 $f2, 16($t1)
	c.eq.s $f2, $f0
	bc1t step1_4b
	add.s $f1, $f1, $f2 
	swc1 $f1, 176($s1)
	
	lwc1 $f1, 176($s2)
	lwc1 $f2, 16($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 176($s2)
	
	lwc1 $f1, 160($s1)
	lwc1 $f2, 0($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 160($s1)
	
	lwc1 $f1, 160($s2)
	lwc1 $f2, 0($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 160($s2)
	
	lwc1 $f1, 164($s1)
	lwc1 $f2, 4($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 164($s1)
	
	lwc1 $f1, 164($s2)
	lwc1 $f2, 4($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 164($s2)
	
	lwc1 $f1, 168($s1)
	lwc1 $f2, 8($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 168($s1)
	
	lwc1 $f1, 168($s2)
	lwc1 $f2, 8($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 168($s2)
	
	lwc1 $f1, 172($s1)
	lwc1 $f2, 12($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 172($s1)
	
	lwc1 $f1, 172($s2)
	lwc1 $f2, 12($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 172($s2)
	
	lwc1 $f1, 180($s1)
	lwc1 $f2, 20($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 180($s1)
	
	lwc1 $f1, 180($s2)
	lwc1 $f2, 20($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 180($s2)
	
	lwc1 $f1, 184($s1)
	lwc1 $f2, 24($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 184($s1)
	
	lwc1 $f1, 184($s2)
	lwc1 $f2, 24($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 184($s2)
	
	lwc1 $f1, 188($s1)
	lwc1 $f2, 28($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 188($s1)
	
	lwc1 $f1, 188($s2)
	lwc1 $f2, 28($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 188($s2)
	
	lwc1 $f1, 192($s1)
	lwc1 $f2, 32($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 192($s1)
	
	lwc1 $f1, 192($s2)
	lwc1 $f2, 32($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 192($s2)
	
	lwc1 $f1, 196($s1)
	lwc1 $f2, 36($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 196($s1)
	
	lwc1 $f1, 196($s2)
	lwc1 $f2, 36($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 196($s2)
	
	move $t1, $s1
	move $t2, $s2
	j step1_5a
	
step1_5a:
	lwc1 $f1, 220($s1)
	c.eq.s $f1, $f0
	bc1f step1_6a
	addi $t1, $t1, 200
	addi $t2, $t2, 200
	j step1_5b
step1_5b:
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	lwc1 $f2, 20($t1)
	c.eq.s $f2, $f0
	bc1t step1_5b
	add.s $f1, $f1, $f2 
	swc1 $f1, 220($s1)
	
	lwc1 $f1, 220($s2)
	lwc1 $f2, 20($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 220($s2)
	
	lwc1 $f1, 200($s1)
	lwc1 $f2, 0($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 200($s1)
	
	lwc1 $f1, 200($s2)
	lwc1 $f2, 0($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 200($s2)
	
	lwc1 $f1, 204($s1)
	lwc1 $f2, 4($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 204($s1)
	
	lwc1 $f1, 204($s2)
	lwc1 $f2, 4($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 204($s2)
	
	lwc1 $f1, 208($s1)
	lwc1 $f2, 8($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 208($s1)
	
	lwc1 $f1, 208($s2)
	lwc1 $f2, 8($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 208($s2)
	
	lwc1 $f1, 212($s1)
	lwc1 $f2, 12($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 212($s1)
	
	lwc1 $f1, 212($s2)
	lwc1 $f2, 12($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 212($s2)
	
	lwc1 $f1, 216($s1)
	lwc1 $f2, 16($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 216($s1)
	
	lwc1 $f1, 216($s2)
	lwc1 $f2, 16($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 216($s2)
	
	lwc1 $f1, 224($s1)
	lwc1 $f2, 24($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 224($s1)
	
	lwc1 $f1, 224($s2)
	lwc1 $f2, 24($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 224($s2)
	
	lwc1 $f1, 228($s1)
	lwc1 $f2, 28($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 228($s1)
	
	lwc1 $f1, 228($s2)
	lwc1 $f2, 28($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 228($s2)
	
	lwc1 $f1, 232($s1)
	lwc1 $f2, 32($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 232($s1)
	
	lwc1 $f1, 232($s2)
	lwc1 $f2, 32($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 232($s2)
	
	lwc1 $f1, 236($s1)
	lwc1 $f2, 36($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 236($s1)
	
	lwc1 $f1, 236($s2)
	lwc1 $f2, 36($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 236($s2)
	
	move $t1, $s1
	move $t2, $s2
	j step1_6a
	
step1_6a:
	lwc1 $f1, 264($s1)
	c.eq.s $f1, $f0
	bc1f step1_7a
	addi $t1, $t1, 240
	addi $t2, $t2, 240
	j step1_6b
step1_6b:
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	lwc1 $f2, 24($t1)
	c.eq.s $f2, $f0
	bc1t step1_6b
	add.s $f1, $f1, $f2 
	swc1 $f1, 264($s1)
	
	lwc1 $f1, 264($s2)
	lwc1 $f2, 24($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 264($s2)
	
	lwc1 $f1, 240($s1)
	lwc1 $f2, 0($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 240($s1)
	
	lwc1 $f1, 240($s2)
	lwc1 $f2, 0($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 240($s2)
	
	lwc1 $f1, 244($s1)
	lwc1 $f2, 4($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 244($s1)
	
	lwc1 $f1, 244($s2)
	lwc1 $f2, 4($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 244($s2)
	
	lwc1 $f1, 248($s1)
	lwc1 $f2, 8($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 248($s1)
	
	lwc1 $f1, 248($s2)
	lwc1 $f2, 8($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 248($s2)
	
	lwc1 $f1, 252($s1)
	lwc1 $f2, 12($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 252($s1)
	
	lwc1 $f1, 252($s2)
	lwc1 $f2, 12($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 252($s2)
	
	lwc1 $f1, 256($s1)
	lwc1 $f2, 16($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 256($s1)
	
	lwc1 $f1, 256($s2)
	lwc1 $f2, 16($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 256($s2)
	
	lwc1 $f1, 260($s1)
	lwc1 $f2, 20($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 260($s1)
	
	lwc1 $f1, 260($s2)
	lwc1 $f2, 20($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 260($s2)
	
	lwc1 $f1, 268($s1)
	lwc1 $f2, 28($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 268($s1)
	
	lwc1 $f1, 268($s2)
	lwc1 $f2, 28($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 268($s2)
	
	lwc1 $f1, 272($s1)
	lwc1 $f2, 32($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 272($s1)
	
	lwc1 $f1, 272($s2)
	lwc1 $f2, 32($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 272($s2)
	
	lwc1 $f1, 276($s1)
	lwc1 $f2, 36($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 276($s1)
	
	lwc1 $f1, 276($s2)
	lwc1 $f2, 36($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 276($s2)
	
	move $t1, $s1
	move $t2, $s2
	j step1_7a
	
step1_7a: 
	lwc1 $f1, 308($s1)
	c.eq.s $f1, $f0
	bc1f step1_8a
	addi $t1, $t1, 280
	addi $t2, $t2, 280
	j step1_7b	
step1_7b:
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	lwc1 $f2, 28($t1)
	c.eq.s $f2, $f0
	bc1t step1_7b
	add.s $f1, $f1, $f2 
	swc1 $f1, 308($s1)
	
	lwc1 $f1, 308($s2)
	lwc1 $f2, 28($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 308($s2)
	
	lwc1 $f1, 280($s1)
	lwc1 $f2, 0($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 280($s1)
	
	lwc1 $f1, 280($s2)
	lwc1 $f2, 0($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 280($s2)
	
	lwc1 $f1, 284($s1)
	lwc1 $f2, 4($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 284($s1)
	
	lwc1 $f1, 284($s2)
	lwc1 $f2, 4($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 284($s2)
	
	lwc1 $f1, 288($s1)
	lwc1 $f2, 8($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 288($s1)
	
	lwc1 $f1, 288($s2)
	lwc1 $f2, 8($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 288($s2)
	
	lwc1 $f1, 292($s1)
	lwc1 $f2, 12($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 292($s1)
	
	lwc1 $f1, 292($s2)
	lwc1 $f2, 12($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 292($s2)
	
	lwc1 $f1, 296($s1)
	lwc1 $f2, 16($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 296($s1)
	
	lwc1 $f1, 296($s2)
	lwc1 $f2, 16($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 296($s2)
	
	lwc1 $f1, 300($s1)
	lwc1 $f2, 20($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 300($s1)
	
	lwc1 $f1, 300($s2)
	lwc1 $f2, 20($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 300($s2)
	
	lwc1 $f1, 304($s1)
	lwc1 $f2, 24($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 304($s1)
	
	lwc1 $f1, 304($s2)
	lwc1 $f2, 24($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 304($s2)
	
	lwc1 $f1, 312($s1)
	lwc1 $f2, 32($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 312($s1)
	
	lwc1 $f1, 312($s2)
	lwc1 $f2, 32($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 312($s2)
	
	lwc1 $f1, 316($s1)
	lwc1 $f2, 36($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 316($s1)
	
	lwc1 $f1, 316($s2)
	lwc1 $f2, 36($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 316($s2)
	
	move $t1, $s1
	move $t2, $s2
	j step1_8a
	
step1_8a:
	lwc1 $f1, 352($s1)
	c.eq.s $f1, $f0
	bc1f step1_9a
	addi $t1, $t1, 320
	addi $t2, $t2, 320
	j step1_8b
step1_8b:
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	lwc1 $f2, 32($t1)
	c.eq.s $f2, $f0
	bc1t step1_8b
	add.s $f1, $f1, $f2 
	swc1 $f1, 352($s1)
	
	lwc1 $f1, 352($s2)
	lwc1 $f2, 32($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 352($s2)
	
	lwc1 $f1, 320($s1)
	lwc1 $f2, 0($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 320($s1)
	
	lwc1 $f1, 320($s2)
	lwc1 $f2, 0($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 320($s2)
	
	lwc1 $f1, 324($s1)
	lwc1 $f2, 4($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 324($s1)
	
	lwc1 $f1, 324($s2)
	lwc1 $f2, 4($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 324($s2)
	
	lwc1 $f1, 328($s1)
	lwc1 $f2, 8($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 328($s1)
	
	lwc1 $f1, 328($s2)
	lwc1 $f2, 8($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 328($s2)
	
	lwc1 $f1, 332($s1)
	lwc1 $f2, 12($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 332($s1)
	
	lwc1 $f1, 332($s2)
	lwc1 $f2, 12($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 332($s2)
	
	lwc1 $f1, 336($s1)
	lwc1 $f2, 16($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 336($s1)
	
	lwc1 $f1, 336($s2)
	lwc1 $f2, 16($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 336($s2)
	
	lwc1 $f1, 340($s1)
	lwc1 $f2, 20($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 340($s1)
	
	lwc1 $f1, 340($s2)
	lwc1 $f2, 20($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 340($s2)
	
	lwc1 $f1, 344($s1)
	lwc1 $f2, 24($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 344($s1)
	
	lwc1 $f1, 344($s2)
	lwc1 $f2, 24($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 344($s2)
	
	lwc1 $f1, 348($s1)
	lwc1 $f2, 28($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 348($s1)
	
	lwc1 $f1, 348($s2)
	lwc1 $f2, 28($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 348($s2)
	
	lwc1 $f1, 356($s1)
	lwc1 $f2, 36($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 356($s1)
	
	lwc1 $f1, 356($s2)
	lwc1 $f2, 36($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 356($s2)
	
	move $t1, $s1
	move $t2, $s2
	j step1_9a
	
step1_9a:
	lwc1 $f1, 396($s1)
	c.eq.s $f1, $f0
	bc1f make_first_column_to_one
	addi $t1, $t1, -40
	addi $t2, $t2, -40
	j step1_9b
step1_9b:
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	lwc1 $f2, 36($t1)
	c.eq.s $f2, $f0
	bc1t step1_9b
	add.s $f1, $f1, $f2 
	swc1 $f1, 396($s1)
	
	lwc1 $f1, 396($s2)
	lwc1 $f2, 36($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 396($s2)
	
	lwc1 $f1, 360($s1)
	lwc1 $f2, 0($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 360($s1)
	
	lwc1 $f1, 360($s2)
	lwc1 $f2, 0($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 360($s2)
	
	lwc1 $f1, 364($s1)
	lwc1 $f2, 4($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 364($s1)
	
	lwc1 $f1, 364($s2)
	lwc1 $f2, 4($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 364($s2)
	
	lwc1 $f1, 368($s1)
	lwc1 $f2, 8($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 368($s1)
	
	lwc1 $f1, 368($s2)
	lwc1 $f2, 8($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 368($s2)
	
	lwc1 $f1, 372($s1)
	lwc1 $f2, 12($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 372($s1)
	
	lwc1 $f1, 372($s2)
	lwc1 $f2, 12($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 372($s2)
	
	lwc1 $f1, 376($s1)
	lwc1 $f2, 16($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 376($s1)
	
	lwc1 $f1, 376($s2)
	lwc1 $f2, 16($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 376($s2)
	
	lwc1 $f1, 380($s1)
	lwc1 $f2, 20($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 380($s1)
	
	lwc1 $f1, 380($s2)
	lwc1 $f2, 20($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 380($s2)
	
	lwc1 $f1, 384($s1)
	lwc1 $f2, 24($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 384($s1)
	
	lwc1 $f1, 384($s2)
	lwc1 $f2, 24($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 384($s2)
	
	lwc1 $f1, 388($s1)
	lwc1 $f2, 28($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 388($s1)
	
	lwc1 $f1, 388($s2)
	lwc1 $f2, 28($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 388($s2)
	
	lwc1 $f1, 392($s1)
	lwc1 $f2, 32($t1)
	add.s $f1, $f1, $f2
	swc1 $f1, 392($s1)
	
	lwc1 $f1, 392($s2)
	lwc1 $f2, 32($t2)
	add.s $f1, $f1, $f2
	swc1 $f1, 392($s2)
	
	move $t1, $s1
	move $t2, $s2
	j make_first_column_to_one
	
make_first_column_to_one:
	bge $t0, $s0, make_first_column_to_one_done
	lwc1 $f1, 0($t1)
	lwc1 $f2, 0($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t1)
	
	lwc1 $f2, 4($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t1)
	
	lwc1 $f2, 8($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t1)
	
	lwc1 $f2, 12($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t1)
	
	lwc1 $f2, 16($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t1)
	
	lwc1 $f2, 20($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f2, 24($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f2, 28($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f2, 32($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f2, 36($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f2, 0($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f2, 4($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f2, 8($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f2, 12($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f2, 16($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f2, 20($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f2, 24($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f2, 28($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f2, 32($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f2, 36($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j make_first_column_to_one

make_first_column_to_one_done:
	li $t0, 1
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j set_half_below_column_one_zero
	
set_half_below_column_one_zero:
	bge $t0, $s0, set_half_below_column_one_zero_done
	lwc1 $f1, 0($s1)
	lwc1 $f2, 0($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 0($t1)
	
	lwc1 $f1, 0($s2)
	lwc1 $f2, 0($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f1, 4($s1)
	lwc1 $f2, 4($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t1)
	
	lwc1 $f1, 4($s2)
	lwc1 $f2, 4($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f1, 8($s1)
	lwc1 $f2, 8($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t1)
	
	lwc1 $f1, 8($s2)
	lwc1 $f2, 8($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f1, 12($s1)
	lwc1 $f2, 12($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t1)
	
	lwc1 $f1, 12($s2)
	lwc1 $f2, 12($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f1, 16($s1)
	lwc1 $f2, 16($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t1)
	
	lwc1 $f1, 16($s2)
	lwc1 $f2, 16($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f1, 20($s1)
	lwc1 $f2, 20($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f1, 20($s2)
	lwc1 $f2, 20($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f1, 24($s1)
	lwc1 $f2, 24($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f1, 24($s2)
	lwc1 $f2, 24($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f1, 28($s1)
	lwc1 $f2, 28($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f1, 28($s2)
	lwc1 $f2, 28($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f1, 32($s1)
	lwc1 $f2, 32($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f1, 32($s2)
	lwc1 $f2, 32($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f1, 36($s1)
	lwc1 $f2, 36($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f1, 36($s2)
	lwc1 $f2, 36($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j set_half_below_column_one_zero
	
set_half_below_column_one_zero_done:
	li $t0, 1
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_second_column_to_one
	
make_second_column_to_one:
	bge $t0, $s0, make_second_column_to_one_done
	lwc1 $f1, 4($t1)	
	lwc1 $f2, 4($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t1)
	
	lwc1 $f2, 8($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t1)
	
	lwc1 $f2, 12($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t1)
	
	lwc1 $f2, 16($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t1)
	
	lwc1 $f2, 20($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f2, 24($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f2, 28($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f2, 32($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f2, 36($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f2, 0($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f2, 4($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f2, 8($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f2, 12($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f2, 16($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f2, 20($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f2, 24($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f2, 28($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f2, 32($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f2, 36($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j make_second_column_to_one
	
make_second_column_to_one_done:
	li $t0, 2
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 80
	addi $t2, $t2, 80
	j set_second_below_column_one_zero
	
set_second_below_column_one_zero:
	bge $t0, $s0, set_second_below_column_one_zero_done	
	lwc1 $f1, 40($s2)
	lwc1 $f2, 0($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f1, 44($s1)
	lwc1 $f2, 4($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t1)
	
	lwc1 $f1, 44($s2)
	lwc1 $f2, 4($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f1, 48($s1)
	lwc1 $f2, 8($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t1)
	
	lwc1 $f1, 48($s2)
	lwc1 $f2, 8($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f1, 52($s1)
	lwc1 $f2, 12($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t1)
	
	lwc1 $f1, 52($s2)
	lwc1 $f2, 12($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f1, 56($s1)
	lwc1 $f2, 16($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t1)
	
	lwc1 $f1, 56($s2)
	lwc1 $f2, 16($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f1, 60($s1)
	lwc1 $f2, 20($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f1, 60($s2)
	lwc1 $f2, 20($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f1, 64($s1)
	lwc1 $f2, 24($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f1, 64($s2)
	lwc1 $f2, 24($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f1, 68($s1)
	lwc1 $f2, 28($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f1, 68($s2)
	lwc1 $f2, 28($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f1, 72($s1)
	lwc1 $f2, 32($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f1, 72($s2)
	lwc1 $f2, 32($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f1, 76($s1)
	lwc1 $f2, 36($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f1, 76($s2)
	lwc1 $f2, 36($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j set_second_below_column_one_zero

set_second_below_column_one_zero_done:
	li $t0, 2
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 80
	addi $t2, $t2, 80
	j make_third_column_to_one
	
make_third_column_to_one:
	bge $t0, $s0, make_third_column_to_one_done
	lwc1 $f1, 8($t1)	
	lwc1 $f2, 8($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t1)
	
	lwc1 $f2, 12($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t1)
	
	lwc1 $f2, 16($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t1)
	
	lwc1 $f2, 20($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f2, 24($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f2, 28($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f2, 32($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f2, 36($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f2, 0($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f2, 4($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f2, 8($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f2, 12($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f2, 16($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f2, 20($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f2, 24($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f2, 28($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f2, 32($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f2, 36($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j make_third_column_to_one
	
make_third_column_to_one_done:
	li $t0, 3
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 120
	addi $t2, $t2, 120
	j set_third_below_column_one_zero
	
set_third_below_column_one_zero:
	bge $t0, $s0, set_third_below_column_one_zero_done	
	lwc1 $f1, 80($s2)
	lwc1 $f2, 0($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f1, 84($s2)
	lwc1 $f2, 4($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
		
	lwc1 $f1, 88($s1)
	lwc1 $f2, 8($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t1)
	
	lwc1 $f1, 88($s2)
	lwc1 $f2, 8($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f1, 92($s1)
	lwc1 $f2, 12($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t1)
	
	lwc1 $f1, 92($s2)
	lwc1 $f2, 12($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f1, 96($s1)
	lwc1 $f2, 16($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t1)
	
	lwc1 $f1, 96($s2)
	lwc1 $f2, 16($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f1, 100($s1)
	lwc1 $f2, 20($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f1, 100($s2)
	lwc1 $f2, 20($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f1, 104($s1)
	lwc1 $f2, 24($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f1, 104($s2)
	lwc1 $f2, 24($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f1, 108($s1)
	lwc1 $f2, 28($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f1, 108($s2)
	lwc1 $f2, 28($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f1, 112($s1)
	lwc1 $f2, 32($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f1, 112($s2)
	lwc1 $f2, 32($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f1, 116($s1)
	lwc1 $f2, 36($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f1, 116($s2)
	lwc1 $f2, 36($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j set_third_below_column_one_zero
	
set_third_below_column_one_zero_done:
	li $t0, 3
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 120
	addi $t2, $t2, 120
	j make_fourth_column_to_one
	
make_fourth_column_to_one:
	bge $t0, $s0, make_fourth_column_to_one_done
	lwc1 $f1, 12($t1)		
	lwc1 $f2, 12($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t1)
	
	lwc1 $f2, 16($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t1)
	
	lwc1 $f2, 20($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f2, 24($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f2, 28($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f2, 32($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f2, 36($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f2, 0($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f2, 4($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f2, 8($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f2, 12($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f2, 16($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f2, 20($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f2, 24($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f2, 28($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f2, 32($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f2, 36($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j make_fourth_column_to_one
	
make_fourth_column_to_one_done:
	li $t0, 4
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 160
	addi $t2, $t2, 160
	j set_fourth_below_column_one_zero
	
set_fourth_below_column_one_zero:	
	bge $t0, $s0, set_fourth_below_column_one_zero_done
	lwc1 $f1, 120($s2)
	lwc1 $f2, 0($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f1, 124($s2)
	lwc1 $f2, 4($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f1, 128($s2)
	lwc1 $f2, 8($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
							
	lwc1 $f1, 132($s1)
	lwc1 $f2, 12($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t1)
	
	lwc1 $f1, 132($s2)
	lwc1 $f2, 12($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f1, 136($s1)
	lwc1 $f2, 16($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t1)
	
	lwc1 $f1, 136($s2)
	lwc1 $f2, 16($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f1, 140($s1)
	lwc1 $f2, 20($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f1, 140($s2)
	lwc1 $f2, 20($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f1, 144($s1)
	lwc1 $f2, 24($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f1, 144($s2)
	lwc1 $f2, 24($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f1, 148($s1)
	lwc1 $f2, 28($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f1, 148($s2)
	lwc1 $f2, 28($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f1, 152($s1)
	lwc1 $f2, 32($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f1, 152($s2)
	lwc1 $f2, 32($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f1, 156($s1)
	lwc1 $f2, 36($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f1, 156($s2)
	lwc1 $f2, 36($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j set_fourth_below_column_one_zero
	
set_fourth_below_column_one_zero_done:
	li $t0, 4
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 160
	addi $t2, $t2, 160
	j make_fifth_column_to_one
	
make_fifth_column_to_one:
	bge $t0, $s0, make_fifth_column_to_one_done
	lwc1 $f1, 16($t1)		
	lwc1 $f2, 16($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t1)
	
	lwc1 $f2, 20($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f2, 24($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f2, 28($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f2, 32($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f2, 36($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t1)

	lwc1 $f2, 0($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f2, 4($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f2, 8($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f2, 12($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f2, 16($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f2, 20($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f2, 24($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f2, 28($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f2, 32($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f2, 36($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j make_fifth_column_to_one
	
make_fifth_column_to_one_done:
	li $t0, 5
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 200
	addi $t2, $t2, 200
	j set_fifth_below_column_one_zero
	
set_fifth_below_column_one_zero:
	bge $t0, $s0, set_fifth_below_column_one_zero_done
	lwc1 $f1, 160($s2)
	lwc1 $f2, 0($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f1, 164($s2)
	lwc1 $f2, 4($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f1, 168($s2)
	lwc1 $f2, 8($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t2)						
	
	lwc1 $f1, 172($s2)
	lwc1 $f2, 12($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f1, 176($s1)
	lwc1 $f2, 16($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t1)
	
	lwc1 $f1, 176($s2)
	lwc1 $f2, 16($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f1, 180($s1)
	lwc1 $f2, 20($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f1, 180($s2)
	lwc1 $f2, 20($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f1, 184($s1)
	lwc1 $f2, 24($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f1, 184($s2)
	lwc1 $f2, 24($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f1, 188($s1)
	lwc1 $f2, 28($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f1, 188($s2)
	lwc1 $f2, 28($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f1, 192($s1)
	lwc1 $f2, 32($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f1, 192($s2)
	lwc1 $f2, 32($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f1, 196($s1)
	lwc1 $f2, 36($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f1, 196($s2)
	lwc1 $f2, 36($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j set_fifth_below_column_one_zero
	
set_fifth_below_column_one_zero_done:
	li $t0, 5
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 200
	addi $t2, $t2, 200
	j make_sixth_column_to_one
	
make_sixth_column_to_one:
	bge $t0, $s0, make_sixth_column_to_one_done
	lwc1 $f1, 20($t1)			
	lwc1 $f2, 20($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f2, 24($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f2, 28($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f2, 32($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f2, 36($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t1)

	lwc1 $f2, 0($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f2, 4($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f2, 8($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f2, 12($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f2, 16($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f2, 20($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f2, 24($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f2, 28($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f2, 32($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f2, 36($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j make_sixth_column_to_one
	
make_sixth_column_to_one_done:
	li $t0, 6
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 240
	addi $t2, $t2, 240
	j set_sixth_below_column_one_zero
	
set_sixth_below_column_one_zero:
	bge $t0, $s0, set_sixth_below_column_one_zero_done
	lwc1 $f1, 200($s2)
	lwc1 $f2, 0($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f1, 204($s2)
	lwc1 $f2, 4($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f1, 208($s2)
	lwc1 $f2, 8($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t2)						
	
	lwc1 $f1, 212($s2)
	lwc1 $f2, 12($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f1, 216($s2)
	lwc1 $f2, 16($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f1, 220($s1)
	lwc1 $f2, 20($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t1)
	
	lwc1 $f1, 220($s2)
	lwc1 $f2, 20($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f1, 224($s1)
	lwc1 $f2, 24($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f1, 224($s2)
	lwc1 $f2, 24($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f1, 228($s1)
	lwc1 $f2, 28($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f1, 228($s2)
	lwc1 $f2, 28($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f1, 232($s1)
	lwc1 $f2, 32($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f1, 232($s2)
	lwc1 $f2, 32($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f1, 236($s1)
	lwc1 $f2, 36($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f1, 236($s2)
	lwc1 $f2, 36($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j set_sixth_below_column_one_zero
	
set_sixth_below_column_one_zero_done:
	li $t0, 6
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 240
	addi $t2, $t2, 240
	j make_seventh_column_to_one
	
make_seventh_column_to_one:
	bge $t0, $s0, make_seventh_column_to_one_done
	lwc1 $f1, 24($t1)			
	lwc1 $f2, 24($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f2, 28($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f2, 32($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f2, 36($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t1)

	lwc1 $f2, 0($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f2, 4($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f2, 8($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f2, 12($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f2, 16($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f2, 20($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f2, 24($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f2, 28($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f2, 32($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f2, 36($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j make_seventh_column_to_one
	
	
make_seventh_column_to_one_done:
	li $t0, 7
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 280
	addi $t2, $t2, 280
	j set_seventh_below_column_one_zero
	
set_seventh_below_column_one_zero:
	bge $t0, $s0, set_seventh_below_column_one_zero_done
	lwc1 $f1, 240($s2)
	lwc1 $f2, 0($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f1, 244($s2)
	lwc1 $f2, 4($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f1, 248($s2)
	lwc1 $f2, 8($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t2)						
	
	lwc1 $f1, 252($s2)
	lwc1 $f2, 12($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f1, 256($s2)
	lwc1 $f2, 16($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f1, 260($s2)
	lwc1 $f2, 20($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f1, 264($s1)
	lwc1 $f2, 24($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t1)
	
	lwc1 $f1, 264($s2)
	lwc1 $f2, 24($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f1, 268($s1)
	lwc1 $f2, 28($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f1, 268($s2)
	lwc1 $f2, 28($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f1, 272($s1)
	lwc1 $f2, 32($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f1, 272($s2)
	lwc1 $f2, 32($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f1, 276($s1)
	lwc1 $f2, 36($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f1, 276($s2)
	lwc1 $f2, 36($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j set_seventh_below_column_one_zero
	
set_seventh_below_column_one_zero_done:	
	li $t0, 7
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 280
	addi $t2, $t2, 280
	j make_eighth_column_to_one
	
make_eighth_column_to_one:
	bge $t0, $s0, make_eighth_column_to_one_done
	lwc1 $f1, 28($t1)			
	lwc1 $f2, 28($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f2, 32($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f2, 36($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t1)

	lwc1 $f2, 0($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f2, 4($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f2, 8($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f2, 12($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f2, 16($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f2, 20($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f2, 24($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f2, 28($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f2, 32($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f2, 36($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j make_eighth_column_to_one
	
make_eighth_column_to_one_done:
	li $t0, 8
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 320
	addi $t2, $t2, 320
	j set_eighth_below_column_one_zero
	
set_eighth_below_column_one_zero:
	bge $t0, $s0, set_eighth_below_column_one_zero_done
	lwc1 $f1, 280($s2)
	lwc1 $f2, 0($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f1, 284($s2)
	lwc1 $f2, 4($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f1, 288($s2)
	lwc1 $f2, 8($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t2)						
	
	lwc1 $f1, 292($s2)
	lwc1 $f2, 12($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f1, 296($s2)
	lwc1 $f2, 16($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f1, 300($s2)
	lwc1 $f2, 20($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f1, 304($s2)
	lwc1 $f2, 24($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f1, 308($s1)
	lwc1 $f2, 28($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t1)
	
	lwc1 $f1, 308($s2)
	lwc1 $f2, 28($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f1, 312($s1)
	lwc1 $f2, 32($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f1, 312($s2)
	lwc1 $f2, 32($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f1, 316($s1)
	lwc1 $f2, 36($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f1, 316($s2)
	lwc1 $f2, 36($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j set_eighth_below_column_one_zero
	
set_eighth_below_column_one_zero_done:
	li $t0, 8
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 320
	addi $t2, $t2, 320
	j make_ninth_column_to_one
	
make_ninth_column_to_one:
	bge $t0, $s0, make_ninth_column_to_one_done
	lwc1 $f1, 32($t1)			
	lwc1 $f2, 32($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f2, 36($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t1)

	lwc1 $f2, 0($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f2, 4($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f2, 8($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f2, 12($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f2, 16($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f2, 20($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f2, 24($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f2, 28($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f2, 32($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f2, 36($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j make_ninth_column_to_one
	
make_ninth_column_to_one_done:
	li $t0, 9
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 360
	addi $t2, $t2, 360
	j set_ninth_below_column_one_zero
	
set_ninth_below_column_one_zero:
	bge $t0, $s0, set_ninth_below_column_one_zero_done
	lwc1 $f1, 320($s2)
	lwc1 $f2, 0($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f1, 324($s2)
	lwc1 $f2, 4($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f1, 328($s2)
	lwc1 $f2, 8($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 8($t2)						
	
	lwc1 $f1, 332($s2)
	lwc1 $f2, 12($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f1, 336($s2)
	lwc1 $f2, 16($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f1, 340($s2)
	lwc1 $f2, 20($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f1, 344($s2)
	lwc1 $f2, 24($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f1, 348($s2)
	lwc1 $f2, 28($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f1, 352($s1)
	lwc1 $f2, 32($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t1)
	
	lwc1 $f1, 352($s2)
	lwc1 $f2, 32($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f1, 356($s1)
	lwc1 $f2, 36($t1)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t1)
	
	lwc1 $f1, 356($s2)
	lwc1 $f2, 36($t2)
	sub.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j set_ninth_below_column_one_zero
	
set_ninth_below_column_one_zero_done:
	li $t0, 9
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 360
	addi $t2, $t2, 360
	j make_tenth_column_to_one
	
make_tenth_column_to_one:
	bge $t0, $s0, make_tenth_column_to_one_done
	lwc1 $f1, 36($t1)			
	lwc1 $f2, 36($t1)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t1)

	lwc1 $f2, 0($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 0($t2)
	
	lwc1 $f2, 4($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 4($t2)
	
	lwc1 $f2, 8($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 8($t2)
	
	lwc1 $f2, 12($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 12($t2)
	
	lwc1 $f2, 16($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 16($t2)
	
	lwc1 $f2, 20($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 20($t2)
	
	lwc1 $f2, 24($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 24($t2)
	
	lwc1 $f2, 28($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 28($t2)
	
	lwc1 $f2, 32($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 32($t2)
	
	lwc1 $f2, 36($t2)
	div.s $f2, $f2, $f1
	swc1 $f2, 36($t2)
	
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	addi $t0, $t0, 1
	j make_tenth_column_to_one
	
make_tenth_column_to_one_done:
	li $t0, 1
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_first_row_to_zero
	
make_first_row_to_zero:
	bge $t0, $s0, make_first_row_to_zero_done
	move $t3, $s1
	sll $t5, $t0, 2
	add $t3, $t3, $t5
	lwc1 $f1, 0($t3)
	lwc1 $f2, 0($s1)
	lwc1 $f3, 0($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 0($s1)
	
	lwc1 $f2, 0($s2)
	lwc1 $f3, 0($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 0($s2)
	
	lwc1 $f2, 4($s1)
	lwc1 $f3, 4($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 4($s1)
	
	lwc1 $f2, 4($s2)
	lwc1 $f3, 4($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 4($s2)
	
	lwc1 $f2, 8($s1)
	lwc1 $f3, 8($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 8($s1)
	
	lwc1 $f2, 8($s2)
	lwc1 $f3, 8($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 8($s2)
	
	lwc1 $f2, 12($s1)
	lwc1 $f3, 12($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 12($s1)
	
	lwc1 $f2, 12($s2)
	lwc1 $f3, 12($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 12($s2)
	
	lwc1 $f2, 16($s1)
	lwc1 $f3, 16($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 16($s1)
	
	lwc1 $f2, 16($s2)
	lwc1 $f3, 16($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 16($s2)
	
	lwc1 $f2, 20($s1)
	lwc1 $f3, 20($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 20($s1)
	
	lwc1 $f2, 20($s2)
	lwc1 $f3, 20($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 20($s2)
	
	lwc1 $f2, 24($s1)
	lwc1 $f3, 24($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 24($s1)
	
	lwc1 $f2, 24($s2)
	lwc1 $f3, 24($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 24($s2)
	
	lwc1 $f2, 28($s1)
	lwc1 $f3, 28($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 28($s1)
	
	lwc1 $f2, 28($s2)
	lwc1 $f3, 28($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 28($s2)
	
	lwc1 $f2, 32($s1)
	lwc1 $f3, 32($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 32($s1)
	
	lwc1 $f2, 32($s2)
	lwc1 $f3, 32($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 32($s2)
	
	lwc1 $f2, 36($s1)
	lwc1 $f3, 36($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 36($s1)
	
	lwc1 $f2, 36($s2)
	lwc1 $f3, 36($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 36($s2)
	
	addi $t0, $t0, 1
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_first_row_to_zero
	
make_first_row_to_zero_done:
	li $t0, 2
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 80
	addi $t2, $t2, 80
	j make_second_row_to_zero
	
make_second_row_to_zero:
	bge $t0, $s0, make_second_row_to_zero_done
	move $t3, $s1
	sll $t5, $t0, 2
	add $t3, $t3, $t5
	addi $t3, $t3, 40
	lwc1 $f1, 0($t3)
	lwc1 $f2, 40($s1)
	lwc1 $f3, 0($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 40($s1)
	
	lwc1 $f2, 40($s2)
	lwc1 $f3, 0($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 40($s2)
	
	lwc1 $f2, 44($s1)
	lwc1 $f3, 4($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 44($s1)
	
	lwc1 $f2, 44($s2)
	lwc1 $f3, 4($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 44($s2)
	
	lwc1 $f2, 48($s1)
	lwc1 $f3, 8($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 48($s1)
	
	lwc1 $f2, 48($s2)
	lwc1 $f3, 8($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 48($s2)
	
	lwc1 $f2, 52($s1)
	lwc1 $f3, 12($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 52($s1)
	
	lwc1 $f2, 52($s2)
	lwc1 $f3, 12($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 52($s2)
	
	lwc1 $f2, 56($s1)
	lwc1 $f3, 16($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 56($s1)
	
	lwc1 $f2, 56($s2)
	lwc1 $f3, 16($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 56($s2)
	
	lwc1 $f2, 60($s1)
	lwc1 $f3, 20($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 60($s1)
	
	lwc1 $f2, 60($s2)
	lwc1 $f3, 20($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 60($s2)
	
	lwc1 $f2, 64($s1)
	lwc1 $f3, 24($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 64($s1)
	
	lwc1 $f2, 64($s2)
	lwc1 $f3, 24($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 64($s2)
	
	lwc1 $f2, 68($s1)
	lwc1 $f3, 28($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 68($s1)
	
	lwc1 $f2, 68($s2)
	lwc1 $f3, 28($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 68($s2)
	
	lwc1 $f2, 72($s1)
	lwc1 $f3, 32($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 72($s1)
	
	lwc1 $f2, 72($s2)
	lwc1 $f3, 32($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 72($s2)
	
	lwc1 $f2, 76($s1)
	lwc1 $f3, 36($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 76($s1)
	
	lwc1 $f2, 76($s2)
	lwc1 $f3, 36($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 76($s2)
	
	addi $t0, $t0, 1
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_second_row_to_zero
	
make_second_row_to_zero_done:
	li $t0, 3
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 120
	addi $t2, $t2, 120
	j make_third_row_to_zero	
	
make_third_row_to_zero:
	bge $t0, $s0, make_third_row_to_zero_done
	move $t3, $s1
	sll $t5, $t0, 2
	add $t3, $t3, $t5
	addi $t3, $t3, 80
	lwc1 $f1, 0($t3)
	lwc1 $f2, 80($s1)
	lwc1 $f3, 0($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 80($s1)
	
	lwc1 $f2, 80($s2)
	lwc1 $f3, 0($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 80($s2)
	
	lwc1 $f2, 84($s1)
	lwc1 $f3, 4($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 84($s1)
	
	lwc1 $f2, 84($s2)
	lwc1 $f3, 4($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 84($s2)
	
	lwc1 $f2, 88($s1)
	lwc1 $f3, 8($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 88($s1)
	
	lwc1 $f2, 88($s2)
	lwc1 $f3, 8($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 88($s2)
	
	lwc1 $f2, 92($s1)
	lwc1 $f3, 12($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 92($s1)
	
	lwc1 $f2, 92($s2)
	lwc1 $f3, 12($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 92($s2)
	
	lwc1 $f2, 96($s1)
	lwc1 $f3, 16($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 96($s1)
	
	lwc1 $f2, 96($s2)
	lwc1 $f3, 16($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 96($s2)
	
	lwc1 $f2, 100($s1)
	lwc1 $f3, 20($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 100($s1)
	
	lwc1 $f2, 100($s2)
	lwc1 $f3, 20($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 100($s2)
	
	lwc1 $f2, 104($s1)
	lwc1 $f3, 24($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 104($s1)
	
	lwc1 $f2, 104($s2)
	lwc1 $f3, 24($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 104($s2)
	
	lwc1 $f2, 108($s1)
	lwc1 $f3, 28($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 108($s1)
	
	lwc1 $f2, 108($s2)
	lwc1 $f3, 28($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 108($s2)
	
	lwc1 $f2, 112($s1)
	lwc1 $f3, 32($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 112($s1)
	
	lwc1 $f2, 112($s2)
	lwc1 $f3, 32($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 112($s2)
	
	lwc1 $f2, 116($s1)
	lwc1 $f3, 36($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 116($s1)
	
	lwc1 $f2, 116($s2)
	lwc1 $f3, 36($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 116($s2)
	
	addi $t0, $t0, 1
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_third_row_to_zero
	
make_third_row_to_zero_done:
	li $t0, 4
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 160
	addi $t2, $t2, 160
	j make_fourth_row_to_zero	
	
	
make_fourth_row_to_zero:
	bge $t0, $s0, make_fourth_row_to_zero_done
	move $t3, $s1
	sll $t5, $t0, 2
	add $t3, $t3, $t5
	addi $t3, $t3, 120
	lwc1 $f1, 0($t3)
	lwc1 $f2, 120($s1)
	lwc1 $f3, 0($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 120($s1)
	
	lwc1 $f2, 120($s2)
	lwc1 $f3, 0($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 120($s2)
	
	lwc1 $f2, 124($s1)
	lwc1 $f3, 4($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 124($s1)
	
	lwc1 $f2, 124($s2)
	lwc1 $f3, 4($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 124($s2)
	
	lwc1 $f2, 128($s1)
	lwc1 $f3, 8($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 128($s1)
	
	lwc1 $f2, 128($s2)
	lwc1 $f3, 8($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 128($s2)
	
	lwc1 $f2, 132($s1)
	lwc1 $f3, 12($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 132($s1)
	
	lwc1 $f2, 132($s2)
	lwc1 $f3, 12($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 132($s2)
	
	lwc1 $f2, 136($s1)
	lwc1 $f3, 16($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 136($s1)
	
	lwc1 $f2, 136($s2)
	lwc1 $f3, 16($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 136($s2)
	
	lwc1 $f2, 140($s1)
	lwc1 $f3, 20($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 140($s1)
	
	lwc1 $f2, 140($s2)
	lwc1 $f3, 20($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 140($s2)
	
	lwc1 $f2, 144($s1)
	lwc1 $f3, 24($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 144($s1)
	
	lwc1 $f2, 144($s2)
	lwc1 $f3, 24($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 144($s2)
	
	lwc1 $f2, 148($s1)
	lwc1 $f3, 28($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 148($s1)
	
	lwc1 $f2, 148($s2)
	lwc1 $f3, 28($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 148($s2)
	
	lwc1 $f2, 152($s1)
	lwc1 $f3, 32($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 152($s1)
	
	lwc1 $f2, 152($s2)
	lwc1 $f3, 32($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 152($s2)
	
	lwc1 $f2, 156($s1)
	lwc1 $f3, 36($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 156($s1)
	
	lwc1 $f2, 156($s2)
	lwc1 $f3, 36($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 156($s2)
	
	addi $t0, $t0, 1
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_fourth_row_to_zero
	
make_fourth_row_to_zero_done:
	li $t0, 5
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 200
	addi $t2, $t2, 200
	j make_fifth_row_to_zero
	
make_fifth_row_to_zero:
	bge $t0, $s0, make_fifth_row_to_zero_done
	move $t3, $s1
	sll $t5, $t0, 2
	add $t3, $t3, $t5
	addi $t3, $t3, 160
	lwc1 $f1, 0($t3)
	lwc1 $f2, 160($s1)
	lwc1 $f3, 0($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 160($s1)
	
	lwc1 $f2, 160($s2)
	lwc1 $f3, 0($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 160($s2)
	
	lwc1 $f2, 164($s1)
	lwc1 $f3, 4($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 164($s1)
	
	lwc1 $f2, 164($s2)
	lwc1 $f3, 4($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 164($s2)
	
	lwc1 $f2, 168($s1)
	lwc1 $f3, 8($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 168($s1)
	
	lwc1 $f2, 168($s2)
	lwc1 $f3, 8($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 168($s2)
	
	lwc1 $f2, 172($s1)
	lwc1 $f3, 12($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 172($s1)
	
	lwc1 $f2, 172($s2)
	lwc1 $f3, 12($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 172($s2)
	
	lwc1 $f2, 176($s1)
	lwc1 $f3, 16($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 176($s1)
	
	lwc1 $f2, 176($s2)
	lwc1 $f3, 16($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 176($s2)
	
	lwc1 $f2, 180($s1)
	lwc1 $f3, 20($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 180($s1)
	
	lwc1 $f2, 180($s2)
	lwc1 $f3, 20($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 180($s2)
	
	lwc1 $f2, 184($s1)
	lwc1 $f3, 24($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 184($s1)
	
	lwc1 $f2, 184($s2)
	lwc1 $f3, 24($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 184($s2)
	
	lwc1 $f2, 188($s1)
	lwc1 $f3, 28($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 188($s1)
	
	lwc1 $f2, 188($s2)
	lwc1 $f3, 28($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 188($s2)
	
	lwc1 $f2, 192($s1)
	lwc1 $f3, 32($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 192($s1)
	
	lwc1 $f2, 192($s2)
	lwc1 $f3, 32($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 192($s2)
	
	lwc1 $f2, 196($s1)
	lwc1 $f3, 36($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 196($s1)
	
	lwc1 $f2, 196($s2)
	lwc1 $f3, 36($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 196($s2)
	
	addi $t0, $t0, 1
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_fifth_row_to_zero
	
make_fifth_row_to_zero_done:
	li $t0, 6
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 240
	addi $t2, $t2, 240
	j make_sixth_row_to_zero
	
make_sixth_row_to_zero:	
	bge $t0, $s0, make_sixth_row_to_zero_done
	move $t3, $s1
	sll $t5, $t0, 2
	add $t3, $t3, $t5
	addi $t3, $t3, 200
	lwc1 $f1, 0($t3)
	lwc1 $f2, 200($s1)
	lwc1 $f3, 0($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 200($s1)
	
	lwc1 $f2, 200($s2)
	lwc1 $f3, 0($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 200($s2)
	
	lwc1 $f2, 204($s1)
	lwc1 $f3, 4($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 204($s1)
	
	lwc1 $f2, 204($s2)
	lwc1 $f3, 4($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 204($s2)
	
	lwc1 $f2, 208($s1)
	lwc1 $f3, 8($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 208($s1)
	
	lwc1 $f2, 208($s2)
	lwc1 $f3, 8($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 208($s2)
	
	lwc1 $f2, 212($s1)
	lwc1 $f3, 12($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 212($s1)
	
	lwc1 $f2, 212($s2)
	lwc1 $f3, 12($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 212($s2)
	
	lwc1 $f2, 216($s1)
	lwc1 $f3, 16($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 216($s1)
	
	lwc1 $f2, 216($s2)
	lwc1 $f3, 16($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 216($s2)
	
	lwc1 $f2, 220($s1)
	lwc1 $f3, 20($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 220($s1)
	
	lwc1 $f2, 220($s2)
	lwc1 $f3, 20($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 220($s2)
	
	lwc1 $f2, 224($s1)
	lwc1 $f3, 24($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 224($s1)
	
	lwc1 $f2, 224($s2)
	lwc1 $f3, 24($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 224($s2)
	
	lwc1 $f2, 228($s1)
	lwc1 $f3, 28($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 228($s1)
	
	lwc1 $f2, 228($s2)
	lwc1 $f3, 28($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 228($s2)
	
	lwc1 $f2, 232($s1)
	lwc1 $f3, 32($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 232($s1)
	
	lwc1 $f2, 232($s2)
	lwc1 $f3, 32($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 232($s2)
	
	lwc1 $f2, 236($s1)
	lwc1 $f3, 36($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 236($s1)
	
	lwc1 $f2, 236($s2)
	lwc1 $f3, 36($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 236($s2)
	
	addi $t0, $t0, 1
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_sixth_row_to_zero
	
make_sixth_row_to_zero_done:
	li $t0, 7
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 280
	addi $t2, $t2, 280
	j make_seventh_row_to_zero
	
make_seventh_row_to_zero:
	bge $t0, $s0, make_seventh_row_to_zero_done
	move $t3, $s1
	sll $t5, $t0, 2
	add $t3, $t3, $t5
	addi $t3, $t3, 240
	lwc1 $f1, 0($t3)
	lwc1 $f2, 240($s1)
	lwc1 $f3, 0($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 240($s1)
	
	lwc1 $f2, 240($s2)
	lwc1 $f3, 0($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 240($s2)
	
	lwc1 $f2, 244($s1)
	lwc1 $f3, 4($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 244($s1)
	
	lwc1 $f2, 244($s2)
	lwc1 $f3, 4($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 244($s2)
	
	lwc1 $f2, 248($s1)
	lwc1 $f3, 8($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 248($s1)
	
	lwc1 $f2, 248($s2)
	lwc1 $f3, 8($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 248($s2)
	
	lwc1 $f2, 252($s1)
	lwc1 $f3, 12($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 252($s1)
	
	lwc1 $f2, 252($s2)
	lwc1 $f3, 12($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 252($s2)
	
	lwc1 $f2, 256($s1)
	lwc1 $f3, 16($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 256($s1)
	
	lwc1 $f2, 256($s2)
	lwc1 $f3, 16($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 256($s2)
	
	lwc1 $f2, 260($s1)
	lwc1 $f3, 20($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 260($s1)
	
	lwc1 $f2, 260($s2)
	lwc1 $f3, 20($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 260($s2)
	
	lwc1 $f2, 264($s1)
	lwc1 $f3, 24($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 264($s1)
	
	lwc1 $f2, 264($s2)
	lwc1 $f3, 24($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 264($s2)
	
	lwc1 $f2, 268($s1)
	lwc1 $f3, 28($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 268($s1)
	
	lwc1 $f2, 268($s2)
	lwc1 $f3, 28($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 268($s2)
	
	lwc1 $f2, 272($s1)
	lwc1 $f3, 32($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 272($s1)
	
	lwc1 $f2, 272($s2)
	lwc1 $f3, 32($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 272($s2)
	
	lwc1 $f2, 276($s1)
	lwc1 $f3, 36($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 276($s1)
	
	lwc1 $f2, 276($s2)
	lwc1 $f3, 36($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 276($s2)
	
	addi $t0, $t0, 1
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_seventh_row_to_zero
	
make_seventh_row_to_zero_done:
	li $t0, 8
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 320
	addi $t2, $t2, 320
	j make_eighth_row_to_zero
	
make_eighth_row_to_zero:
	bge $t0, $s0, make_eighth_row_to_zero_done
	move $t3, $s1
	sll $t5, $t0, 2
	add $t3, $t3, $t5
	addi $t3, $t3, 280
	lwc1 $f1, 0($t3)
	lwc1 $f2, 280($s1)
	lwc1 $f3, 0($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 280($s1)
	
	lwc1 $f2, 280($s2)
	lwc1 $f3, 0($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 280($s2)
	
	lwc1 $f2, 284($s1)
	lwc1 $f3, 4($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 284($s1)
	
	lwc1 $f2, 284($s2)
	lwc1 $f3, 4($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 284($s2)
	
	lwc1 $f2, 288($s1)
	lwc1 $f3, 8($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 288($s1)
	
	lwc1 $f2, 288($s2)
	lwc1 $f3, 8($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 288($s2)
	
	lwc1 $f2, 292($s1)
	lwc1 $f3, 12($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 292($s1)
	
	lwc1 $f2, 292($s2)
	lwc1 $f3, 12($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 292($s2)
	
	lwc1 $f2, 296($s1)
	lwc1 $f3, 16($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 296($s1)
	
	lwc1 $f2, 296($s2)
	lwc1 $f3, 16($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 296($s2)
	
	lwc1 $f2, 300($s1)
	lwc1 $f3, 20($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 300($s1)
	
	lwc1 $f2, 300($s2)
	lwc1 $f3, 20($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 300($s2)
	
	lwc1 $f2, 304($s1)
	lwc1 $f3, 24($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 304($s1)
	
	lwc1 $f2, 304($s2)
	lwc1 $f3, 24($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 304($s2)
	
	lwc1 $f2, 308($s1)
	lwc1 $f3, 28($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 308($s1)
	
	lwc1 $f2, 308($s2)
	lwc1 $f3, 28($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 308($s2)
	
	lwc1 $f2, 312($s1)
	lwc1 $f3, 32($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 312($s1)
	
	lwc1 $f2, 312($s2)
	lwc1 $f3, 32($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 312($s2)
	
	lwc1 $f2, 316($s1)
	lwc1 $f3, 36($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 316($s1)
	
	lwc1 $f2, 316($s2)
	lwc1 $f3, 36($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 316($s2)
	
	addi $t0, $t0, 1
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_eighth_row_to_zero
	
make_eighth_row_to_zero_done:
	li $t0, 9
	move $t1, $s1
	move $t2, $s2
	addi $t1, $t1, 360
	addi $t2, $t2, 360
	j make_ninth_row_to_zero
	
make_ninth_row_to_zero:	
	bge $t0, $s0, make_ninth_row_to_zero_done
	move $t3, $s1
	sll $t5, $t0, 2
	add $t3, $t3, $t5
	addi $t3, $t3, 320
	lwc1 $f1, 0($t3)
	lwc1 $f2, 320($s1)
	lwc1 $f3, 0($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 320($s1)
	
	lwc1 $f2, 320($s2)
	lwc1 $f3, 0($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 320($s2)
	
	lwc1 $f2, 324($s1)
	lwc1 $f3, 4($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 324($s1)
	
	lwc1 $f2, 324($s2)
	lwc1 $f3, 4($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 324($s2)
	
	lwc1 $f2, 328($s1)
	lwc1 $f3, 8($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 328($s1)
	
	lwc1 $f2, 328($s2)
	lwc1 $f3, 8($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 328($s2)
	
	lwc1 $f2, 332($s1)
	lwc1 $f3, 12($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 332($s1)
	
	lwc1 $f2, 332($s2)
	lwc1 $f3, 12($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 332($s2)
	
	lwc1 $f2, 336($s1)
	lwc1 $f3, 16($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 336($s1)
	
	lwc1 $f2, 336($s2)
	lwc1 $f3, 16($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 336($s2)
	
	lwc1 $f2, 340($s1)
	lwc1 $f3, 20($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 340($s1)
	
	lwc1 $f2, 340($s2)
	lwc1 $f3, 20($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 340($s2)
	
	lwc1 $f2, 344($s1)
	lwc1 $f3, 24($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 344($s1)
	
	lwc1 $f2, 344($s2)
	lwc1 $f3, 24($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 344($s2)
	
	lwc1 $f2, 348($s1)
	lwc1 $f3, 28($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 348($s1)
	
	lwc1 $f2, 348($s2)
	lwc1 $f3, 28($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 348($s2)
	
	lwc1 $f2, 352($s1)
	lwc1 $f3, 32($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 352($s1)
	
	lwc1 $f2, 352($s2)
	lwc1 $f3, 32($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 352($s2)
	
	lwc1 $f2, 356($s1)
	lwc1 $f3, 36($t1)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 356($s1)
	
	lwc1 $f2, 356($s2)
	lwc1 $f3, 36($t2)
	mul.s $f3, $f3, $f1
	sub.s $f2, $f2, $f3
	swc1 $f2, 356($s2)
	
	addi $t0, $t0, 1
	addi $t1, $t1, 40
	addi $t2, $t2, 40
	j make_ninth_row_to_zero
	
	
make_ninth_row_to_zero_done:
	li $t0, 0
	move $t1, $s1
	move $t2, $s2
	j print_array
	
print_array:
	bge $t0, $s3, exit
	lwc1 $f12, 0($t2)
	li   $v0, 2
	syscall
	li   $v0, 4
    	la   $a0, newline
    	syscall
    	addi $t0, $t0, 1
    	addi $t2, $t2, 4
    	j print_array
    	
exit:
    li $v0, 10
    syscall
