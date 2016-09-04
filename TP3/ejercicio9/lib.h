#ifndef __libh
#define __libh

#define MY_EOF -1
#define STDIN 0
#define STDOUT 1 

#define R 0 //Read
#define W 1 //Write
#define RW 2 // Read-write
typedef struct FileCDT * File;

int my_getchar();


File my_fopen(char * name, int mode);
void my_fclose(File file);

char * read_line(File file, unsigned int max_size);
char * get_line(unsigned int max_size);



#endif