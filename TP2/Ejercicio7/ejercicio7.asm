section .text
GLOBAL _start
EXTERN print
EXTERN numtos
EXTERN exit

_start:
	 mov ebx, array
	 mov ecx, 7
	 call min
	 mov ebx, string
	 call numtos
	 call print
	
	mov ebx, 0
	call exit
;Recibo en ecx el tamaño del array
;En ebx el puntero al array
;Retorno el minimo en eax
min:
	push ebx
	push ecx
	push edx

	mov edx, 0

	mov eax, [ebx]
	.findmin:
		dec ecx
		cmp eax, [ebx + 4*ecx]
		jle .next
		mov eax, [ebx + 4*ecx]
		.next:
		test ecx, ecx
	jnz .findmin

	pop edx
	pop ecx
	pop ebx
	ret


section .data
	string db 10
section .rodata
	array dd 10, 9, 19, 10, 19, 102, 11, 103

