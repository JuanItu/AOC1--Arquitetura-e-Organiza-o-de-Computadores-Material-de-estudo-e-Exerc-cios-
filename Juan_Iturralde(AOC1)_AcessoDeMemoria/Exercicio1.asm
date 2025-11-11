.data
a: .word 3        # Variável 'a' com valor inicial 3 (ocupa 4 bytes)
b: .word 5        # Variável 'b' com valor inicial 5 (ocupa 4 bytes)
y: .space 4       # Espaço para a variável 'y' (resultado, 4 bytes)

.text
.globl main
main:

    # 1. Carregar os valores de a e b da memória para registradores
    
    la   $t0, a      # $t0 = Endereço de memória de 'a'
    lw   $s0, 0($t0) # $s0 = Valor de 'a' (3)

    la   $t1, b      # $t1 = Endereço de memória de 'b'
    lw   $s1, 0($t1) # $s1 = Valor de 'b' (5)
    
    # 2. Calcular o termo 32ab (32 * a * b)
    
    # A multiplicação por 32 pode ser feita com um shift left lógico (sll)
    # 32 = 2^5, então 32 * x = x << 5
    # Ou, para evitar o uso de registradores temporários adicionais:
    # 32 * a * b = (a * b) * 32

    mul  $t2, $s0, $s1 # $t2 = a * b (3 * 5 = 15)

    sll  $t3, $t2, 5   # $t3 = (a * b) * 32. ($t3 = 15 * 32 = 480).
                       # $t3 armazena o primeiro termo: 32ab
                       
    # 3. Calcular o termo -3a
    
    # Calcular 3 * a
    li   $t4, 3        # $t4 = constante 3
    mul  $t5, $s0, $t4 # $t5 = 3 * a (3 * 3 = 9)

    # Calcular -3a. Subtrair 3a do resultado acumulado,
    # ou usar sub para obter o negativo. Aqui, faremos a subtração na próxima etapa.
    # $t5 armazena o segundo termo: 3a

    # 4. Calcular o termo 7b

    # Calcular 7 * b
    li   $t6, 7        # $t6 = constante 7
    mul  $t7, $s1, $t6 # $t7 = 7 * b (7 * 5 = 35)
                       # $t7 armazena o terceiro termo: 7b

    # 5. Combinar os termos: y = 32ab - 3a + 7b - 13

    # Passo 1: 32ab - 3a
    sub  $s2, $t3, $t5 # $s2 = 32ab - 3a (480 - 9 = 471)

    # Passo 2: (32ab - 3a) + 7b
    add  $s2, $s2, $t7 # $s2 = (32ab - 3a) + 7b (471 + 35 = 506)

    # Passo 3: (32ab - 3a + 7b) - 13
    li   $t8, 13       # $t8 = constante 13
    sub  $s2, $s2, $t8 # $s2 = Resultado final 'y' (506 - 13 = 493)
                       # $s2 armazena o resultado final 'y'

    # 6. Armazenar o resultado 'y' na memória

    la   $t9, y        # $t9 = Endereço de memória de 'y'
    sw   $s2, 0($t9)   # Armazena o valor de $s2 (y = 493) no endereço 'y'


    # 7. Finalizar o programa

    li $v0, 10         # Código de serviço para sair (exit)
    syscall