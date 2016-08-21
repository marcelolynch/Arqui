global _start
extern exit
extern print
extern uppercase

section .text
_start:
	mov ebx, 0 ;Entrada estandar

	mov ecx, aux
	mov edx, 1000 	;Leo hasta 1000 bytes
	mov eax, 3 ;Syscall read
	int 80h

	mov byte [aux + eax], 0 ;Termino en null
	mov ebx, aux
	call uppercase

	call print
	call exit

section .bss
	aux resb 1001