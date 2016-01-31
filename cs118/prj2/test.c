/*

	This is a test program that implements and tests FEC and CRC.

	R. Javier Vega 

*/

#include "crcfec.h"


int FEC_1 () {

	char a[] = "abcd";
	char b[] = "xywz";
	char r[5];
	char a2[5];
	
	doFEC ( (char *) &a, (char *) &b, (char *) &r, 5);

	/* r has a XOR b */

	/* restore a from b and r into a2 */
	doFEC ( (char *) &b, (char *) &r, (char *) &a2, 5);

	printf ("a = %s, b= %s\n", a, b);
	printf ("r = doFEC(a,b)\n");
	printf ("Reconstruct a from r and b:\n");
	printf ("a2: %s\n", a2);

	return(0);
}	


int FEC_4 () {

	/* defined 4 chuncks of data */
	char s1[] = "This is a chunck of data...";
	char s2[] = "This is the second chuck...";
	char s3[] = "Roses are red, violets are.";
	char s4[] = "Last string of data ...s4..";

	/* define redundant for FEC */
	char sFEC[sizeof(s4)];

	/* store the lost data into s5 */
	char s5[sizeof(s4)];
	
	/* create sFEC from previous data chuncks */
	doFEC ( (char *) &s1, (char *) &s2,   (char *) &sFEC, sizeof(s1) );  /* create from s1 and s2 */
	doFEC ( (char *) &s3, (char *) &sFEC, (char *) &sFEC, sizeof(s1)); /* strore into sFEC s1 ^ s2 ^ s3 */
	doFEC ( (char *) &s4, (char *) &sFEC, (char *) &sFEC, sizeof(s1)); /* strore into sFEC s1 ^ s2 ^ s3 ^ s4 */

	printf ("Example contruct s4 into s5 from s1, s2, s3 and sFEC\n");
	
	doFEC ( (char *) &s1, (char *) &s2,   (char *) &s5, sizeof(s1)); /* FEC s1, s2 */
	doFEC ( (char *) &s3, (char *) &s5,   (char *) &s5, sizeof(s1)); /* FEC s4, s1, s2 */
	doFEC ( (char *) &sFEC, (char *) &s5, (char *) &s5, sizeof(s1)); /* FEC s1, s2, s5, sFEC into s5 */

	printf ("Value obtained: %s\n\n", s5);

	return 0;
}


void crc_Test() {
	
	unsigned short CRC;
	int n, n1, size;
	char data[100];
	
	bzero ( data, sizeof(data) );
	
	strcpy ( data, "this is test of data --wefaoiweofiajw efio--" );
	size = strlen ( data );
	
	printf ("Data to test in CRC:\n%s\n\n", data);
	
	//call CRC
	CRC = doCRC ( data, size + 2 ); // the two are because of data 
	
	printf ("First CRC value calculated on data: %d\n", CRC);
	
	data[size + 1] = (char) (CRC & 0x00ff);		// put crc into data 
	data[size] = (char) (CRC >> 8) & 0x00ff;	// put crc into data
	
	//No we expect CRC of data to be zero
	CRC = doCRC (data, size + 2);
	
	printf ("Re-calculate CRC, with CRC added to the end: %d\n", CRC);
	
	//Scramble data
	data[10] = '\0';

	//No we expect CRC of data to be zero
	CRC = doCRC (data, size + 2);

	printf ("CRC after altering data: %d\n", CRC);
	
	
}





int main () {

	/* call small test */
	printf ("\nStarting with simple test:\n");
	FEC_1();

	/* call FEC with 4 chuncks of data */
	printf ("\nContinued with 4 chuncks of data\n");
	FEC_4();
	
	/* test for CRC */
	crc_Test();
	
	printf("Done with tests.\n\n");

}
