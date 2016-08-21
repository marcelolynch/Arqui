GLOBAL selection_sort

; Se implementa un selection sort sobre el array
; Dejando el mas grande al final e iterativamente
; Ordenando arrays con tamaño menor

;Se asume que la direccion del array esta en EBX
;Su tamaño en ECX
;No se alteran los registros despues de la llamada

selection_sort:
	pushf
	.go:
		call findMaxIndex
		call swap
	loop .go

	popf
	ret


;Recibe:
;EBX: Direccion del array
;ECX: Indice 1
;EAX: Indice 2
swap:
	push edi
	push esi

	mov edi, [ebx + 4*ecx]
	mov esi, [ebx + 4*eax]
	mov [ebx + 4*ecx], esi
	mov [ebx + 4*eax], edi

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

	mov eax, 0
	mov esi, [ebx]

	test ecx, ecx
	jz .fin

	.findmax:
		dec ecx
		cmp esi, [ebx + 4*ecx]
		jge .next

		mov esi, [ebx + 4*ecx]
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

