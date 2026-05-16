#include <stdint.h>

#define TIMER_BASE 0x30000000

volatile uint32_t *timer_reg =
(uint32_t *)TIMER_BASE;

void timer_start(uint32_t value)
{
    *timer_reg = value;
}

uint32_t timer_read()
{
    return *timer_reg;
}