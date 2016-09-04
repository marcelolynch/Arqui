	.file	"arreglos6.c"
	.intel_syntax noprefix
	.globl	arr_glob2
	.data
	.align 32
	.type	arr_glob2, @object
	.size	arr_glob2, 40
arr_glob2:
	.long	30
	.long	0
	.long	3
	.zero	28
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
	nop
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
