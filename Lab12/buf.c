#include <stdio.h>

/* Buffer procedures used by buffer bomb */

/* Function declarations */
char *Gets(char *);

/* $begin getbuf-c */
/* Buffer size for getbuf */
#define NORMAL_BUFFER_SIZE 32

/* $end getbuf-c */

/*
 * getbuf 
 */
/* $begin getbuf-c */
int getbuf()
{
    char buf[NORMAL_BUFFER_SIZE];

    printf("buf: %p\n", buf);
    Gets(buf);
    return 1;
}
/* $end getbuf-c */

