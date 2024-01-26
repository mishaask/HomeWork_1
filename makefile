CC = gcc #$(CC)
AR=ar #$(AR)
CFLAGS = -Wall -g -fPIC #$(CFLAGS)
ACR = advancedClassificationRecursion.o #$(ACR)
ACL = advancedClassificationLoop.o #$(ACL)
BC = basicClassification.o #$(BC)

all: mains maindloop maindrec libclassrec.a libclassrec.so libclassloop.so libclassloop.a

mains: main.o libclassrec.a
	$(CC) $(CFLAGS) -o mains main.o libclassrec.a 

maindloop: main.o libclassloop.so
	$(CC) $(CFLAGS) -o maindloop main.o ./libclassloop.so

maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) -o maindrec main.o ./libclassrec.so

libclassrec.a: $(ACR) $(BC)
	$(AR) -rcs libclassrec.a $(ACR) $(BC)
	ranlib libclassrec.a

libclassrec.so: $(ACR) $(BC)
	$(CC) -shared $(ACR) $(BC) -o libclassrec.so

libclassloop.so: $(ACL) $(BC)
	$(CC) -shared $(ACL) $(BC) -o libclassloop.so
	
libclassloop.a: $(ACL) $(BC)
	$(AR) -rcs libclassloop.a $(ACL) $(BC)
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
