global _start
extern main

section .text
_start:
	;
	;El stack se organiza asi al inicio de la llamada:
	;
	;----------------------------
	; ESP          |   Cantidad de args
	;----------------------------
	; ESP + 4      |   Path
	;----------------------------
	; ESP + 8 	   |   Arg 2
	;----------------------------
	; ESP + 12     |   Arg 3 
	;----------------------------
	;   ...
	;----------------------------
	; ESP + 4(n+1) |   Arg n
	;----------------------------
	; NULL (4 bytes)
	;----------------------------


	;
	;Tengo que dejarselo a main así:
	;----------------------------
	; RET _start              |   
	;----------------------------
	; cantidad de argumentos  |  
	;----------------------------
	; char * argv[] 	      |   Puntero a los strings
	;----------------------------

	mov eax, [esp]	;Cantidad de argumentos
	lea ebx, [esp + 4] ;Puntero a donde arrancan los strings

	push ebx
	push eax
	call main

	mov ebx, eax	;Valor de retorno que me devolvio main
	mov eax, 1		;id de syscall exit
	int 80h			;syscall


