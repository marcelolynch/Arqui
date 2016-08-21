EXTERN numtos
EXTERN print
EXTERN exit
GLOBAL _start

section .text
_start:
	mov		ebp,esp
	mov		eax,[ebp]
	mov		ebx,[ebp + 4*eax + 76] ;El 76 es empirico, ahi esta $USER
	call print
	call exit



section .bss
	aux resb 10
