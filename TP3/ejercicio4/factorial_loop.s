	.file	"factorial.c"
	.intel_syntax noprefix
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	cmp	DWORD PTR [ebp+8], 0 ;Si el argumento es cero
	jne	.L2					;Si no es cero salto a L2
	mov	eax, 1 				;Retorno 1
	jmp	.L3
.L2:
	mov	eax, DWORD PTR [ebp+8]	;En EAX esta el argumento
	sub	eax, 1					;N-1
	sub	esp, 12					;Variables locales
	push	eax 				;Argumento (n-1) para la llamada recursiva
	call	factorial
	add	esp, 16					;Libero memoria
	mov	DWORD PTR [ebp-12], eax	;En ebp - 12 queda factorial_n_1. 
	mov	eax, DWORD PTR [ebp+8]	;En eax queda n (argumento)
	imul	eax, DWORD PTR [ebp-12] ;En eax queda factorial_n_1 * n = factorial(n), el retorno
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	factorial, .-factorial
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
