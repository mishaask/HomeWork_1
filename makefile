CC = gcc
AR=ar
CFLAGS = -Wall -g -fPIC

all: mains maindloop maindrec libclassrec.a libclassrec.so libclassloop.so libclassloop.a

mains: main.o libclassrec.a
	$(CC) $(CFLAGS) -o mains main.o libclassrec.a 

maindloop: main.o libclassloop.so
	$(CC) $(CFLAGS) -o maindloop main.o ./libclassloop.so

maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) -o maindrec main.o ./libclassrec.so

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	$(AR) -rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o
	ranlib libclassrec.a

libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared advancedClassificationRecursion.o basicClassification.o -o libclassrec.so

libclassloop.so: advancedClassificationLoop.o basicClassification.o
	$(CC) -shared advancedClassificationLoop.o basicClassification.o -o libclassloop.so
	
libclassloop.a: advancedClassificationLoop.o basicClassification.o
	$(AR) -rcs libclassloop.a advancedClassificationLoop.o basicClassification.o
	ranlib libclassloop.a

recursives: libclassrec.a

recursived:libclassrec.so

loopd:libclassloop.so

loops:libclassloop.a

main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c

.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindloop maindrec

