GLOBAL _start
EXTERN exit
EXTERN numtos
EXTERN print

section .text
_start:

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
	; Punteros a variables de entorno
	;-----------------------------
	; ...
	;-----------------------------
	; NULL (4 bytes)
	;---------------------------
	;
	; Este programa recorre el stack de a 4 bytes, acumulando la cantidad de bytes
	; recorridos en EAX e imprimiendo los contenidos del stack por salida estandar
	; Primero se imprime la cantidad de argumentos, luego los argumentos y finalmente 
	; las variables de entorno.
	; El ciclo interno arranca con ESI en ESP + 8 (Path) 
	; y corta cuando encuentra un NULL (no arranca en ESP para no )
	; El externo luego de dos iteraciones (ECX empieza en 2)
	; Es decir, llegamos hasta el final de las variables de entorno (segundo NULL)
	; Mientras se van imprimiendo, y en EAX se acumulan los bytes recorridos



	mov esi, esp
	mov eax, 0

	;Imprimo la cantidad de argumentos
	


	
	;ARGUMENTOS DEL PROGRAMA (se imprime el path y cualquier otro argumento)	
	;Muestro el mensaje:
	mov ebx, msg0
	call print_nice_message

	mov ebx, msg_args
	call print

	mov ebx, aux
	mov eax, [esi] ;Cantidad de argumentos
	call numtos
	call print

	mov ebx, newline
	call print
	call print

	add esi, 4		;Me muevo en ESP + 4 para imprimir todo el resto: en ESP no hay un puntero sino un numero
	mov eax, 4 		;Ya recorri 4 bytes en el stack


	call print_til_null ;Imprimo los contenidos del stack hasta encontrar un null


	;VARIABLES DE ENTORNO
	;Imprimo mensaje
	mov ebx, msg1
	call print_nice_message
		

	call print_til_null	;Imprimo los contenidos del stack hasta encontrar un null


	;Imprimo mensaje final (cantidad de bytes)
	mov ebx, msg2
	call print_final_message

	call exit


print_nice_message:
	push edx
	push ebx

	mov edx, ebx	;Guardo aca

	mov ebx, newline
	call print


	mov ebx, sep
	call print

	mov ebx, edx
	call print
	
	mov ebx, sep
	call print

	pop ebx
	pop edx
	ret


;Se distingue del anterior porque hay que imprimir el numerito :(
print_final_message:
	push edx
	push ebx

	mov edx, ebx	;Guardo aca el string

	mov ebx, newline
	call print


	mov ebx, sep
	call print

	mov ebx, edx
	call print
	
	mov ebx, aux
	call numtos
	call print

	mov ebx, sep
	call print


	pop ebx
	pop edx
	ret


print_til_null:
	.loop:
			mov ebx, [esi]
			call print_it	;Se imprime
			
			add esi, 4		;Avanzo en el stack
			add eax, 4		;En EAX acumulo cuantos bytes recorro

		test ebx, ebx
	jnz .loop	;Hasta que en ebx haya un null
ret



print_it:
	push ebx
	test ebx, ebx
	jz .fin
		call print
		mov ebx, newline
		call print
		call print
	.fin:
	pop ebx
	ret

section .rodata
	newline db 10, 0
	sep db 10, "    ======================================", 10, 0
	msg0 db "            PATH y ARGUMENTOS", 0
	msg1 db "         VARIABLES DE ENTORNO", 0
	msg2 db "     CANTIDAD DE BYTES EN EL STACK: ",0
	msg_args db "        CANTIDAD DE ARGUMENTOS: ",0

section .bss
	aux resb 10