EXTERN numtos
EXTERN print
EXTERN exit
GLOBAL _start

section .text
_start:
	mov ebp, esp
	mov ebx, aux
	mov eax, [ebp]
	call numtos
	call print
	call exit



section .bss
	aux resb 10