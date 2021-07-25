#Autor: Olavo M

.data
v: .word 3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0,17,30,-19,23 #vetor de inteiros desordenado
Numero: .asciiz "O numero de elementos pares eh: "

.text
li $s0, 20 # tamanho do vetor = 20
subi $t0, $s0, 1 # tamanho - 1 em $t0
li $s1, 0 # i = 0 
li $s2, 0 # contador_pares = 0 
li $s4, 2

la $s3, v # endereco de v em $s3

laco:
ble $s1,$t0,while	# while i<=(tamanho-1)
j fim

while:
lw $t1, 0($s3) # coloca o elemento 0 em $t1
div $t1, $s4
mfhi $t2 # resto da divisao de v[i] por 2 em $t2
#if resto == 0 incrementar o contador
beq $t2, $zero, incrementar
j fim_do_if
incrementar:
addi $s2,$s2,1 # contador_pares = contador_pares + 1
j fim_do_if

fim_do_if:
addi $s1, $s1, 1 # i = i + 1 
addiu $s3,$s3,4 #proximo elemento (adiciona 4 bytes a $s3)
j laco
	    
fim:
#imprime o contador_pares
li $v0,4
la $a0,Numero
syscall

li $v0, 1
move $a0, $s2
syscall 