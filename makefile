CC = gcc
CFLAGS = -Wall -g -fPIC

.SECONDARY: libclassrec.a libclassloop.a libclassrec.so libclassloop.so

all: mains maindloop maindrec

mains: main.o libclassrec.a
	$(CC) $(CFLAGS) -o mains main.o -L. -lclassrec

maindloop: main.o libclassloop.so
	$(CC) $(CFLAGS) -o maindloop main.o -L. -lclassloop

maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) -o maindrec main.o -L. -lclassrec

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	ar -rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o
	ranlib libclassrec.a

libclassloop.so: advancedClassificationLoop.o basicClassification.o
	$(CC) $(CFLAGS) -shared -o libclassloop.so advancedClassificationLoop.o basicClassification.o

libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) $(CFLAGS) -shared -o libclassrec.so advancedClassificationRecursion.o basicClassification.o

loops: libclassloop.a

recursives: libclassrec.a

loopd: libclassloop.so

recursived: libclassrec.so

main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c

.PHONY: all clean

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
