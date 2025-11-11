
addi $a1, $zero, 9 
addi $a2, $zero, 2
addi $t1, $zero, 2


mult $a1, $t1
mflo $v0

addi $a1, $zero, 7
add $v0, $a1, $v0

mult $a2, $t1
mflo $v1

addi $a2, $zero, 8
add $v1, $v1, $a2

div $v0, $v1
mfhi $t3
mflo $t2

