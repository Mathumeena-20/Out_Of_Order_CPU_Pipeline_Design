#include <stdint.h>

#define MEM_BASE 0x80000000

volatile uint32_t *mem =
(uint32_t *)MEM_BASE;

int memory_test()
{
    uint32_t i;

    for(i = 0; i < 256; i++)
    {
        mem[i] = i;
    }

    for(i = 0; i < 256; i++)
    {
        if(mem[i] != i)
            return -1;
    }

    return 0;
}