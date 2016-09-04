; libasm.asm 
GLOBAL sys_write 
GLOBAL strlen
GLOBAL sys_getchar
GLOBAL sys_fopen
GLOBAL sys_fclose
 
ALIGN 4 
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
;	eax: proximo caracter si existe, -1 si es EOF
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