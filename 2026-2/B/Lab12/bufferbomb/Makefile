####################################
# CS:APP Buffer Lab
# Makefile that builds a buffer bomb
####################################

####################################### 
# No need to change anything below here
#######################################
CC = gcc
CFLAGS = -Wall -O0

# Build the buffer bomb
bufbomb: bufbomb.c buf.c hex2raw
	$(CC) $(CFLAGS) -no-pie -fno-stack-protector -Wa,--execstack -o bufbomb bufbomb.c buf.c 

# Build hex2raw utility
hex2raw: hex2raw.c
	$(CC) $(CFLAGS) -o hex2raw hex2raw.c

# Use this when you want to recompile
clean:
	-rm -f *.o bufbomb hex2raw *~

