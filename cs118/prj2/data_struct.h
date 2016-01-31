#ifndef FTWI_H
#define FTWI_H

#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <sys/stat.h> 
#include <unistd.h> 
#include "corruption.h"
#include "crcfec.h"

#define DEBUG_MODE
//#define SHOW_DATA_TRANS

#define PORT 12175
#define MAX_ATTEMPT 10
#define DATA_SIZE 900

#define P_TYPE_INIT "INIT"
#define P_TYPE_ACK  "ACK"
#define P_TYPE_DATA "DATA"


#define CRC_G 0x8224
#define MASK  0x0001
#define ZERO  0x0000

#define TRUE  1
#define true  1
#define FALSE 0
#define false 0
 
struct FileData {
	char p_type[5];
	char filename[50];
	int  file_size;
	int  file_mode;
	int  seq_n;
	int  packet_n;
	char data[DATA_SIZE];
	int  data_size;
	short eof;
	unsigned int CRC;
};

struct DataAck {
	char p_type[5];
	int   seq_n;
	short pck1;
	short pck2;
	short pck3;
	short pck4;
	short fet;
};
#endif
