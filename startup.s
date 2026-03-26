.syntax unified
.cpu cortex-m3
.thumb

.global _start
.global Reset_Handler

.section .text
_start:
    B Reset_Handler

Reset_Handler:
    BL main
    B .
