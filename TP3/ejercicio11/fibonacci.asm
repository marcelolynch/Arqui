global _start
section .text
_start:
	push 5
	call fibonacci
	mov ebx, eax
	mov eax, 1
	int 80h


fibonacci:
	push ebp
	mov ebp, esp
	and esp, -16;
	sub esp, 8
	
	cmp dword [ebp + 8], 0
	jz .zero
	
	cmp dword [ebp + 8], 1
	jnz .body
	jmp .uno

	.zero:
		mov eax, 0
		jmp .fin

	.uno: 
		mov eax, 1
		jmp .fin

	.body:
	mov eax, [ebp + 8]
	sub eax, 1
	push eax
	call fibonacci

	mov [ebp - 4], eax

	mov eax, [ebp + 8]
	sub eax, 2
	push eax
	call fibonacci
	mov [ebp - 8], eax

	mov eax, [ebp - 8]
	add eax, [ebp - 4]

	.fin:
	leave
	ret