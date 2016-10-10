GLOBAL getMin
GLOBAL getHour
GLOBAL getSec

section .text
getHour:
	push rbp		;No hace falta el stackframe, lo hago igual?
	mov rbp, rsp
	xor rax, rax

	call setClock
	mov rdi, 4
	call getRTC

	leave
	ret

getMin:
	push rbp		;No hace falta el stackframe, lo hago igual?
	mov rbp, rsp
	xor rax, rax
	
	call setClock

	mov rdi, 2
	call getRTC

	leave
	ret

getSec:
	push rbp		;No hace falta el stackframe, lo hago igual?
	mov rbp, rsp
	xor rax, rax

	call setClock

	mov rdi, 0
	call getRTC
	
	leave
	ret

getRTC:
	mov rax, rdi
	out 70h, al ;Minutos
	in al, 71h
	ret




setClock:	
	mov al, 0bh
	out 70h, al

	in al, 71h
	or al, 4
	out 71h, al
	

	ret