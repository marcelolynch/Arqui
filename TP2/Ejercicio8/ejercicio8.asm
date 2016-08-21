GLOBAL _start
EXTERN exit
EXTERN selection_sort
EXTERN print
EXTERN numtos

section .text



_start:

	mov ebx, msg1
	call print

	mov ecx, size_bt
	shr ecx, 2  ;En ECX queda el tamaño del array
	mov edx, ecx


	mov ebx, array
	call printArray

	mov ebx, msg2
	call print

	mov ebx, array
	call selection_sort

	call printArray
	call exit

printArray:
		push ebx
		push ecx
		push edx
		push esi 
		
		mov edx, 0
		mov esi, ebx ;Guardo el array

		;Imprimo corchete
		mov ebx, opb
		call print
		mov ebx, spc
		call print


		.print:
		mov ebx, esi
		call printNext
		mov ebx, spc
		call print
		inc edx
		loop .print

		mov ebx, clb
		call print
		mov ebx, esi

		pop esi
		pop edx
		pop ecx
		pop ebx
ret


printNext:
	push eax
	push ebx

	mov eax, [esi + 4*edx]

	mov ebx, aux
	call numtos
	call print

	pop ebx
	pop eax
	ret


section .data
	msg1 db "Antes de ordenar: ", 0
	msg2 db "Despues de ordenar: ", 0
	opb db "[", 0
	clb db "]", 10, 0
	spc db " ", 0
	newline db 10, 0
	
	array dd 41,19,28,19,7,8,9,71,192,6,5,4,3,18,1
	size_bt equ $ - array


section .bss
	aux resb 32	

