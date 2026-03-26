#include <stdint.h>

// RCC
#define RCC_IOPENR   (*(volatile uint32_t*)0x40021034)

// GPIOA
#define GPIOA_MODER  (*(volatile uint32_t*)0x50000000)
#define GPIOA_ODR    (*(volatile uint32_t*)0x50000014)

void delay(volatile uint32_t t) {
    while (t--);
}

int main(void) {
    // Enable GPIOA clock
    RCC_IOPENR |= (1 << 0);

    // Set PA5 as output (01)
    GPIOA_MODER &= ~(3 << (5 * 2));
    GPIOA_MODER |=  (1 << (5 * 2));

    while (1) {
        GPIOA_ODR ^= (1 << 5);
        delay(500000);
    }
}
