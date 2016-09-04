global getcpuID

section .text

getcpuID:
	push ebp
	mov ebp, esp
	push ebx
	push edx
	push ecx

	xor eax, eax
	cpuid		;CPUID va a guardar el ID en un string de 12 bytes formado por EBX|EDX|ECX
	mov [string], ebx
	mov [string + 4], edx
	mov [string + 8], ecx
	mov [string + 12], byte 0
	mov eax, string

	pop ecx
	pop edx
	pop ebx
	leave
	ret

section .bss
string resb 13