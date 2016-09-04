#define STDOUT 1 
 
int sys_write(int fd, void *buffer, int size); 
int strlen(const char *str);
 
int puts(const char* str) { 
     int len = strlen(str); 
     return sys_write(STDOUT, (void *) str, len); 
 }