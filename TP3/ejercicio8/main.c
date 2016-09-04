int puts(const char* str);

int main(int argc,char* argv[] ){
	int i = 0;

	while(i < argc){
		puts("Argumento: ");
		puts(argv[i]);
		puts("\n");
		i++;
	}

	return argc;
}

/* Leer readme.txt para compilacion */