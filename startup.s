.syntax unified
.cpu cortex-m0plus
.thumb

.global _estack
.global Reset_Handler

_estack = 0x20002000   /* 8KB RAM for STM32C031 */

.section .isr_vector,"a",%progbits
.word _estack
.word Reset_Handler

.section .text
Reset_Handler:
    BL main
    B .
