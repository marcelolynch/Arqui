include ../Makefile.inc

MODULE=0000-sampleCodeModule.bin
ASMSOURCES=$(wildcard *.asm)
SOURCES=$(wildcard [^_]*.c)
ASMOBJECTS=$(ASMSOURCES:.asm=.o)
COBJECTS=$(SOURCES:.c=.o)

%.o: %.c
	$(GCC) $(GCCFLAGS) -c _loader.c $(SOURCES) 

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

all: $(USER)

$(USER): $(ASMOBJECTS) $(COBJECTS)
	$(LD) -T sampleCodeModule.ld _loader.o $(COBJECTS) $(ASMOBJECTS) -o ../$(MODULE)

clean:
	rm -rf *.o

.PHONY: all clean