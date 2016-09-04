	.file	"arreglos4.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB0:
	push	ebp
	mov	ebp, esp
	push	edi
	sub	esp, 100

	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	lea	edx, [ebp-92]
	mov	eax, 0
	mov	ecx, 20
	mov	edi, edx
	rep stosd	;Llenanding con ceros
	
	mov	DWORD PTR [ebp-92], 2
	mov	DWORD PTR [ebp-88], 1
	mov	DWORD PTR [ebp-84], 2
	mov	DWORD PTR [ebp-52], 10
	nop
	mov	eax, DWORD PTR [ebp-12]
	xor	eax, DWORD PTR gs:20
	je	.L2
	call	__stack_chk_fail
.L2:
	add	esp, 100
	pop	edi
	pop	ebp
	ret
.LFE0:
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
