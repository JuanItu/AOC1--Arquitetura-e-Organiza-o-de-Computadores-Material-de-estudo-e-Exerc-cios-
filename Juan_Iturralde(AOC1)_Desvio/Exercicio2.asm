.data
y: .space 4

.text
.globl main

main:
    # Inicialização dos registradores
    li $t0, 1           # Contador (i) começando em 1
    li $t1, 333         # Valor máximo
    li $t2, 0           # Acumulador da soma (inicia em 0)

loop:
    # Adicionar o valor atual ao acumulador
    add $t2, $t2, $t0   # soma = soma + i
    
    # Incrementar o contador
    addi $t0, $t0, 1    # i = i + 1
    
    # Verificar se chegou ao final (i <= 333)
    ble $t0, $t1, loop  # Se i <= 333, continua no loop

    # Armazenar o resultado em y (0x10010000)
    sw $t2, y           # Armazena o resultado na posição y

    # Finalizar o programa
    li $v0, 10          # Código de saída do programa
    syscall