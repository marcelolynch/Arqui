global main
extern hello_world
extern exit

section .text

main:
	call hello_world
	push 0
	call exit