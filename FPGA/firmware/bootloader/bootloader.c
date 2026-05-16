#include <stdint.h>

#define UART_BASE 0x10000000

volatile uint32_t *uart_tx =
(uint32_t *)UART_BASE;

void uart_putc(char c)
{
    *uart_tx = (uint32_t)c;
}

void uart_print(const char *str)
{
    while(*str)
    {
        uart_putc(*str++);
    }
}

void boot_main()
{
    uart_print("Bootloader Start\n");

    // Jump to application

    void (*app_start)(void);

    app_start = (void (*)(void))0x80000000;

    app_start();
}