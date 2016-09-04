	.file	"arreglos3.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	sub	esp, 132
	.cfi_offset 7, -12
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	lea	edx, [ebp-132]

	mov	eax, 0		; Con todo esto
	mov	ecx, 30		; esta llenando
	mov	edi, edx	; con ceros
	rep stosd		; todo el arreglo (ver stosd)

	mov	DWORD PTR [ebp-132], 1	;Inicializa
	mov	DWORD PTR [ebp-128], 3
	mov	DWORD PTR [ebp-124], 1
	mov	DWORD PTR [ebp-92], 99	;Guarda el 31
	nop
	mov	eax, DWORD PTR [ebp-12]
	xor	eax, DWORD PTR gs:20
	je	.L2
	call	__stack_chk_fail
.L2:
	add	esp, 132
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
