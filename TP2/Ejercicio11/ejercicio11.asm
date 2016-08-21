EXTERN numtos
EXTERN print
EXTERN exit
GLOBAL _start

section .text
_start:
	mov		ebp,esp
	mov		edx,[ebp]
	mov		ebx,[ebp+76+4*edx]
	call print
	call exit



section .bss
	aux resb 10
