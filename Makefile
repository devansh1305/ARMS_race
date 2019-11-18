all:	clean build

build:
	gcc -o test5 test5.s -g
clean:
	rm -f *.o


