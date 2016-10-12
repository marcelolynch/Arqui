#include <stdint.h>
#include <string.h>
#include <lib.h>
#include <moduleLoader.h>
#include <naiveConsole.h>

extern uint8_t text;
extern uint8_t rodata;
extern uint8_t data;
extern uint8_t bss;
extern uint8_t endOfKernelBinary;
extern uint8_t endOfKernel;

static const uint64_t PageSize = 0x1000;

static void * const sampleCodeModuleAddress = (void*)0x400000;
static void * const sampleDataModuleAddress = (void*)0x500000;

typedef int (*EntryPoint)();


void clearBSS(void * bssAddress, uint64_t bssSize)
{
	memset(bssAddress, 0, bssSize);
}

void * getStackBase()
{
	return (void*)(
		(uint64_t)&endOfKernel
		+ PageSize * 8				//The size of the stack itself, 32KiB
		- sizeof(uint64_t)			//Begin at the top of the stack
	);
}

void * initializeKernelBinary()
{
	char buffer[10];

	ncPrint("[x64BareBones]");
	ncNewline();

	ncPrint("CPU Vendor:");
	ncPrint(cpuVendor(buffer));
	ncNewline();

	ncPrint("[Loading modules]");
	ncNewline();
	void * moduleAddresses[] = {
		sampleCodeModuleAddress,
		sampleDataModuleAddress
	};

	loadModules(&endOfKernelBinary, moduleAddresses);
	ncPrint("[Done]");
	ncNewline();
	ncNewline();

	ncPrint("[Initializing kernel's binary]");
	ncNewline();

	clearBSS(&bss, &endOfKernel - &bss);

	ncPrint("  text: 0x");
	ncPrintHex((uint64_t)&text);
	ncNewline();
	ncPrint("  rodata: 0x");
	ncPrintHex((uint64_t)&rodata);
	ncNewline();
	ncPrint("  data: 0x");
	ncPrintHex((uint64_t)&data);
	ncNewline();
	ncPrint("  bss: 0x");
	ncPrintHex((uint64_t)&bss);
	ncNewline();

	ncPrint("[Done]");
	ncNewline();
	ncNewline();
	return getStackBase();
}

static long num = 0;
static int count = 0;
void printTick(){
	if(++count == 90){
		count = 0;
		num+=1;
		ncClear();
		ncPrint("Numero: ");
		ncPrintDec(num);
	}
}


void tickHandler(){

}

int main()
{	
	
	/*iSetHandler(0x20, tickHandler);
	setPicMaster(0xFE);
	sti();


	ncClear();
	ncPrint("[Kernel main]");
	ncNewline();
	ncNewline();
	ncPrintHex(printTick);

	int base = 0x8*16 + 0x20;
	ncNewline();
	*((uint16_t*)(base)) = 	(uint16_t)(printTick);
	*((uint16_t*)(base+6)) = (uint16_t)((int)printTick >> 16);

	ncPrint("Offset 0-15: "); ncPrintHex(*((uint16_t*)(base)));
	ncNewline();
	ncPrint("Selector: "); ncPrintHex(*((uint16_t*)(base+2)));
	ncNewline();
	ncPrint("Bits 0-2 IST: "); ncPrintHex(*((uint8_t*)(base+4)));
	ncNewline();
	ncPrint("Type and attr: "); ncPrintBin(*((uint8_t*)(base+5)));
	ncNewline();
	ncPrint("Offset 16-31: "); ncPrintHex(*((uint16_t*)(base+6)));
	ncNewline();
	ncPrint("Offset 32-63:"); ncPrintHex(*((uint32_t*)(base+8)));
	ncNewline();
	ncPrint("Reservado (0): "); ncPrintHex(*((uint32_t*)(base+12)));
	ncNewline();
	ncNewline();
*/
	((EntryPoint)sampleCodeModuleAddress)();
	/*ncPrint("[Kernel Main]");
	ncNewline();
	ncPrint("  Sample code module at 0x");
	ncPrintHex((uint64_t)sampleCodeModuleAddress);
	ncNewline();
	ncPrint("  Calling the sample code module returned: ");
	ncPrintHex(((EntryPoint)sampleCodeModuleAddress)());
	ncNewline();
	ncNewline();

	ncPrint("  Sample data module at 0x");
	ncPrintHex((uint64_t)sampleDataModuleAddress);
	ncNewline();
	ncPrint("  Sample data module contents: ");
	ncPrint((char*)sampleDataModuleAddress);
	ncNewline();

	ncPrint("[Finished]");*/
	return 0;
}
