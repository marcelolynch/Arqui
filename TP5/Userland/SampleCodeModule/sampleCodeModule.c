/* sampleCodeModule.c */
#include "screenDriver.h"
#include "rtcAccess.h"
char * v = (char*)0xB8000 + 79 * 2;

unsigned char keyboard[128] =
{
    0,  27, '1', '2', '3', '4', '5', '6', '7', '8',	/* 9 */
  '9', '0', '-', '=', '\b',	/* Backspace */
  '\t',			/* Tab */
  'q', 'w', 'e', 'r',	/* 19 */
  't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n',	/* Enter key */
    0,			/* 29   - Control */
  'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';',	/* 39 */
 '\'', '`',   0,		/* Left shift */
 '\\', 'z', 'x', 'c', 'v', 'b', 'n',			/* 49 */
  'm', ',', '.', '/',   0,				/* Right shift */
  '*',
    0,	/* Alt */
  ' ',	/* Space bar */
    0,	/* Caps lock */
    0,	/* 59 - F1 key ... > */
    0,   0,   0,   0,   0,   0,   0,   0,
    0,	/* < ... F10 */
    0,	/* 69 - Num lock*/
    0,	/* Scroll Lock */
    0,	/* Home key */
    0,	/* Up Arrow */
    0,	/* Page Up */
  '-',
    0,	/* Left Arrow */
    0,
    0,	/* Right Arrow */
  '+',
    0,	/* 79 - End key*/
    0,	/* Down Arrow */
    0,	/* Page Down */
    0,	/* Insert Key */
    0,	/* Delete Key */
    0,   0,   0,
    0,	/* F11 Key */
    0,	/* F12 Key */
    0,	/* All other keys are undefined */
};		

void print_time(){
	char str[9];
	int time = getHour();

	//Fiaca hacer un string posta
	str[1] = time%10 + '0';
	str[0] = (time/10) + '0';
	str[2] = ':';
	time = getMin();
	str[4] = time%10 + '0';
	str[3] = (time/10) + '0';
	str[5] = ':';
	
	time = getSec();
	str[7] = time%10 + '0';
	str[6] = (time/10) + '0';
	str[9] = 0;

	print(str);
}

char keyRead();
int print_key(){
	char s[2] = {0};
	int key = keyRead();
	if(key > 0){
		s[0] = keyboard[key];
		print(s);
	}
	
	return key;
}

static long num = 0;
static int count;
int printTick(){

//	print(tick);
	return 0;
}


int main() {
	clear();
	newline();
	
	print("Hello world!");
	newline();
	print_formatted("Arquitecturas de las Computadoras", 0xfa);
	print_positioned("Random", 24, 37);
	newline();
 	while(1){
 		print_key();
 	}
	
	return 0;
}