section .text
GLOBAL _start
EXTERN exit
EXTERN numtos
EXTERN print

_start:
	mov edx, [n]
	mov ecx, [k]
	xor eax, eax
	
 .sloop:
	add eax, edx
	cmp ecx, eax
	jl .fin
	mov ebx, string
	call numtos
	call print
	mov ebx, bn
	call print
	jmp .sloop


.fin:
	mov ebx, 0
	call exit



section .data
	n dd 6
	k dd 102

section .rodata
	bn db 10, 0

section .bss
	string: resb 10