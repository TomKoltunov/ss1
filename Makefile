CC = gcc
FLAGS = -Wall -g
AR = ar



all : mains maindloop maindrec libclassloops.a libclassrec.a libclassrec.so libclassloops.so

mains : main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a

maindloop : main.o libclassloops.so
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so

maindrec : main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so



loops : libclassloops.a

recursives : libclassrec.a

recursived : libclassloops.so

loopd : libclassloops.so



libclassloops.a : advancedClassificationLoop.o basicClassification.o
	$(AR) -rcs libclassloops.a advancedClassificationLoop.o basicClassification.o

libclassrec.a : advancedClassificationRecursion.o basicClassification.o
	$(AR) -rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o

libclassrec.so : advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared -o libclassrec.so advancedClassificationRecursion.o basicClassification.o

libclassloops.so : advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared -o libclassloops.so advancedClassificationRecursion.o basicClassification.o



main.o : main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

advancedClassificationLoop.o : advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c

advancedClassificationRecursion.o : advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

basicClassification.o : basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c



.PHONY : clean all

clean:
	rm -f mains maindloop maindrec *.a *.so *.o