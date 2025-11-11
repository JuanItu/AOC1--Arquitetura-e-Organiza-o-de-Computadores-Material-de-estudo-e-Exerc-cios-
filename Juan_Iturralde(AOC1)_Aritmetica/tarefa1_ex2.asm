addi $s0, $zero, 4
addi $s1, $zero, 2
addi $s2, $zero, 3


addi $t1, $zero, 7
addi $t2, $zero, 3
addi $t3, $zero, 9

mult $s0, $t1
mflo $t4


mult $s1, $t2
mflo $t5


mult $s2, $t3
mflo $t6 


sub $t7, $t4, $t5

add $t7, $t7, $t5


