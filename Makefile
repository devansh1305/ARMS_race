all:	clean build

build:
	gcc -o test6 test6.s -g
clean:
	rm -f *.o


