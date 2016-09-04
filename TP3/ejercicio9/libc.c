#define STDIN 0
#define STDOUT 1 

int sys_write(int fd, void *buffer, int size); 
int strlen(const char *str);
int sys_getchar(int fd);

int puts(const char* str) { 
     int len = strlen(str); 
     return sys_write(STDOUT, (void *) str, len); 
}


int getchar(){
	return sys_getchar(STDIN);
}