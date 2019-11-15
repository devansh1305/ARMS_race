all:	clean build

build:
	as test1.s -o test1.o -g
	gcc -o test1 -nostartfiles test1.o
clean:
	rm -f *.o


