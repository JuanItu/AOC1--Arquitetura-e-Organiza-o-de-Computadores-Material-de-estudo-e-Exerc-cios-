ori  $t1,$zero,0x1234
sll  $t1,$t1,16
ori  $t1,$t1,0x5678

andi $t2,$t1,0xF
sll  $t2,$t2,28

srl  $t3,$t1,4
andi $t3,$t3,0xF
sll  $t3,$t3,24
or   $t2,$t2,$t3

srl  $t3,$t1,8
andi $t3,$t3,0xF
sll  $t3,$t3,20
or   $t2,$t2,$t3

srl  $t3,$t1,12
andi $t3,$t3,0xF
sll  $t3,$t3,16
or   $t2,$t2,$t3

srl  $t3,$t1,16
andi $t3,$t3,0xF
sll  $t3,$t3,12
or   $t2,$t2,$t3

srl  $t3,$t1,20
andi $t3,$t3,0xF
sll  $t3,$t3,8
or   $t2,$t2,$t3

srl  $t3,$t1,24
andi $t3,$t3,0xF
sll  $t3,$t3,4
or   $t2,$t2,$t3

srl  $t3,$t1,28
andi $t3,$t3,0xF
or   $t2,$t2,$t3