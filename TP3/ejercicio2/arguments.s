	.file	"arguments.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"Cantidad de argumentos:%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	lea	ecx, [esp+4] ;Direccion de primera variable
	and	esp, -16	;Alineamiento a palabra
	push	DWORD PTR [ecx-4] 

	push	ebp
	mov	ebp, esp	;Stackframe

	push	ecx
	sub	esp, 4
	mov	eax, ecx
	sub	esp, 8
	push	DWORD PTR [eax]
	push	OFFSET FLAT:.LC0
	call	printf
	add	esp, 16
	mov	eax, 0
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
