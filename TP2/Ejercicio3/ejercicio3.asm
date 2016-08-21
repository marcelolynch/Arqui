section .text
GLOBAL _start

EXTERN print
EXTERN exit
EXTERN numtos

_start:
	mov ebx, mensaje
	call print

	mov eax, 3492349021
	mov ebx, string
	call numtos
	call print

	mov ebx, barra_n
	call print

	mov ebx, 0 ;Valor de retorno
	call exit


section .data
mensaje db "El numero es: ", 0
barra_n db 10, 0

section .bss
	string: resb 50

