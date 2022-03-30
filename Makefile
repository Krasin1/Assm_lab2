all: code.o a.o
	gcc code.o a.o -fno-pie -no-pie -o qwer

code.o: code.c
	gcc -c code.c -o code.o

a.o: a.asm
	yasm -f elf64 a.asm -o a.o

clean:
	rm *.o && rm qwer
