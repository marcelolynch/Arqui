GLOBAL _start

section .text
_start:
	mov ebx, 1
	mov ecx, string
	mov edx, len
	mov eax, 4
	int 80h
	mov ebx, 10
	mov eax, 1
	int 80h

section .rodata
string db "Hola mundo",10
len eq u$ - string