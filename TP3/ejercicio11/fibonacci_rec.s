	.file	"fibonacci_rec.c"
	.intel_syntax noprefix
	.text
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
.LFB0:
	push	ebp
.LCFI0:
	mov	ebp, esp
.LCFI1:
	sub	esp, 24
	cmp	DWORD PTR [ebp+8], 0
	jne	.L2
	mov	eax, 0
	jmp	.L3
.L2:
	cmp	DWORD PTR [ebp+8], 1
	jne	.L4
	mov	eax, 1
	jmp	.L3
.L4:
	mov	eax, DWORD PTR [ebp+8]
	sub	eax, 1
	sub	esp, 12
	push	eax
	call	fibonacci
	add	esp, 16
	mov	DWORD PTR [ebp-12], eax
	mov	eax, DWORD PTR [ebp+8]
	sub	eax, 2
	sub	esp, 12
	push	eax
	call	fibonacci
	add	esp, 16
	mov	DWORD PTR [ebp-16], eax
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [ebp-16]
	add	eax, edx
.L3:
	leave
.LCFI2:
	ret
.LFE0:
	.size	fibonacci, .-fibonacci
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0
	.byte	0x3
	.string	""
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0x8
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.align 4
.LECIE1:
.LSFDE1:
	.long	.LEFDE1-.LASFDE1
.LASFDE1:
	.long	.LASFDE1-.Lframe1
	.long	.LFB0
	.long	.LFE0-.LFB0
	.byte	0x4
	.long	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xc5
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.align 4
.LEFDE1:
	.ident	"GCC: (GNU) 6.1.1 20160802"
	.section	.note.GNU-stack,"",@progbits
