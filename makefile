CC = gcc
CFLAGS = -Wall -g -fPIC

all: mains maindloop maindrec recursives recursived loopd loops

mains: main.o recursives
	$(CC) $(CFLAGS) -o mains main.o libclassrec.a 

maindloop: main.o loopd
	$(CC) $(CFLAGS) -o maindloop main.o ./libclassloop.so

maindrec: main.o recursived
	$(CC) $(CFLAGS) -o maindrec main.o ./libclassrec.so

recursives: advancedClassificationRecursion.o basicClassification.o
	ar -rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o
	ranlib libclassrec.a

recursived: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared advancedClassificationRecursion.o basicClassification.o -o libclassrec.so

loopd: advancedClassificationLoop.o basicClassification.o
	$(CC) -shared advancedClassificationLoop.o basicClassification.o -o libclassloop.so
	
loops: advancedClassificationLoop.o basicClassification.o
	ar -rcs libclassloop.a advancedClassificationLoop.o basicClassification.o
	ranlib libclassloop.a

main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c

.PHONY: all clean

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
