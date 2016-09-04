	.file	"arreglos1.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB0:
	push	ebp
	mov	ebp, esp

	sub	esp, 56
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	nop
	mov	eax, DWORD PTR [ebp-12]
	xor	eax, DWORD PTR gs:20
	je	.L2
	call	__stack_chk_fail
.L2:
	leave
	ret

.LFE0:
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
