#include <stdio.h>

unsigned int pid();

int main(int argc, char* argv[]){
	int mpid = pid();
	printf("PID: %d\n", mpid);
	return 0;
}