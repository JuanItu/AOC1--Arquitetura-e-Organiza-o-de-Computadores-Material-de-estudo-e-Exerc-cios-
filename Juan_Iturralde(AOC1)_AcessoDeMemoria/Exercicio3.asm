.data
a: .word -3       # Coeficiente -a: (-3)
b: .word 7        # Coeficiente b: 7
c: .word 5        # Coeficiente -c: (-5)
d: .word -2       # Coeficiente d: (-2)
e: .word 8        # Coeficiente -e: (-8)
x: .word 4        # Variável x: 4
y: .space 4       # Espaço para o resultado 'y'

.text
.globl main
main:
  
    # 1. Carregar Variáveis da Memória para Registradores
    
    la   $t0, a       # $t0 = Endereço de 'a'
    lw   $s0, 0($t0)  # $s0 = Valor de a (-3)

    la   $t1, b       # $t1 = Endereço de 'b'
    lw   $s1, 0($t1)  # $s1 = Valor de b (7)

    la   $t2, c       # $t2 = Endereço de 'c'
    lw   $s2, 0($t2)  # $s2 = Valor de c (5)

    la   $t3, d       # $t3 = Endereço de 'd'
    lw   $s3, 0($t3)  # $s3 = Valor de d (-2)

    la   $t4, e       # $t4 = Endereço de 'e'
    lw   $s4, 0($t4)  # $s4 = Valor de e (8)

    la   $t5, x       # $t5 = Endereço de 'x'
    lw   $s5, 0($t5)  # $s5 = Valor de x (4)
    # $s6 será usado como acumulador para o resultado y

    
    # 2. Implementação do Método de Horner
    # y = (((-a * x + b) * x - c) * x + d) * x - e
   

    # Coeficiente de x^4 no polinômio original é -a.
    # Como $s0 já armazena 'a', calculamos -a.
    sub  $t6, $zero, $s0  # $t6 = -a ( -(-3) = 3 )

    # Passo 1: -a * x + b 
    mul  $s6, $t6, $s5    # $s6 = -a * x (3 * 4 = 12)
    add  $s6, $s6, $s1    # $s6 = (-a * x) + b (12 + 7 = 19)

    # Passo 2: (Resultado do Passo 1) * x - c 
    mul  $s6, $s6, $s5    # $s6 = (Passo 1) * x (19 * 4 = 76)
    sub  $s6, $s6, $s2    # $s6 = (Resultado) - c (76 - 5 = 71)

    # Passo 3: (Resultado do Passo 2) * x + d 
    mul  $s6, $s6, $s5    # $s6 = (Passo 2) * x (71 * 4 = 284)
    add  $s6, $s6, $s3    # $s6 = (Resultado) + d (284 + (-2) = 282)

    # Passo 4: (Resultado do Passo 3) * x - e 
    mul  $s6, $s6, $s5    # $s6 = (Passo 3) * x (282 * 4 = 1128)
    sub  $s6, $s6, $s4    # $s6 = (Resultado) - e (1128 - 8 = 1120)
                          # $s6 armazena o resultado final 'y'

   
    # 3. Armazenar o resultado 'y' na memória
    
    la   $t7, y           # $t7 = Endereço de memória de 'y'
    sw   $s6, 0($t7)      # Armazena o valor de $s6 (y = 1120) no endereço 'y'

    
    # 4. Finalizar o programa
    
    li $v0, 10            # Código de serviço para sair (exit)
    syscall