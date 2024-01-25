CC = gcc
CFLAGS = -Wall -g -fPIC

.PHONY: all clean

all: mains maindloop maindrec

mains: main.o libclassrec.a
	$(CC) $(CFLAGS) -o mains main.o -L. -lclassrec

maindloop: main.o libclassloop.so
	$(CC) $(CFLAGS) -o maindloop main.o -L. -lclassloop

maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) -o maindrec main.o -L. -lclassrec

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	ar -rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o

libclassloop.so: advancedClassificationLoop.o basicClassification.o
	$(CC) $(CFLAGS) -shared -o libclassloop.so advancedClassificationLoop.o basicClassification.o

libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) $(CFLAGS) -shared -o libclassrec.so advancedClassificationRecursion.o basicClassification.o

main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
