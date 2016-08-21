GLOBAL selection_sort
extern print
extern numtos

; Se implementa un selection sort sobre el array
; Dejando el mas grande al final e iterativamente
; Ordenando arrays con tamaño menor

;Se asume que la direccion del array esta en EBX
;Su tamaño en ECX
;No se alteran los registros despues de la llamada

selection_sort:
	pushf
	pushad

	.go:
		call findMaxIndex
		call swap_with_last
	loop .go

	popad
	popf
	ret


;Recibe:
;EBX: Direccion del array
;ECX: Tamaño del array
;EAX: Indice a swappear con el ultimo
swap_with_last:
	push edi
	push esi
	dec ecx ;En ECX llega el tamaño, ECX - 1 es el ultimo indice
	mov edi, [ebx + 4*ecx]
	mov esi, [ebx + 4*eax]
	mov [ebx + 4*ecx], esi
	mov [ebx + 4*eax], edi

	inc ecx ;Recupero los registros
	pop esi
	pop edi
	ret


;Recibe
;EBX: array
;ECX: tamaño
;Deja en EAX el indice al mayor
findMaxIndex:
	push ebx
	push ecx
	push edx
	push esi

	test ecx, ecx
	jz .fin 		;Si hay cero elementos ni entro

	mov eax, 0
	mov esi, [ebx]

	.findmax:
		dec ecx
		cmp esi, [ebx + 4*ecx]
		jge .next

		mov esi, [ebx + 4*ecx] ;Encontre un elemento mayor
		mov eax, ecx
	
		.next:
		test ecx, ecx
		jnz .findmax
	
	.fin:

	pop esi
	pop edx
	pop ecx
	pop ebx

	ret

	section .bss
		ary resb 30

