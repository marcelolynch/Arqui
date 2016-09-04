int getchar();
int puts(const char * str);

int main(){
	int c;
	int i;

	char buffer[1000] = {0};
	
	while((c=getchar()) != '\n' && i < 1000){
		buffer[i] = (char)c;
		i++;
		}

	puts(buffer);
	return 0;
}