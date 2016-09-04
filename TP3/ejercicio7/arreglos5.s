	.file	"arreglos5.c"
	.intel_syntax noprefix
	.comm	arr_glob,12,4
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB0:
	push	ebp

	mov	ebp, esp

	nop
	pop	ebp
	ret
.LFE0:
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
