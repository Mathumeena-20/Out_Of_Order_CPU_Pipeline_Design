ENTRY(_start)

MEMORY
{
    ROM (rx)  : ORIGIN = 0x00000000, LENGTH = 64K
    RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 128K
}

SECTIONS
{
    .text :
    {
        *(.text*)
    } > ROM

    .data :
    {
        *(.data*)
    } > RAM

    .bss :
    {
        *(.bss*)
    } > RAM

    .stack :
    {
        _stack_top = . + 0x1000;
    } > RAM
}