#include <svdpi.h>
#include <stdio.h>
#include <elf.h>

char buffer[256] = {0};

int
uart_putc(const char c)
{
    if (c == '\n') {
        printf("UART: %s\n", buffer);
        memset(buffer, 0, sizeof(buffer));
    } else {
        sprintf(buffer, "%s%c", buffer, c);
    }

    return 0;
}
