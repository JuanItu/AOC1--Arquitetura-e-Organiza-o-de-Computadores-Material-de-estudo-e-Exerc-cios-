.data
a: .half 30
b: .half 5
y: .space 4

.text
.globl main

main:
    # Carregar os valores de a e b da memória
    lh $t0, a          # Carrega halfword a em $t0
    lh $t1, b          # Carrega halfword b em $t1
    
    # Verificar se a e b são iguais
    beq $t0, $t1, multiplicacao  # Se a == b, vai para multiplicacao
    j divisao                    # Senão, vai para divisao

multiplicacao:
    # Multiplicação: y = a * b
    mult $t0, $t1      # Multiplica a * b
    mflo $t2           # Move o resultado da multiplicação para $t2
    j armazenar        # Vai para armazenar o resultado

divisao:
    # Divisão: y = a / b
    div $t0, $t1       # Divide a / b
    mflo $t2           # Move o quociente da divisão para $t2

armazenar:
    # Armazenar o resultado em y (0x10010004)
    sw $t2, y          # Armazena o resultado na posição y

    # Finalizar o programa
    li $v0, 10         # Código de saída do programa
    syscall