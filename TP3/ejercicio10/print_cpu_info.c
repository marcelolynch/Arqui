#include "lib.h"
char * getcpuID();

int main(void){
	puts("CPU ID: ");
	puts(getcpuID());
	puts("\n");
	return 0;
}