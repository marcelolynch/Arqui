//No compilar

void foo1(){
	int numero; //Declaracion de variable
}

//=====================

void foo2(){
	int numero = 21; //Declaracion y definicion
}

//=====================

int numero;		//Declaracion de variable global
void foo3(){
	numero = 21; //Definicion de var numero
}

//=====================

void foo4(){
	static int numero = 21; //Declaracion y definicion de variable
							//static (se preserva entre llamadas)
}


//======================

extern int numero; //Declaracion de variable externa (definida en otro lado)
int foo5(){
	numero = 10; //Definicion de variable
}

//Otro archivo
int numero = 21; //Declaracion de variable de alcance global
int bar(){
	numero = 30; //Definicion de variable
}
//======================

static int numero = 10; //Declaracion y definicion de variable privada
int foo() { 
   numero = 20; //Definicion de variable
} 