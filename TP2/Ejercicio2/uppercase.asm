GLOBAL uppercase
section .text

EXTERN strlen
;---------------------------------------------------
; uppercase - pasa a mayusculas
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;-----------------------------------------------------------
uppercase:
	pushad
	pushfd
	call strlen

	.loop:
		test eax
		je .fin ;si es cero termino
		cmp [ebx], 97 ;comparo con 'a'
		jl next 	;si es menor que 'a', no es letra minuscula
		cmp [ebx], 122 ;comparo con 'z'
		jg .next	;si es mayor que 'z' no es letra mayuscula
		;Si estoy aca, se que es una letra
		sub [ebx], 20 ;lo paso a mayusculas segun ascii
	.next:
		inc ebx
		jmp .loop

	.fin:
	popfd
	popad
	ret
	
