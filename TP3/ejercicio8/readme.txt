Para compilar sin usar el loader de gcc:

$ gcc -m32 -fno-builtin -c *.c
$ nasm -f elf32 libasm.asm
$ nasm -f elf32 c_loader.asm
$ ld -melf_i386 *.o -o loaded