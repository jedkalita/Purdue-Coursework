org     0x0000
ori     $29, $0, 0xFFFC
#Check for all operation
ori	$10, $0, 1
ori	$11, $0, 2
ori $28, $0, 2000
addu $2, $10, $11
sw $2, 0($28)
add $2, $10, $2
sw $2, 4($28)
lw $2, 0($28)
and $2, $2, $11
sw $2, 8($28)
nor $2, $2, $10
sw $2, 12($28)
or $2, $2, $11
sw $2, 16($28)
slt $2, $2, $10
sw $2, 20($28)
sltu $2, $2, $10
sw $2, 24($28)
sll $2, $2, 1
sw $2, 28($28)
srl $2, $2, 4
sw $2, 32($28)
subu $2, $2, $11
sw $2, 36($28)
sub $2, $2, $10
sw $2, 40($28)
xor $2, $2, $11
sw $2, 44($28)
addiu $2, $2, 10
sw $2, 48($28)
addi $2, $2, 3
sw $2, 52($28)
andi $2, $2, 250
sw $2, 56($28)
lui $2, 65
sw $2, 60($28)
slti $2, $2, 3
sw $2, 64($28)
sltiu $2, $2, 1
sw $2, 68($28)
xori $2, $2, 67
sw $2, 72($28)
halt
