global _start
extern print
extern exit
extern numtos

section .text
_start:
	mov eax, esp
	
	call print_argnum

	add eax, 4
	mov ecx, 0

	.loop:
		mov ebx, [eax]
		test ebx, ebx
		jz .fin
		call print_before
		inc ecx
		call print
		mov ebx, newline
		call print
		add eax, 4
		jmp .loop
	.fin:
		call exit

print_argnum:
	push eax
	push ebx

	mov ebx, argc
	call print
	mov ebx, aux
	mov eax, [eax]
	call numtos
	call print

	mov ebx, newline
	call print

	pop ebx
	pop eax
	ret



print_before:
	push eax
	push ebx
	mov ebx, first
	call print 		;imprime argv[
	mov eax, ecx
	mov ebx, aux
	call numtos
	call print  	;imprime el numero de arg
	mov ebx, last
	call print  	;imprime ]: 
	
	pop ebx
	pop eax
	ret



section .data
	argc db "Cantidad de argumentos: ", 0
	first db "argv[", 0
	last db "]: ",0
	newline db 10, 0

section .bss
	aux resb 32