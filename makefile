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
mains: main_static_rec
maindloop: main_dynamic_loop
maindrec: main_dynamic_rec
loops: $(STATIC_LOOP_LIBRARY)			
recursives: $(STATIC_RECURSIVE_LIBRARY)		
recursived: $(DYNAMIC_RECURSIVE_LIBRARY)
loopd: $(DYNAMIC_LOOP_LIBRARY)

# build main with static recursive library
main_static_rec: $(STATIC_RECURSIVE_LIBRARY) main.o
	gcc -Wall -o mains main.o -L. -lclassrec

# build main with dynamic loop library
main_dynamic_loop: $(DYNAMIC_LOOP_LIBRARY) main.o
	gcc -Wall -o maindloop main.o -L. -lclassloops

# build main with dynamic recursive library
main_dynamic_rec: $(DYNAMIC_RECURSIVE_LIBRARY) main.o
	gcc -Wall -o maindrec main.o -L. -lclassrec


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


clean:
	rm -f $(STATIC_RECURSIVE_LIBRARY) $(LIB_REC_OBJS) $(STATIC_LOOP_LIBRARY) $(LIB_LOOP_OBJS) $(DYNAMIC_RECURSIVE_LIBRARY) $(DYNAMIC_LOOP_LIBRARY) main.o mains maindloop maindrec

.PHONY: clean 	#clean always conciderd "out of date"
