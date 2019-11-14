all:	clean build

build:
	as test1.s -o test1.o
	ld test1.o -o test1

clean:
	rm -f *.o
	rm -f test0


