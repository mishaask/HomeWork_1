CC = gcc
CFLAGS = -Wall -g -fPIC

all: mains maindloop maindrec

mains: main.o libclassrec.a
	$(CC) $(CFLAGS) -o $@ $^

maindloop: main.o libclassloop.so
	$(CC) $(CFLAGS) -o $@ main.o -L. -lclassloop

maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) -o $@ main.o -L. -lclassrec

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	ar -rcs $@ $^

libclassloop.so: advancedClassificationLoop.o basicClassification.o
	$(CC) $(CFLAGS) -shared -o $@ $^

libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) $(CFLAGS) -shared -o $@ $^

recursives: libclassrec.a

recursived: libclassrec.so

loopd: libclassloop.so

loops: libclassloop.a

main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c $<

.PHONY: all clean

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
