;main.asm 
GLOBAL main 
EXTERN puts, sprintf 
 
section .rodata 
fmt db "%d", 0 
number dd 12345679 
 
section .text 
main: 
      push dword [number] 
      push fmt 
      push buffer 
 
      call sprintf 
 
      add esp, 3*4 ;Liberando el espacio de las variables pusheadas (3 var x 4 bytes)
 
      push buffer 
      call puts  
      add esp, 4 	;Liberando el espacio de las variables pushadas
      ret 	;El valor de retorno es el de puts
 
section .bss 
buffer resb 40