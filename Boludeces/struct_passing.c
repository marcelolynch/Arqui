#include <stdio.h>
typedef struct {
	int x;
	int y;
	char * name;
	int size;
} strct;


int process(strct stru){
	stru.x = 10;
	int a = 10;
	stru.size = a;
	return 0;
}

strct ret_stru(){
	strct s;
	s.name = "Hola";
	return s;
}

int main(){
	strct s;
	s = ret_stru();
	return 0;
}

