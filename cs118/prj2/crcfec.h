#ifndef CRCFEC_H
#define CRCFEC_H

/* This file defines the functions for CRC an FEC */

/* R. Javier Vega Harb */

#include <stdio.h>
#include "data_struct.h"


/* This function is used to implement the Forward Error Correction Algo. */
void doFEC ( char * s1, char * s2, char * result,  int size );

/* This fucntion is used to calculate the CRC value of an char array */
unsigned short doCRC ( char * source, int size);

#endif
