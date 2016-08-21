
GLOBAL print
GLOBAL exit
GLOBAL numtos

section .text

;EJERCICIO 3
;Agregar a la biblioteca una función que recibe un número y una zona de memoria,
;y transforme el número en un string, terminado con cero, en la zona de memoria
;pasada como parámetro.


;----------------------------------------------------------
; numtos - guarda en la zona de memoria pasada como parametro
;			el string que corresponde al numero pasado
;-----------------------------------------------------------
; Argumentos:
;	eax: numero a imprimir en pantalla
;	ebx: zona de memoria
;-----------------------------------------------------------

;TODO: En vez de usar un buffer con tamaño fijo para revertir
;se podria usar la pila para pushear los ascii y despues guardarlos
;en la zona de memoria (mas eficiente)
numtos:

	pushad
	pushfd

	mov esi, ebx ;en esi queda la zona de memoria para guardar el string
	mov ebx, 0 ;conteo en 0
	
	mov ecx, 10	

	.loop:
	mov edx, 0 ;Parte alta de la division en cero
	div ecx ; divido eax por 10, el resto queda en edx
	add edx, 48 ;lo transformo en ascii
	mov [buffer + ebx], dl
	inc ebx	; cuento las letras

	cmp eax, 0
	jnz .loop
	

	;En [buffer] me quedo el string con el numero pero invertido
	;Tengo que guardarlo al derecho en la direccion que me pasaron
	;que ahora esta guardada en ESI

	.reverseloop: 
	dec ebx ;En EBX esta la cantidad de caracteres (loopeo hasta que se acaben)
	mov cl, [buffer + ebx]
	mov [esi], cl
	inc esi 		;me corro en la memoria para guardar el siguiente caracter
	cmp ebx, 0		;Llegue al principio del string (segun cantidad de letras) 
	jz .fin
	jmp .reverseloop

	.fin:
	mov BYTE [esi], 0 ;El string termina en 0
	popfd
	popad
	ret



;-----------------------------------------------------------
; print - imprimer una cadena en la salida estandar
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;-----------------------------------------------------------
print:
	pushad		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
	ret	
	
;-----------------------------------------------------------
; exit - termina el programa
;-----------------------------------------------------------
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;-----------------------------------------------------------
exit:
	mov eax, 1		; ID del Syscall EXIT
	int 80h			; Ejecucion de la llamada


;-----------------------------------------------------------
; exit - calcula la longitud de una cadena terminada con 0
;-----------------------------------------------------------
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;-----------------------------------------------------------
strlen:
	push ecx ; preservo ecx	
	push ebx ; preservo ebx
	pushf	; preservo los flags

	mov ecx, 0	; inicializo el contador en 0
.loop:			; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	inc ecx		; Incremento el contador
	inc ebx
	jmp .loop
.fin:				; etiqueta local a strlen
	mov eax, ecx	
	
	popf
	pop ebx ; restauro ebx	
	pop ecx ; restauro ecx
	ret
	
section .bss
	buffer resb 128

