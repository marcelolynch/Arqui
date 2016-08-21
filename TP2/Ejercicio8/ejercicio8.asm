GLOBAL _start
EXTERN exit
EXTERN selection_sort
EXTERN print
EXTERN numtos

section .text



_start:
	mov ecx, size_bt
	shr ecx, 2  ;En ECX queda el tamaño del array
	mov edx, ecx
	mov ebx, array

	call selection_sort

	mov ecx, edx
	call printArray
	call exit

printArray:
		mov edx, 0
		.print:
		call printNext
		inc edx
	loop .prinrett
ret


printNext:
	push eax
	mov eax, [ebx + 4*edx]
	push ebx
	mov ebx, aux
	call numtos
	call print
	mov ebx, newline
	call print
	pop ebx
	pop eax
	ret


section .data
	newline db 10, 0
	array dd 10, 15, 2919, 10, 391, 31, 1, 5, 30
	size_bt equ $ - array


section .bss
	aux resb 32	

