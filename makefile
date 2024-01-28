# names
HEADER = NumClass.h
MAIN = main.c
STATIC_LOOP_LIBRARY = libclassloops.a
STATIC_RECURSIVE_LIBRARY = libclassrec.a
DYNAMIC_LOOP_LIBRARY = libclassloops.so
DYNAMIC_RECURSIVE_LIBRARY = libclassrec.so

# Build everything 
all: loops recursives recursived loopd mains maindloop maindrec 

# Builds libraries
loops: $(STATIC_LOOP_LIBRARY)
recursives: $(STATIC_RECURSIVE_LIBRARY)
recursived: $(DYNAMIC_RECURSIVE_LIBRARY)
loopd: $(DYNAMIC_LOOP_LIBRARY)

# Main programs :
# Build main with static recursive library
mains: $(MAIN:.c=.o) $(STATIC_RECURSIVE_LIBRARY)
	gcc -Wall $< ./$(STATIC_RECURSIVE_LIBRARY) -o $@

# Build main with dynamic loop library
maindloop: $(MAIN:.c=.o) $(DYNAMIC_LOOP_LIBRARY)
	gcc -Wall $< ./$(DYNAMIC_LOOP_LIBRARY) -o $@

# Build main with dynamic recursive library
maindrec: $(MAIN:.c=.o) $(DYNAMIC_RECURSIVE_LIBRARY)
	gcc -Wall $< ./$(DYNAMIC_RECURSIVE_LIBRARY) -o $@

# Compile main program to object file
$(MAIN:.c=.o): $(MAIN) $(HEADER)
	gcc -Wall -c $^

# Builds libraries
$(DYNAMIC_RECURSIVE_LIBRARY): advancedClassificationRecursion.o basicClassification.o
	gcc -shared -Wall $^ -o $@

$(DYNAMIC_LOOP_LIBRARY): advancedClassificationLoop.o basicClassification.o
	gcc -shared -Wall $^ -o $@

$(STATIC_LOOP_LIBRARY): advancedClassificationLoop.o basicClassification.o
	ar rcs $@ $^

$(STATIC_RECURSIVE_LIBRARY): advancedClassificationRecursion.o basicClassification.o
	ar rcs $@ $^

#Builds object files
advancedClassificationLoop.o: advancedClassificationLoop.c $(HEADER)
	gcc -Wall -c $^ -fPIC

advancedClassificationRecursion.o: advancedClassificationRecursion.c $(HEADER)
	gcc -Wall -c $^ -fPIC

basicClassification.o: basicClassification.c $(HEADER)
	gcc -Wall -c $^ -fPIC
	
#Command which are not targets
.PHONY: all clean loops recursives recursived loopd 

#Clean nessesery files
clean:
	rm -f *.o *.a *.so *.gch mains  maindrec maindloop