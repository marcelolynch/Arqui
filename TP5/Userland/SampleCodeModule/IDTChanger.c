#include <stdint.h>


typedef struct {
  uint16_t  baseLow,
            selector;
  uint8_t   zero,
            access;
  uint16_t  baseMid;
  uint32_t	baseHigh,
            _zero;
}__attribute__((packed)) idtEntry;


int changeIDT(unsigned int entry){
	return 0;
}