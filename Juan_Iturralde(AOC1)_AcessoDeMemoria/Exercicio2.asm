.data
a: .word 3        # Variável 'a' com valor inicial 3 (ocupa 4 bytes)
y: .space 4       # Espaço para a variável 'y' (resultado, 4 bytes)

.text
.globl main
main:
    # ----------------------------------------------------
    # 1. Configuração e Carregamento de Variáveis
    # ----------------------------------------------------
    la   $t0, a      # $t0 = Endereço de memória de 'a'
    lw   $s0, 0($t0) # $s0 = Valor de 'a' (3)

    # Coeficientes do polinômio, armazenados em registradores
    li   $s1, 9      # $s1 = Coeficiente de a^3 (c3)
    li   $s2, -5     # $s2 = Coeficiente de a^2 (c2)
    li   $s3, 7      # $s3 = Coeficiente de a^1 (c1)
    li   $s4, 15     # $s4 = Coeficiente constante (c0)

 
    # 2. Implementação do Método de Horner: y = ((9a - 5)a + 7)a + 15

    # O registrador $t1 será o acumulador do resultado (y)

    # Passo 1: y = 9a - 5   (Começamos com o coeficiente de maior grau)
    mul  $t1, $s1, $s0 # $t1 = 9 * a (9 * 3 = 27)
    add  $t1, $t1, $s2 # $t1 = 9a + (-5) = 27 - 5 = 22

    # Passo 2: y = (9a - 5)a + 7
    mul  $t1, $t1, $s0 # $t1 = (9a - 5) * a (22 * 3 = 66)
    add  $t1, $t1, $s3 # $t1 = (9a - 5)a + 7 (66 + 7 = 73)

    # Passo 3: y = ((9a - 5)a + 7)a + 15
    mul  $t1, $t1, $s0 # $t1 = ((9a - 5)a + 7) * a (73 * 3 = 219)
    add  $t1, $t1, $s4 # $t1 = y (219 + 15 = 234)
                       # $t1 armazena o resultado final 'y'


    # 3. Armazenar o resultado 'y' na memória

    la   $t2, y        # $t2 = Endereço de memória de 'y'
    sw   $t1, 0($t2)   # Armazena o valor de $t1 (y = 234) no endereço 'y'


    # 4. Finalizar o programa

    li $v0, 10         # Código de serviço para sair (exit)
    syscall