STATIC_LOOP_LIBRARY = libclassloops.a		#static library
STATIC_RECURSIVE_LIBRARY = libclassrec.a 			#static library
DYNAMIC_LOOP_LIBRARY = libclassloops.so	#dynamic library
DYNAMIC_RECURSIVE_LIBRARY = libclassrec.so		#dynamic library

# Source files
LIB_LOOP_C = basicClassification.c advancedClassificationLoop.c
LIB_REC_C = basicClassification.c advancedClassificationRecursion.c

# Object files
LIB_LOOP_OBJS = $(LIB_LOOP_C:.c=.o)
LIB_REC_OBJS = $(LIB_REC_C:.c=.o)

all: mains maindloop maindrec loops recursives recursived loopd
loops: $(STATIC_LOOP_LIBRARY)			
recursives: $(STATIC_RECURSIVE_LIBRARY)		
recursived: $(DYNAMIC_RECURSIVE_LIBRARY)
loopd: $(DYNAMIC_LOOP_LIBRARY)

# build main with static recursive library
mains: $(STATIC_RECURSIVE_LIBRARY) main.o
	gcc -Wall -o $@ main.o -L. -lclassrec

# build main with dynamic loop library
maindloop: $(DYNAMIC_LOOP_LIBRARY) main.o
	gcc -Wall -o $@ main.o -L. -lclassloops

# build main with dynamic recursive library
maindrec: $(DYNAMIC_RECURSIVE_LIBRARY) main.o
	gcc -Wall -o $@ main.o -L. -lclassrec

#build main object file
main.o: main.c
	gcc -Wall -c -o $@ $<

# Build basic object file
basicClassification.o: basicClassification.c
	gcc -Wall -c -o $@ $<

# Build static loop library
$(STATIC_LOOP_LIBRARY): $(LIB_LOOP_OBJS)
	ar rcs $@ $^

# Build static recursive library
$(STATIC_RECURSIVE_LIBRARY): $(LIB_REC_OBJS) 
	ar rcs $@ $^

#build dynamic loop library
$(DYNAMIC_LOOP_LIBRARY): $(LIB_LOOP_OBJS)
	gcc -Wall -fPIC	-shared -o $@ $^

#build dynamic recursive library
$(DYNAMIC_RECURSIVE_LIBRARY): $(LIB_REC_OBJS)
	gcc -Wall -fPIC	-shared -o $@ $^

#build loop file
advancedClassificationLoop.o: advancedClassificationLoop.c
	gcc -Wall -c -o $@ $<

#build recursive file
advancedClassificationRecursion.o: advancedClassificationRecursion.c
	gcc -Wall -c -o $@ $<

#clean all .o .a .so prog
clean:
	rm -f *.o $(STATIC_RECURSIVE_LIBRARY) $(STATIC_LOOP_LIBRARY) $(DYNAMIC_RECURSIVE_LIBRARY) $(DYNAMIC_LOOP_LIBRARY) mains maindloop maindrec

.PHONY: clean all loopd recursives recursived loopd	#always conciderd "out of date" indicates not files
