; libasm.asm 
GLOBAL sys_write 
GLOBAL strlen
GLOBAL sys_getchar
GLOBAL sys_fopen
GLOBAL sys_fclose
GLOBAL numtos

ALIGN 4 

;----------------------------------------------------------
; numtos - guarda en la zona de memoria pasada como parametro
;			el string que corresponde al numero pasado
;-----------------------------------------------------------
; Argumentos:
;	int num - numero a imprimir en pantalla
;	char * buf - zona de memoria
;-----------------------------------------------------------

;TODO: En vez de usar un buffer con tamaño fijo para revertir
;se podria usar la pila para pushear los ascii y despues guardarlos
;en la zona de memoria (mas eficiente)
numtos:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	push ecx

	mov eax, [ebp + 8] ;el numero
	mov esi, [ebp + 12] ;en esi queda la zona de memoria para guardar el string
	mov ebx, 0 ;conteo en 0

	mov ecx, 10

	.loop:
	mov edx, 0 ;Parte alta de la division en cero
	div ecx ; divido eax por 10, el resto queda en edx
	add edx, 48 ;lo transformo en ascii
	push edx	;lo tiro al stack
	inc ebx	; cuento las letras

	cmp eax, 0
	jnz .loop
	

	;En el stack me quedo el string con el numero pero invertido
	;Tengo que guardarlo al derecho en la direccion que me pasaron
	;que ahora esta guardada en ESI

	.reverseloop: 
	pop ecx
	mov [esi], cl
	inc esi 		;me corro en la memoria para guardar el siguiente caracter
	dec ebx ;En EBX esta la cantidad de caracteres (loopeo hasta que se acaben)
	cmp ebx, 0		;Llegue al principio del string (segun cantidad de letras) 
	jz .fin
	jmp .reverseloop

	.fin:
	mov BYTE [esi], 0 ;El string termina en 0

	pop ecx
	pop ebx
	pop esi
	leave
	ret



;-----------------------------------------------------------
; sys_write - Escribe al file descriptor
;-----------------------------------------------------------
; Argumentos:
;	unsigned int fd - file descriptor
;	char * buffer - buffer donde se encuentra la salida
;	unsinged int length - cantidad de bytes a escribir
;-----------------------------------------------------------
sys_write: 
push ebp 
mov ebp, esp 
 
push ebx ;preservar ebx 
 
mov eax, 0x4 
mov ebx, [ebp+8]   ; fd 
mov ecx, [ebp+12]  ; buffer 
mov edx, [ebp+16] ; length 
int 0x80 
 
pop ebx 
 
mov esp, ebp 
pop ebp 
ret

;-----------------------------------------------------------
; sys_getchar - Devuelve el proximo caracter del file descriptor
;-----------------------------------------------------------
; Argumentos:
;	unsigned int fd - file descriptor
; Retorno:
;	eax: proximo caracter si existe, -1 si es el EOF
;-----------------------------------------------------------
sys_getchar:
	push ebp
	mov ebp, esp

	mov eax, 0x3 ;system call read
	mov edx, 1 ;Quiero 1 byte
	mov ebx, [ebp + 8] ;file descriptor
	mov ecx, charbuf

	int 80h
	
	test eax, eax
	jnz .next	
		mov eax, -1 ;Return -1
		jmp .fin

	.next:
	xor eax, eax
	mov al, byte [charbuf]
	
	.fin:
	leave
	ret


;-----------------------------------------------------------
; sys_fopen - abre un archivo y devuelve el file descriptor 
;-----------------------------------------------------------
; Argumentos:
;	primer argumento - nombre del archivo
;	segundo argumento - permisos (0 = read, 1 = write, 2 = rw)
; Retorno:
;	eax: largo de la cadena
;-----------------------------------------------------------
sys_fopen:
	push ebp
	mov ebp, esp
	push ecx
	push ebx

	mov ebx, [ebp + 8] ;Nombre
	mov ecx, [ebp + 12] ;Modo de acceso
	
	mov eax, 5 ;sys call open()
	int 80h

	pop ebx
	pop ecx
	leave
	ret

;-----------------------------------------------------------
; sys_fclose - Cierra el stream dado por el file descriptor
;-----------------------------------------------------------
; Argumentos:
;	unsigned int fd - file descriptor
; Retorno:
;	eax: proximo caracter si existe, -1 si es el EOF
;-----------------------------------------------------------
sys_fclose:
	push ebp
	mov ebp, esp
	push ebx

	mov ebx, [ebp + 8]
	mov eax, 6 ;syscall close
	int 80h

	pop ebx
	leave 
	ret

;-----------------------------------------------------------
; strlen - calcula la longitud de una cadena terminada con 0
;-----------------------------------------------------------
; Argumentos:
;	puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;-----------------------------------------------------------
strlen:
	push ebp
	mov ebp, esp

	push ecx ; preservo ecx	
	push ebx ; preservo ebx
	pushf	; preservo los flags

	mov ebx, [ebp + 8] ;String
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

	leave
	ret

section .bss
	charbuf resb 4