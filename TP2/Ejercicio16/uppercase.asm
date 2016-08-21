GLOBAL uppercase
section .text

;---------------------------------------------------
; uppercase - pasa a mayusculas
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;-----------------------------------------------------------
uppercase:
	pushad
	pushfd

	.loop:
		mov eax, [ebx]
		test eax, eax
		je .fin ;si es cero termino
		cmp byte [ebx], 'a' ;comparo con 'a'
		jl .next 	;si es menor que 'a', no es letra minuscula
		cmp byte [ebx], 'z' ;comparo con 'z'
		jg .next	;si es mayor que 'z' no es letra mayuscula
		;Si estoy aca, se que es una letra
		add byte [ebx], 'A' - 'a' ;lo paso a mayusculas segun ascii
	.next:
		inc ebx
		jmp .loop

	.fin:
	popfd
	popad
	ret
	
