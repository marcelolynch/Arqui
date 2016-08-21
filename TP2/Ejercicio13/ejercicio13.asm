global _start
extern exit
extern print
extern numtos

section .text
_start:
	mov eax, 20		; ID del Syscall GETPID
	int 80h

	mov ebx, s
	call print

	mov ebx, aux
	call numtos
	call print

	mov ebx,  nl
	call print
	
	call exit


section .rodata
	s db "PID: ",0
	nl db 10, 0
section .bss
	aux resb 20