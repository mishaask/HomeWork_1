CC = gcc
CFLAGS = -Wall -g -fPIC

all: mains maindloop maindrec recursives recursived loopd loops

mains: main.o recursives
	$(CC) $(CFLAGS) -o $@ main.o libclassrec.a 

maindloop: main.o loopd
	$(CC) $(CFLAGS) -o $@ main.o ./libclassloop.so

maindrec: main.o recursived
	$(CC) $(CFLAGS) -o $@ main.o ./libclassrec.so

recursives: advancedClassificationRecursion.o basicClassification.o
	ar -rcs libclassrec.a $^
	ranlib libclassrec.a

recursived: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared $^ -o libclassrec.so

loopd: advancedClassificationLoop.o basicClassification.o
	$(CC) -shared $^ -o libclassloop.so
	
loops: advancedClassificationLoop.o basicClassification.o
	ar -rcs libclassloop.a $^
	ranlib libclassloop.a

main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c $<

.PHONY: all clean mains maindloop maindrec recursives recursived loopd loops

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
