#define MAXBUF 200
#define EOF -1
#include "lib.h"
#include <stdlib.h>

int puts(const char * str);
void printStdioLine();


int main(){
	int count;
	char * name;
	char * line;
	File f;

	puts("Ingrese el nombre de archivo que desea imprimir: >");
	
	name = get_line(MAXBUF);
	f = my_fopen(name, R);
	if(f == NULL){
		puts("Error abriendo el archivo. Abortando\n");
		return 0;
	}

	count = 0;
	puts("\nImprimiendo linea por linea ");
	puts(name);
	puts("\n");

	
	while((line = read_line(f, MAXBUF)) != NULL){
		puts(to_string(++count));
		if(count < 10) puts(" "); //Formato lindo
		puts(" | ");
		puts(line);
	 	puts("\n");
	}


	my_fclose(f);
	return 0;
}


void printStdioLine(){	
	int c=0;
	int i;

	char buffer[MAXBUF] = {0};
	
	while(c != MY_EOF){
	while((c=my_getchar()) != '\n' && c != MY_EOF && i < MAXBUF){
		buffer[i] = (char)c;
		i++;
		}
	if(i < MAXBUF){
			buffer[i] = 0;
			puts(buffer);
			puts("\n");
			i = 0;
	}
	}

}