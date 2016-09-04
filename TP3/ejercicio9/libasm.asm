; libasm.asm 
GLOBAL sys_write 
GLOBAL strlen
GLOBAL sys_getchar
 
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


sys_getchar:
	push ebp
	mov ebp, esp

	mov eax, 0x3
	mov edx, 1 ;Quiero 1 byte
	mov ebx, [ebp + 8] ;file descriptor
	mov ecx, buffer
	
	int 80h

	xor eax, eax
	mov al, byte [buffer]
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
	buffer resb 100