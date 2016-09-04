;main.asm 
GLOBAL main 
EXTERN printf 
 
section .rodata 
fmt db "Cantidad de argumentos: %d",10, 0
sfmt db "%s",10, 0
 
section .text 
main: 
        push ebp      ; Armado de stack frame 
        mov ebp, esp  ; 
 
        push dword [ebp+8] 
        push fmt 
        call printf 
        add esp, 2*4 
        
        mov edi, [ebp+8] ;Cantidad de argumentos para loop
        mov ebx, [ebp + 12] ;El arreglo a los argumentos
        xor esi, esi ;Va a ser el indice del arreglo
        
        .printloop:
            push dword [ebx + 4*esi]
            push sfmt
            call printf
            add esp, 2*4

            inc esi
            dec edi
        jnz .printloop


        mov eax, 0 
 
 
        mov esp, ebp  ; Desarmado de stack frame 
        pop ebp 
        ret