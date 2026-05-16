#include <stdint.h>

#define ARRAY_SIZE 1024

uint32_t data_array[ARRAY_SIZE];

int cache_test()
{
    uint32_t i;
    uint32_t sum = 0;

    for(i = 0; i < ARRAY_SIZE; i++)
    {
        data_array[i] = i;
    }

    for(i = 0; i < ARRAY_SIZE; i++)
    {
        sum += data_array[i];
    }

    return sum;
}