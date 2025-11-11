addi $a1, $zero, 3 
addi $a2, $zero, 5
addi $a3, $zero, 13

addi $t5, $zero, 2

mult $a2, $t5
mflo $v1

mult $t5, $t5
mflo $t5

mult $a1, $t5
mflo $v0

sub $t6, $v0, $v1

add $t6, $t6, $a3

