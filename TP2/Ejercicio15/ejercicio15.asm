global _start
extern exit
extern print
extern numtos

section .text
_start:
	mov ebx, tic
	call print

	mov ebx, time ;cantidad
	mov eax, 162 ;syscall nanosleep
	int 80h

	mov ebx, toc
	call print

	call exit

section .data
	time dd 5, 0  ;5 segundos + 0 nanosegundos

section .rodata
	tic db "tic", 10, 0
	toc db "toc", 10, 0