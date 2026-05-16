#include <stdint.h>

volatile uint32_t interrupt_flag = 0;

void interrupt_handler()
{
    interrupt_flag = 1;
}

int interrupt_test()
{
    interrupt_handler();

    if(interrupt_flag)
        return 0;

    return -1;
}