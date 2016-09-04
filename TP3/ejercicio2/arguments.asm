GLOBAL main 
 
ALIGN 4 
 
main: 
        push ebp 
        mov ebp, esp 
 
 
        ; declaración de variables  
 
 
        and esp, ­16 
   
        ;  ...  programa 
 
        mov esp, ebp 
        pop ebp 
        ret 