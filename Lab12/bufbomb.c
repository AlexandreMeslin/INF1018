/* 
 * bufbomb.c - Bomb program that is solved using a buffer overflow attack 
 * 
 * Copyright (c) 2002-2011, R. Bryant and D. O'Hallaron, All rights reserved.
 */
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>

/* Global variables */
FILE *infile = NULL; /* always stdin */

/* Function prototypes */
int getbuf();

/*
 * The following is the part of the code students will actually look
 * at.  They are put at the beginning of the file to make them easier
 * to find in the diassembly, and to make their locations more stable
 * when other parts of the code get modified.
 */
int valid (char *p) {
  return (!strcmp(p,"secretkey"));
}

void danger () {
  printf ("\ndanger! you called danger()\n");
  system ("rm -r  vitima");
}

void protect (char *pass, char *nome) {
  if (valid(pass))
    danger(nome);
}

/* 
 * smoke - On return from getbuf(), the level 0 exploit executes
 * the code for smoke() instead of returning to test().
 */
/* $begin smoke-c */
void smoke()
{
    printf("Smoke!: You called smoke()\n");
    exit(0);
}
/* $end smoke-c */

/* 
 * fizz - On return from getbuf(), the level 1 exploit executes the
 * code for fizz() and makes it appear
 * that fizz() was passed the users's unique cookie as the argument.
 */
/* $begin fizz-c */
void fizz(int val)
{
    if (val == 0x01020304) {
		printf("Fizz!: You called fizz(0x%x)\n", val);

    } else
		printf("Misfire: You called fizz(0x%x)\n", val);
    exit(0);
}
/* $end fizz-c */


/******************
 * Helper functions
 ******************/
                
/*              
 * Gets - Like gets()
 */ 

char *Gets(char *dest)
{
    int c;
    char *sp = dest;

    while ((c = getc(infile)) != EOF && c != '\n') {
                *sp++ = c;
    }

    *sp++ = '\0';
    return dest;
}

/* 
 * Signal handlers for bus errors, seg faults, and illegal instruction
 * faults
 */
void bushandler(int sig)
{
    printf("Crash!: You caused a bus error!\n");
    printf("Better luck next time\n");
    exit(0);
}

void seghandler(int sig)
{
    printf("Ouch!: You caused a segmentation fault!\n");
    printf("Better luck next time\n");
    exit(0);
}

void illegalhandler(int sig)
{
    printf("Oops!: You executed an illegal instruction\n");
    printf("Better luck next time\n");
    exit(0);
}



/* 
 * main - The main routine
 */
int main(int argc, char *argv[])
{

    /* Install handlers for the inevitable faults */
    signal(SIGSEGV, seghandler);
    signal(SIGBUS,  bushandler);
    signal(SIGILL,  illegalhandler);

    /* Parse command line arguments */
    infile = stdin;

    getbuf();

    printf (":-( program reached its normal end!\n");
    return 0;
}

