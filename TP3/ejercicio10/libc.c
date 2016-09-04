#include "lib.h"
#include <stdlib.h>
#define CHARSIZE 1
#define BLOCK

int sys_fopen(char * name, int mode);
int sys_fclose(int fd);
static char * _getline(int fd, unsigned int max_size);
void numtos(unsigned int number, char * buffer);

struct FileCDT{
	int fd;
	char * filename;
};

int sys_write(int fd, void *buffer, int size); 
int strlen(const char *str);
int sys_getchar(int fd); 

static int count_digits(unsigned int number){
	int i = 1;
	while(number > 0){
		number /= 10;
		i++;
	}
	return i;
}


char * to_string(unsigned int number){
	int digits = count_digits(number);
	char * str = malloc(digits + 1);
	numtos(number, str);
	return str;
}


/**
* Abre un archivo y devuelve el puntero a la estructura correspondiente
*/
File my_fopen(char * name, int mode){
	File file;
	int filedesc = sys_fopen(name, mode);

	if(filedesc < -1 || 
		(( file = malloc(sizeof(*file)) ) == NULL))
		return NULL;

	file->fd = filedesc;
	file->filename = name;
	return file;
}

/*
* Cierra el archivo y libera la memoria
*/
void my_fclose(File file){
	sys_fclose(file->fd);
	free(file);
}


/*
* Consume una linea del archivo especificado y la devuelve
(lo que devuelve esta acotado por max_size)
*/
char * read_line(File file, unsigned int max_size){
	if(file == NULL)
		return NULL;

	char * line = _getline(file->fd, max_size);
	return line;
}



/** Imprime un string (null terminated) en pantalla */
int puts(const char* str) { 
     int len = strlen(str); 
     return sys_write(STDOUT, (void *) str, len); 
}

/** Consume el siguiente caracter de la entrada estandar y lo devuelve, o MY_EOF si no*/
int my_getchar(){
	return sys_getchar(STDIN);
}


/* Consume una linea de la entrada estandar y la devuelve 
(lo que devuelve esta acotado por max_size)*/
char * get_line(unsigned int max_size){
	return _getline(STDIN, max_size);
}


/* Consume una linea del archivo dado por el file descriptor fd y la devuelve 
(lo que devuelve esta acotado por max_size)*/
static char * _getline(int fd, unsigned int max_size){
	char * str = calloc(max_size + 1, CHARSIZE);
	
	int i = 0;
	int c;

	if((c = sys_getchar(fd)) == MY_EOF)
		return NULL;
	else if(c != '\n'){ 
		str[i++] = (char)c;
	
		while((c = sys_getchar(fd)) != MY_EOF && c != '\n'){
			if(i < max_size){
				str[i++] = (char)c;
			}
		}
	}
	return str;

}

