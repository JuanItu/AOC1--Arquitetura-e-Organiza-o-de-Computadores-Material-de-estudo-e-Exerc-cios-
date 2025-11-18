# Inicialização com temperatura de exemplo
ori $t0, $zero, 35     # Substitua 35 por qualquer temperatura a testar

# Verificar primeiro intervalo: 20 ? temp ? 40
verificar_intervalo1:
    slti $t1, $t0, 20   # $t1 = 1 se temp < 20, senão 0
    bne $t1, $zero, fora_intervalo  # Se temp < 20, está fora
    
    slti $t1, $t0, 41   # $t1 = 1 se temp ? 40, senão 0
    beq $t1, $zero, verificar_intervalo2  # Se temp > 40, verifica próximo intervalo
    
    j dentro_intervalo   # Se chegou aqui, 20 ? temp ? 40

# Verificar segundo intervalo: 60 ? temp ? 80
verificar_intervalo2:
    slti $t1, $t0, 60   # $t1 = 1 se temp < 60, senão 0
    bne $t1, $zero, fora_intervalo  # Se temp < 60, está fora
    
    slti $t1, $t0, 81   # $t1 = 1 se temp ? 80, senão 0
    beq $t1, $zero, fora_intervalo  # Se temp > 80, está fora
    
    j dentro_intervalo   # Se chegou aqui, 60 ? temp ? 80

dentro_intervalo:
    li $t1, 1           # Flag = 1 (temperatura dentro dos intervalos)
    j fim

fora_intervalo:
    li $t1, 0           # Flag = 0 (temperatura fora dos intervalos)

fim:
    # Programa termina aqui, com $t1 contendo a flag