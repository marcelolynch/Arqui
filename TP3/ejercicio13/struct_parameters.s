	.file	"struct_parameters.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	push	ebp
	mov	ebp, esp
	mov	DWORD PTR [ebp+12], 0
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [ebp+12]
	mov	DWORD PTR [eax], edx
	mov	edx, DWORD PTR [ebp+16]
	mov	DWORD PTR [eax+4], edx
	mov	edx, DWORD PTR [ebp+20]
	mov	DWORD PTR [eax+8], edx
	mov	edx, DWORD PTR [ebp+24]
	mov	DWORD PTR [eax+12], edx
	mov	edx, DWORD PTR [ebp+28]
	mov	DWORD PTR [eax+16], edx
	mov	edx, DWORD PTR [ebp+32]
	mov	DWORD PTR [eax+20], edx
	mov	edx, DWORD PTR [ebp+36]
	mov	DWORD PTR [eax+24], edx
	mov	edx, DWORD PTR [ebp+40]
	mov	DWORD PTR [eax+28], edx
	mov	edx, DWORD PTR [ebp+44]
	mov	DWORD PTR [eax+32], edx
	mov	edx, DWORD PTR [ebp+48]
	mov	DWORD PTR [eax+36], edx
	mov	edx, DWORD PTR [ebp+52]
	mov	DWORD PTR [eax+40], edx
	mov	edx, DWORD PTR [ebp+56]
	mov	DWORD PTR [eax+44], edx
	mov	eax, DWORD PTR [ebp+8]
	pop	ebp
	ret	4
	.size	function, .-function
	.globl	main
	.type	main, @function
main:
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 68
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	mov	DWORD PTR [ebp-60], 1
	mov	DWORD PTR [ebp-56], 2
	mov	BYTE PTR [ebp-52], 3
	mov	DWORD PTR [ebp-48], 5
	mov	DWORD PTR [ebp-44], 6
	mov	DWORD PTR [ebp-40], 7
	fld	QWORD PTR .LC0
	fstp	QWORD PTR [ebp-36]
	fld	QWORD PTR .LC1
	fstp	QWORD PTR [ebp-28]
	fld	QWORD PTR .LC2
	fstp	QWORD PTR [ebp-20]
	lea	eax, [ebp-60]
	push	DWORD PTR [ebp-16]
	push	DWORD PTR [ebp-20]
	push	DWORD PTR [ebp-24]
	push	DWORD PTR [ebp-28]
	push	DWORD PTR [ebp-32]
	push	DWORD PTR [ebp-36]
	push	DWORD PTR [ebp-40]
	push	DWORD PTR [ebp-44]
	push	DWORD PTR [ebp-48]
	push	DWORD PTR [ebp-52]
	push	DWORD PTR [ebp-56]
	push	DWORD PTR [ebp-60]
	push	eax
	call	function
	add	esp, 48
	mov	eax, DWORD PTR [ebp-60]
	test	eax, eax
	jne	.L4
	mov	eax, 0
	jmp	.L6
.L4:
	mov	eax, 1
.L6:
	mov	edx, DWORD PTR [ebp-12]
	xor	edx, DWORD PTR gs:20
	je	.L7
	call	__stack_chk_fail
.L7:
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1075838976
	.align 8
.LC1:
	.long	0
	.long	1075970048
	.align 8
.LC2:
	.long	0
	.long	1076101120
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
