/*
	This is a test program that implements and tests FEC and CRC.

	R. Javier Vega 
	SID: 003-110-717
	CS118 Project #2 
*/

#include "crcfec.h"

void doFEC ( char * s1, char * s2, char * result,  int size ) {

  /* perform XOR of each of the bytes passed on result */
  int i;

  for ( i = 0; i < size; i++ ) result[i] = s1[i] ^ s2[i];
}


unsigned short doCRC ( char * source, int size ) {
	
  /* perform CRC calculation */	
  short i, i2;
  short done = false; 
  unsigned short CRC = 0;
  
  for (i = 0; i < size; i++) { 	  /* process the complete set of chars */
    for (i2 = 7; i2 >= 0; i2--) {  /* process each char from higher bit to lower value */
	CRC = CRC << 1;		  /* shift CRC one space */
	if ( ( *(source + i) >> i2 ) & 1) CRC ^= MASK; /* if check bit == 1, XOR CRC with 0x0001 */
	
	if (done) {		  /* when the 16 chars have been checked */
	  CRC ^= CRC_G;		  /* XOR CRC with G */
	  done = false;
	}
	if ((CRC >> 15) & 1) done = true; /* n = 16 */
    }
  }
  
  return CRC;
}
