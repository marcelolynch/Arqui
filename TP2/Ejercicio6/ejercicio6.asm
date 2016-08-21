section .text
GLOBAL _start
EXTERN exit
EXTERN numtos
EXTERN print

_start:
	mov ecx, [number]
	
	call factorial
	mov ebx, string
	call numtos

	call print

	call exit


;Recibo en ecx un numero N
;Devuevo en eax el factorial de N
;No se modifican mas registros que eax
factorial:
	push ecx
	mov eax, 1
	
	.fact:
	mul ecx
	loop .fact

	pop ecx
	ret

section .data
	number dd 5

section .bss
	string: resb 10