#include <stdio.h>

int main(int argc, char* argv[]){
	printf("Cantidad de argumentos:%d\n", argc);
	return 0;
}

/* Compilar como
	gcc -­c arguments.c ­-m32 ­-fno­-dwarf2­-cfi­-asm ­-fno-­exceptions ­S 
­fno­-asynchronous­-unwind-­tables ­-masm=intel
*/