.data
x: .word 7
y: .space 4

.text
.globl main

main:
    # Carregar o valor de x da memória
    lw $t0, x           # Carrega x em $t0
    
    # Casos base: Fibonacci(1) = 1, Fibonacci(2) = 1
    li $t1, 1           # $t1 = Fibonacci(n-1)
    li $t2, 1           # $t2 = Fibonacci(n-2)
    li $t3, 1           # $t3 = resultado atual (inicia com Fib(1))
    
    # Verificar se x é 1 ou 2
    beq $t0, 1, fim     # Se x == 1, vai para o fim
    beq $t0, 2, fim     # Se x == 2, vai para o fim
    
    # Inicializar contador para loop (começa em 3, pois Fib(1) e Fib(2) já sabemos)
    li $t4, 3           # contador i = 3

loop:
    # Calcular próximo termo: Fib(i) = Fib(i-1) + Fib(i-2)
    add $t3, $t1, $t2   # $t3 = $t1 + $t2
    
    # Atualizar valores para próxima iteração
    move $t2, $t1       # Fib(i-2) = Fib(i-1) anterior
    move $t1, $t3       # Fib(i-1) = Fib(i) atual
    
    # Incrementar contador e verificar se chegou em x
    addi $t4, $t4, 1    # i = i + 1
    ble $t4, $t0, loop  # Se i <= x, continua no loop

fim:
    # Armazenar o resultado em y (0x10010004)
    sw $t3, y           # Armazena o resultado na posição y
    
    # Finalizar o programa
    li $v0, 10          # Código de saída do programa
    syscall