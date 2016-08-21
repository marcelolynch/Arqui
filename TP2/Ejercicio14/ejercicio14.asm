global _start
extern exit
extern print
extern numtos

section .text
_start:
	mov eax, 2 ;ID del syscall FORK
	int 80h  ;Syscal

	;Se duplico el programa: en el hijo se devolvio 0 y en el padre el PID del hijo
	test eax, eax
	jnz .padre

	mov ebx, msg_c
	jmp .next

	.padre:
	mov ebx, msg_p

	.next:
	call print
	call print_pid

	call exit


print_pid:
	push eax
	push ebx

	mov eax, 20		; ID del Syscall GETPID
	int 80h

	mov ebx, msg_pid
	call print

	mov ebx, aux
	call numtos
	call print

	mov ebx,  nl
	call print
	
	pop ebx
	pop eax
	ret


section .rodata
	msg_pid db "PID: ", 0
	nl db 10, 0
	msg_p db "Soy el padre",10, 0
	msg_c db "Soy el hijo", 10, 0

section .bss
	aux resb 10