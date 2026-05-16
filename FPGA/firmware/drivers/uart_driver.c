#include <stdint.h>

#define UART_BASE 0x10000000

volatile uint32_t *uart_reg =
(uint32_t *)UART_BASE;

void uart_send_char(char c)
{
    *uart_reg = (uint32_t)c;
}

void uart_send_string(const char *str)
{
    while(*str)
    {
        uart_send_char(*str++);
    }
}