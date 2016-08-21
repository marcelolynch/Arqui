section .text
GLOBAL _start
EXTERN exit
EXTERN numtos
EXTERN print

_start:
	mov ecx, [number]
	
	call sum
	mov ebx, string
	call numtos

	call print

	call exit


;Recibo en ecx un numero N
;Devuevo en eax la suma de 1 a N
;No se modifican mas registros que eax
sum:
	push ecx
	mov eax, 0
	
	.sumN:
	add eax, ecx
	loop .sumN

	pop ecx
	ret

section .data
	number dd 10

section .bss
	string: resb 10