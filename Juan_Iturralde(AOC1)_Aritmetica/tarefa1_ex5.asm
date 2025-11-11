addi $t1, $zero, 4

addi $t2, $zero, 8

addi $a0, $zero, 2

mult $t1, $t2
mflo $t3

div $t3, $a0

mflo $t3