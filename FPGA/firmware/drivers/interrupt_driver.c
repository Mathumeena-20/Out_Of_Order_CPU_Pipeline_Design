#include <stdint.h>

#define IRQ_ENABLE_REG 0x40000000

volatile uint32_t *irq_reg =
(uint32_t *)IRQ_ENABLE_REG;

void enable_interrupts()
{
    *irq_reg = 1;
}

void disable_interrupts()
{
    *irq_reg = 0;
}