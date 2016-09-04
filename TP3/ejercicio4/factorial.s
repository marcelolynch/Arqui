;NOTA: se ve que GCC transforma en un loop la llamada recursiva
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
	cmp	DWORD PTR [ebp+8], 0
	jne	.L2
	mov	eax, 1
	jmp	.L3
.L2:
	mov	eax, DWORD PTR [ebp+8]	
	sub	eax, 1
	sub	esp, 12
	push	eax
	call	factorial
	add	esp, 16
	mov	DWORD PTR [ebp-12], eax	;En ebp - 12 esta factorial_n_1. 
	mov	eax, DWORD PTR [ebp+8]	
	imul	eax, DWORD PTR [ebp-12] ;En eax queda factorial(n)
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
