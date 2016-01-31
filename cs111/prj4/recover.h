#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <fcntl.h>
#include <stdlib.h>
#include <math.h>
#include <errno.h>
#include <unistd.h>
#include <iconv.h>

#define BYTES_PER_SECTOR 512
#define BYTES_PER_DIR_ENTRY 32
#define MAX_CMD_LINE_ARG_CHAR 120
#define MAX_SUBDIRS 50
#define MAX_DIR_ENTRY 120


// Data Structures Definitions
struct BootDescriptor
{
	unsigned BytePerSector;
	unsigned SectorPerCluster;
	unsigned SectorForBoot;
	unsigned NumOfFat;
	unsigned BPB_RootEntCnt;
	unsigned NumOfLogSector;
	unsigned MedDesByte;
	unsigned SectorPerFat;
	unsigned SectorPerTrack;
	unsigned NumOfSurface;
	unsigned NumOfHidSector;
};

struct DirectoryEntry
{
	char FileName[11];
	char Attr[1];
	char CheckSum[2];
	char Dummy[12];
	char FirstCluster[2];
	char FileSize[4];
};

struct LongFileNameEntry
{
	char ID[1];
	char FileName[10];		// 5 Unicode Chars
	char Attr[1];			// 0xff
	char CheckSum[2];		// Check Sum Byte
	char FileName2[12];		// 6 More Unicode Chars
	char Dummy[2];			// Skip
	char FileName3[4];		// 2 More Unicode Chars
};



// Function Definitons
int read_sector ( int sector_offset, char * buffer );
int read_cluster ( int cluster_offset, char * buffer );
int GetBootData (  );
void DisplayBootData(  );
void ParseDirectory ( int sector_num );
void RecoverFile ( char filename[120], char dir[400], int filesize, unsigned int FirstCluster );
void CommandLineArgs ( int argc, char **argv );
void FATtype(  );
unsigned int getClusterValue ( unsigned int NumCluster );
