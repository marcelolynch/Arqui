section .text
GLOBAL _start

EXTERN print
EXTERN exit

_start:
	mov ebx, string
	call print
	call uppercase
	call print

	mov ebx, 0 ;Valor de retorno
	call exit

;-----------------------------------------------------------
; uppercase - pasa las minusculas a mayusculas
;-----------------------------------------------------------
; Argumentos:
;	ebx: string terminado en 0. 
; ----------------------------------------------------------
;	Los registros quedan intactos con la llamada
;-----------------------------------------------------------
uppercase:
		push ebx
		push eax
	.loop:
		mov al, [ebx]
		test al, al ;AND bitwise
		jz .fin ;si es cero termino

		cmp al, 97 ;comparo con 'a'
		jl .next 	;si es menor que 'a', no es letra minuscula
		cmp al, 122 ;comparo con 'z'
		jg .next	;si es mayor que 'z' no es letra mayuscula
		;Si estoy aca, se que es una letra
		sub al, 32;lo paso a mayusculas segun ascii
		mov [ebx], al
	.next:
		inc ebx
		jmp .loop

	.fin:
		pop eax
		pop ebx
		ret

section .data
string db "h4ppy c0d1ng", 10, 0

