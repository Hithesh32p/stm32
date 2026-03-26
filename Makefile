CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m0plus -mthumb -nostdlib -Wall
LDFLAGS = -T stm32.ld

all: firmware.elf

firmware.elf: main.o startup.o
	$(CC) $(CFLAGS) main.o startup.o $(LDFLAGS) -o firmware.elf

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

startup.o: startup.s
	$(CC) $(CFLAGS) -c startup.s

clean:
	rm -f *.o *.elf
