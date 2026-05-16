#include <stdint.h>

#define GPIO_BASE 0x20000000

volatile uint32_t *gpio_reg =
(uint32_t *)GPIO_BASE;

void gpio_write(uint32_t value)
{
    *gpio_reg = value;
}

uint32_t gpio_read()
{
    return *gpio_reg;
}