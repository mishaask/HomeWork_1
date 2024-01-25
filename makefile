CC = gcc
CFLAGS = -Wall -g -fPIC
COMPILATION_MARKER = .last_compilation

all: mains maindloop maindrec recursives recursived loopd loops

mains: main.o recursives
	$(CC) $(CFLAGS) -o $@ main.o libclassrec.a 
	@touch $(COMPILATION_MARKER)

maindloop: main.o loopd
	$(CC) $(CFLAGS) -o $@ main.o ./libclassloop.so
	@touch $(COMPILATION_MARKER)

maindrec: main.o recursived
	$(CC) $(CFLAGS) -o $@ main.o ./libclassrec.so
	@touch $(COMPILATION_MARKER)

recursives: advancedClassificationRecursion.o basicClassification.o
	ar -rcs libclassrec.a $^
	ranlib libclassrec.a
	@touch $(COMPILATION_MARKER)

recursived: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared $^ -o libclassrec.so
	@touch $(COMPILATION_MARKER)

loopd: advancedClassificationLoop.o basicClassification.o
	$(CC) -shared $^ -o libclassloop.so
	@touch $(COMPILATION_MARKER)

loops: advancedClassificationLoop.o basicClassification.o
	ar -rcs libclassloop.a $^
	ranlib libclassloop.a
	@touch $(COMPILATION_MARKER)

main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c $<
	@touch $(COMPILATION_MARKER)

.PHONY: all clean

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
