CC = gcc
CFLAGS = -Wall -g -fPIC

all: mains recursives recursived loopd loops maindloop maindrec


mains: main.o recursives
	$(CC) $(CFLAGS) -o mains main.o libclassrec.a

maindloop: main.o loopd
	$(CC) $(CFLAGS) -o maindloop main.o ./libclassloop.so

maindrec: main.o recursived
	$(CC) $(CFLAGS) -o maindrec main.o ./libclassrec.so

recursives: advancedClassificationRecursion.o basicClassification.o
	ar -rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o

recursived: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared -o libclassrec.so advancedClassificationRecursion.o basicClassification.o

loopd: advancedClassificationLoop.o basicClassification.o
	$(CC) -shared -o libclassloop.so advancedClassificationLoop.o basicClassification.o

loops: advancedClassificationLoop.o basicClassification.o
	ar -rcs libclassloop.a advancedClassificationLoop.o basicClassification.o

main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
