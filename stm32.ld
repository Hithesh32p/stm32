ENTRY(Reset_Handler)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 32K
  RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 8K
}

SECTIONS
{
  .isr_vector : {
    *(.isr_vector)
  } > FLASH

  .text : {
    *(.text*)
  } > FLASH

  .data : {
    *(.data*)
  } > RAM AT > FLASH

  .bss : {
    *(.bss*)
  } > RAM
}
