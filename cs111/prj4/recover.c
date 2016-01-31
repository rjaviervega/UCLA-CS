#include "recover.h"

int BytesPerSector = BYTES_PER_SECTOR;
int DataInitialSector;
int BytesPerCluster;
// Global File Descriptor For Image
int fid;

// Command Line Args
char DestDir [MAX_CMD_LINE_ARG_CHAR];  // Destination Directory
char FileImg [MAX_CMD_LINE_ARG_CHAR];  // File Image
int  SkipFlag = 0;	 // Skip Flag
int  ZeroFlag = 0;   // Zero Flag
int  AltFatFlag = 0; // AltFat Flag
int  NoBadFlag = 0;

int outofbound = 0;

int FAT12Flag; 		//1 if FAT12; 0 otherwise(ie. FAT16)

// Structure to keep the list of directories visited
// Directories keep a list of the visited
// directories when looking for deleted entries.
// The visited directories are added to the array
// with a maximun of MAX_SUBDIRS number for search.
int  Dir_Cnt = 0;
char Dir_List [MAX_SUBDIRS][MAX_DIR_ENTRY];

// Keep Count off All Visited Clusters
// to avoid repeating lookup of same clustres.
int ** ScannedSectors;
int ScannedSectorsCnt = 0;

// Used in FAT determination and
// to create the dynamic array of visited
// clusters
int CountofClusters = 0;



struct BootDescriptor BootDesc;




int main ( int argc, char **argv )
{
	int i, j;
	int RootDirSector;
	int NumRootDicSec;

	// Process the Command Line Arguments
	CommandLineArgs ( argc, argv );

	// Open Initial File Image
	if (strcmp(FileImg, "") != 0) {
		fid = open ( FileImg , O_RDONLY );
	}
	else {
		printf ("Error: No VFat Image specified.\n");
		exit(0);
	}

	//AltFatFlag = 1;

	// Get BootSectorData
	GetBootData ( );

	DisplayBootData ( );

	FATtype( );

	// Calculate Root Directory Starting Sector
	RootDirSector = ( BootDesc.SectorForBoot + ( BootDesc.NumOfFat * BootDesc.SectorPerFat ) );

	// Get the initial Sector where data is stored
	DataInitialSector = BootDesc.SectorForBoot +
						( ( BootDesc.BPB_RootEntCnt * BYTES_PER_DIR_ENTRY ) / BytesPerSector ) +
						(BootDesc.NumOfFat * BootDesc.SectorPerFat) ;

	BytesPerCluster = BootDesc.BytePerSector * BootDesc.SectorPerCluster;

	// Zero Directory Entry
	bzero ( Dir_List, (MAX_DIR_ENTRY -1) * (MAX_SUBDIRS -1) );

	// Create the array to hold all the sectors
	ScannedSectors = malloc ( sizeof(int) * BootDesc.NumOfLogSector );

	// Parse Root Directory Recoursibly
	// For each of the Sectors in the RootDirectory
	NumRootDicSec = ( ( BootDesc.BPB_RootEntCnt * BYTES_PER_DIR_ENTRY ) / BytesPerSector );
	for ( i = 0; i < NumRootDicSec; i++ ) ParseDirectory( RootDirSector + i );

	// Check all unallocated clusters
	for ( i = 2; i < CountofClusters; i++ )
	{
		// if a cluster is not allocated then check it as directory
		if ( getClusterValue(CountofClusters) != 0 ) continue;

		// else check the cluster as directory
		for ( j = 0; j < BootDesc.SectorPerCluster; j++ ) {
			ParseDirectory (( (i - 2) * 4 ) + DataInitialSector + j);
		}
	}


	free ( ScannedSectors );
	return 0;
}



// Reads and prints all the directory information
void ParseDirectory ( int sector_num )
{
	int i, i2, i3, i4, i5, i6, i7, filesize;
	char entryname[120], newname[120], NewDir[400], NewFile[400], DirPath[400];
	char tempDir[400], tempDir2[400], tempDir4[400];
	unsigned int FirstCluster;
	unsigned int FirstClusterHigh;
	unsigned int NextClusterToRead;
	char longname[120];
	size_t insize = 32;
	size_t outsize = 40;
	char ascii[40];
	char * inptr;
	char * outptr;
	char uni[] = "UNICODE";
	char asc[] = "ASCII";
	int resp;
	int LongNameDetected;
	iconv_t convertion;
	int longdel;
	struct LongFileNameEntry LongEntry;
	struct DirectoryEntry Entries[16]; 	// Data where to read all the directory entries


	// Check if the sector to scan is invalid
	if ( sector_num > BootDesc.NumOfLogSector -1 ) return;

	// Check if the sector has already been read for directories entries
	for ( i = 0; i < ScannedSectorsCnt; i++ ) {
		if ( (int) ScannedSectors[i] == sector_num ) {
			// Sector was already scanned
			//printf ("Sector %d was scanned.\n", ScannedSectors[i]);
			return;
		}
	}
	// Else: Add the sector to the list
	(int) ScannedSectors[ScannedSectorsCnt] = sector_num;
	ScannedSectorsCnt++;
	// ..

	outptr = malloc (400);
	// Read a complete sector into Data Structures

	read_sector ( sector_num, (char *) &Entries );


	// For each Entry in the directories
	for ( i = 0; i < 16; i++ ) {
		strncpy ( entryname, Entries[i].FileName, 11 );
		entryname[11] = '\0';
		strncpy ( newname, entryname, 12);
		newname[0] = '_';

		// Skip redundant entries
		if ( ( strcmp ( entryname, ".          ") == 0) ||
		     ( strcmp ( entryname, "..         ") == 0) )  continue;

		// Skip long file name entries
		if ((unsigned) Entries[i].Attr[0] & (unsigned) 0x0f) continue;

		// Check if the entry is valid at all

		if ( !((unsigned) Entries[i].Attr[0] & (unsigned) 0x10) &&
		     !((unsigned) Entries[i].Attr[0] & (unsigned) 0x20) ) {
			 // Directory Entry is invalid
			 // We Should stop check for this directory
			continue;
		}

		// Check for an 0 entry in the directory
		if ( entryname[0] == '\0' ) return;

		// Check for previous lonf filename
		convertion = iconv_open ( asc, uni );
		strcpy ( longname, "");
		longdel = 0; //default flag
		for ( i6 = i-1; i6 >= 0; i6--) {

			LongNameDetected = 0;

			// If the previuous entry was a long file name entry
			if ( ( i6 - 1 ) > 0)
			if ( (Entries[i6].CheckSum[1] == Entries[i6-1].CheckSum[1]  &&
			      Entries[i6].CheckSum[1] != (char) 0x00 ) ) {
				LongNameDetected = 1;
			}

			if ( ( i6 + 1) < 16 )
			if ( (Entries[i6].CheckSum[1] == Entries[i6+1].CheckSum[1]  &&
				  Entries[i6].CheckSum[1] != (char) 0x00 ) ) {
				LongNameDetected = 1;
			}

			if ( LongNameDetected == 1 )
			{
				// Get the unicode piece from the struct
				memcpy ( (char *) &LongEntry, (char *) &Entries[i6], 32 );

				// Get rid of invalid ffs
				for ( i7 = 0; i7 < 10 ; i7++ )
					if ( LongEntry.FileName[i7] == (char) 0xff) LongEntry.FileName[i7] = (char) 0x00;
				for ( i7 = 0; i7 < 12 ; i7++ )
					if ( LongEntry.FileName2[i7] == (char) 0xff) LongEntry.FileName2[i7] = (char) 0x00;
				for ( i7 = 0; i7 < 3 ; i7++ )
					if ( LongEntry.FileName3[i7] == (char) 0xff) LongEntry.FileName3[i7] = (char) 0x00;
				// Nasty Piece of Code

				//Get first part
				inptr = (char *) &LongEntry.FileName;
				outptr = ascii;
				insize = 10;
				outsize = 40;
				resp = iconv ( convertion, &inptr, &insize, &outptr, &outsize );
				if ( resp != -1 ) strncat(longname, ascii, 5);
				//Get second part
				inptr = (char *) &LongEntry.FileName2;
				outptr = ascii;
				insize = 12;
				outsize = 40;
				resp = iconv ( convertion, &inptr, &insize, &outptr, &outsize );
				if ( resp != -1 ) strncat(longname, ascii, 6);
				//Get first part
				inptr = (char *) &LongEntry.FileName3;
				outptr = ascii;
				insize = 4;
				outsize = 40;
				resp = iconv ( convertion, &inptr, &insize, &outptr, &outsize );
				if ( resp != -1 ) strncat(longname, ascii, 2);
			}
			else break;
		}
		if ( strlen (longname) > 0) {
			if ( entryname[0] == (char) 0xE5 ) longdel = 1;
			else longdel = 0;
			printf ("Long File Name Recovered: %s\n", longname);
			strcpy ( entryname, longname);
			strcpy ( newname, longname);
		}


		// Calculated First Cluster from Entry in Directory
		FirstCluster = (unsigned int) Entries[i].FirstCluster[0];
		FirstCluster = FirstCluster & 0x000000ff;
		FirstClusterHigh = (unsigned int) Entries[i].FirstCluster[1];
		FirstClusterHigh = FirstClusterHigh << 8;
		FirstClusterHigh = FirstClusterHigh & 0x0000ff00;
		FirstCluster = FirstClusterHigh | FirstCluster;
		//printf ("FirstClusterFinal: %x\n", FirstCluster );

		// Check if FirstCluster is a valid, else skip
		if ( FirstCluster > CountofClusters || FirstCluster < 2 ) continue;


		if (( (unsigned) Entries[i].Attr[0] & (unsigned) 0x10) ||
		    ( (unsigned) Entries[i].Attr[0] & (unsigned) 0x20) ) {

			// Print Directory Location
			strcpy(tempDir, "/");
			for ( i2 = 0; i2 < Dir_Cnt; i2++) {
				strcat (tempDir, Dir_List[i2]);
				strcat (tempDir, "/");
			}
			i3 = 0;
			bzero ( tempDir2, 400 );
			for ( i2 = 0; i2 < 400; i2++) {
				if ( tempDir[i2] != ' ' ) {
					 tempDir2[i3] = tempDir[i2];
					 i3++;
				}
			}
			strcpy ( tempDir4, tempDir2 );
			printf ("Location: %s\n", tempDir2);
			printf ("Entry %d Name: %s\n", i, entryname);
			printf ("FirstCluster: %d\n", FirstCluster );
		}

		// If entry was deleted
		if ( entryname[0] == (char) 0xE5 || longdel == 1 ) {

			// If it is a directory recreate
			if ( (unsigned) Entries[i].Attr[0] & (unsigned) 0x10) {
				// Create properly Directories
				strcpy (NewDir, "");
				strcat (NewDir, DestDir);
				strcat (NewDir, "/");
				for ( i2 = 0; i2 < Dir_Cnt; i2++) {
					strcat (NewDir, Dir_List[i2]);
					strcat (NewDir, "/");
					// Clean up empty spaces
					i3 = 0;
					bzero ( tempDir2, 400 );
					for ( i4 = 0; i4 < 400; i4++) {
						if ( NewDir[i4] != ' ' ) {
							tempDir2[i3] = NewDir[i4];
							i3++;
						}
					}
					mkdir ( tempDir2, S_IRWXU|S_IRWXG|S_IRWXO );
				}

				strcpy (DirPath, NewDir);
				strcat (NewDir, newname);
				i3 = 0;
				bzero ( tempDir2, 400 );
				for ( i4 = 0; i4 < 400; i4++) {
					if ( NewDir[i4] != ' ' ) {
						tempDir2[i3] = NewDir[i4];
						i3++;
					}
				}
				mkdir ( tempDir2, S_IRWXU|S_IRWXG|S_IRWXO );
				printf ( "Directory: %s. Recovered.\n\n", tempDir2 );
			}

			// For File enties
			if ( (unsigned) Entries[i].Attr[0] & (unsigned) 0x20) {


				// File Size (convert little endian to big endian first)
				filesize = (Entries[i].FileSize[3] << 24 & 0xff000000) | (Entries[i].FileSize[2] << 16 & 0xff0000) | (Entries[i].FileSize[1] << 8 & 0xff00) | (Entries[i].FileSize[0] & 0xff);

				// Create properly Directories
				strcpy ( NewDir, "");
				//printf ( "DestDir %s\n", DestDir);
				strcat ( NewDir, DestDir);
				strcat ( NewDir, "/");
				strcpy ( tempDir2, NewDir ); // In case we don't get into the loop
				for ( i2 = 0; i2 < Dir_Cnt; i2++) {
					strcat (NewDir, Dir_List[i2]);
					strcat (NewDir, "/");
					// Clean up empty spaces
					i3 = 0;
					bzero ( tempDir2, 400 );
					for ( i4 = 0; i4 < 400; i4++) {
						if ( NewDir[i4] != ' ' ) {
							tempDir2[i3] = NewDir[i4];
							i3++;
						}
					}
					printf ( "Directory Created: %s\n", tempDir2 );
					mkdir ( tempDir2, S_IRWXU|S_IRWXG|S_IRWXO );
				}
				printf ( "File: %s Recovered.\n", newname );
				printf ( "Size: %d\n", filesize );

				// Copy all non blank chars to NewFile
				i3 = 0;
				bzero ( NewFile, 400 );
				for ( i2 = 0; i2 < 400; i2++) {
					if ( tempDir2[i2] != ' ' ) {
						NewFile[i3] = tempDir2[i2];
						i3++;
					}
				}
				printf ( "New File created in dir: %s%s  \n\n", tempDir2, newname );
				RecoverFile ( newname, tempDir2, filesize, FirstCluster );
			}
		}

		// Look for data into the subdirectiores
		if (  ((unsigned) Entries[i].Attr[0] & (unsigned) 0x10 ) ) {

				if ( entryname[0] != (char) 0xE5 )
					strcpy ( Dir_List[Dir_Cnt], entryname );
				else
					strcpy ( Dir_List[Dir_Cnt], newname );

				Dir_Cnt++;
				printf ("\n");
				printf ("Search inside of: %s\n", Dir_List[Dir_Cnt-1] );
				for ( i5 = 0; i5 < BootDesc.SectorPerCluster; i5++ ) {
					ParseDirectory ( (( (FirstCluster - 2) * 4 ) + DataInitialSector) + i5 );
				}
				Dir_Cnt--;
				printf ( "Returned from: %s\n\n", Dir_List[Dir_Cnt] );
		}
	} // Done Checking Entries

	// Check if we need to search a next cluster from FAT
	if ( FirstCluster > 1 && FirstCluster < CountofClusters ) {

		NextClusterToRead = getClusterValue ( FirstCluster );
		if ( ( NextClusterToRead > 1 ) && ( NextClusterToRead != 0xffffffff) &&
			 ( NextClusterToRead < CountofClusters) ) {
			printf ( "Follow Clusters of Directory: %d\n\n", NextClusterToRead );
			ParseDirectory ( ((NextClusterToRead - 2) * 4 ) + DataInitialSector);
		}
	}

	return;
}


/*
	This function should create a new file and read all the clusters from the opened_image
	and start storing the information assuming that the file was stored consecutivly.
*/
void RecoverFile ( char filename[120], char dir[400], int filesize, unsigned int FirstCluster )
{
	int start_sector;
	char n_filename[120 + 400];
	char full_filename[120 + 400];
	char tempchar [120];
	int i, fid2;
	unsigned int cluster_used;
	char * ClusterData;

	unsigned int cluster_cp;
	int index;

	int temp1;
	int temp2;

	ClusterData = malloc(BytesPerCluster);

	if ( FirstCluster < 0 ) return;

	//get the logical sector that corresponds to the first sector of the cluster
	start_sector = (((FirstCluster - 2) * BootDesc.SectorPerCluster ) + DataInitialSector);
	//printf("read_sector: %i\n", read_sector);

	//temp1 contains the maximum number of sectors
	temp1 = BootDesc.NumOfLogSector +  BootDesc.SectorForBoot;
	//temp1 now holds the number of sectors left for file
	temp1 = temp1 - start_sector;
	//printf("temp1: %i\n",temp1);

	//temp2 has the number of sectors needed for the file
	temp2 = (filesize / BootDesc.BytePerSector);
	//printf("temp2: %i\n",temp2);

	if((temp1 < temp2))
	{
		if(AltFatFlag == 1)
		{
//			printf("if altfat doesnt work then %s filename won't have enough space\n", filename);
			outofbound = 1;
			//exit(0);
		}
		else
		{
//			printf("\n\nNot enough space for: %s first cluster is:               %i\n\n", filename, 			FirstCluster);
			free(ClusterData);
			close(fid2);
			return;
		}
	}

	//Create a file
	//FAT_value = getClusterValue ( FirstCluster );

	// Get Full File Name
	strcpy ( full_filename, dir );
	strcat ( full_filename, filename );

	// Check if a File Already Exists and behave properly if so
	if ( access ( full_filename, F_OK ) != 0 ) {
		fid2 = open ( full_filename, O_CREAT | O_RDWR, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP);
	}
	else {

		// Create file with new name
		for ( i=1;;i++) {

			// Create the naming for the files
			sprintf (tempchar, "%d", i);
			strcat  (tempchar, filename);
			strcpy  (n_filename, dir );
			strcat  (n_filename, tempchar );

			// Create the next file
			if ( access ( n_filename, F_OK ) != 0 ) {
				fid2 = open ( n_filename, O_CREAT | O_RDWR, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP);
				break;
			}
		}
	}


	//ZeroFlag = 1;
	//NoBadFlag = 1;

//	printf("\n\nTrying to recover file: %s with file size %i and First Cluster: %i\n", filename, filesize, FirstCluster);
//	printf("  outofbound = %i\n", outofbound);

	if(AltFatFlag == 1)
	{
		cluster_cp = FirstCluster;

		index = 0;
	//	printf("cluster value in altfat chain:");
		do
		{
			cluster_used = getClusterValue(cluster_cp);
		//	printf("cluster entry: %i has value: ", cluster_cp);
		//	printf(" %i\n", cluster_used);

			index++;

			cluster_cp = cluster_used;
		//while cluster_used is not terminating value or bad cluster value
		}while( cluster_used != 0 && cluster_used != 0xFF7 && cluster_used != 0xFF8 &&
		cluster_used != 0xFF9 && cluster_used != 0xFFA && cluster_used != 0xFFB && cluster_used != 0xFFC &&
		cluster_used != 0XFFD && cluster_used != 0XFFE && cluster_used != 0XFFF  && cluster_used != 0xFFF7 && 		cluster_used != 0xFFF8 && cluster_used != 0xFFF9 && cluster_used != 0xFFFA && cluster_used != 0xFFFB 		&& cluster_used != 0xFFFC && cluster_used != 0XFFFD && cluster_used != 0XFFFE && cluster_used != 		0XFFFF);
	//	printf("\n");

		//want to know how far the chain in the ALT Fat goes
		temp1 = index * BytesPerCluster;
		//printf("length of chain: %i    ", temp1);
		//get the difference between chain of clusters and filesize
		if(filesize <= temp1)
			temp2 = temp1 - filesize;
		else
			temp2 = filesize - temp1;

		//printf("difference between filesize and cluster chain: %i\n", temp2);



		//if the difference is less than BytesPerCluster, then go through the altfat chain
		if( temp2 <= BytesPerCluster)
		{
			//printf("using altFat for %s\n", filename);
			while(filesize > 0)
			{
				read_cluster( start_sector, ClusterData );

				//printf("read_sector: %i\n", read_sector);

				//if the file does not end within this cluster
				if ( filesize > BytesPerCluster )
				{
					write ( fid2, ClusterData, BytesPerCluster );

				}
				else
				{
					write ( fid2, ClusterData, filesize );
					//printf("bytes_read: %i\n", bytes_read);
					//printf("filesize: %i\n", filesize);

				}
				filesize = filesize - BytesPerCluster;
				//reading the clusters sequentially

				FirstCluster = getClusterValue(FirstCluster);

				start_sector = (((FirstCluster - 2) * BootDesc.SectorPerCluster ) + DataInitialSector);
			}
			//exit(0);
			//return;
		}
		else //assume sequential
		{
			if(outofbound == 1)
			{
				outofbound = 0;
   				free(ClusterData);
				close(fid2);
				//exit(0);
				return;
			}
			goto sequential;
		}

	}
	else
	{
		sequential:


		//printf("using sequential for %s\n", filename);
		while(filesize > 0)
		{
			//check to see if cluster is used
			cluster_used = getClusterValue(FirstCluster);
			//printf("FAT Cluster entry: %i", FirstCluster);
			//printf(" has value: %i\n", cluster_used);
			//printf("filesize is now: %i\n",filesize);
			//if cluster_used is not equal to zero then we know the cluster is being used


			if(cluster_used != 0 )
			{
				//printf("Filename %s has a used cluster -- ", filename);
				if(cluster_used == -9)
				{
					//printf("handling bad cluster\n");

					if(NoBadFlag == 1)//doesn't matter, read the bad sector anyway
					{
						//printf("now reading bad cluster\n");
						read_cluster( start_sector, ClusterData );
						//printf("read_sector: %i\n", read_sector);

						//if the file does not end within this cluster
						if ( filesize > BytesPerCluster )
						{
							write ( fid2, ClusterData, BytesPerCluster );

						}
						else
						{
							write ( fid2, ClusterData, filesize );
							//printf("bytes_read: %i\n", bytes_read);
							//printf("filesize: %i\n", filesize);

						}
						filesize = filesize - BytesPerCluster;
						//reading the clusters sequentially
						start_sector = (start_sector + BootDesc.SectorPerCluster);
						//increment the Cluster index into the FAT table
						FirstCluster++;
					}
					else //skip the bad sector
					{
						//printf("now skipping bad cluster\n");
						//decrement the filesize by the # of bytes in the used cluster
						//filesize = filesize - BytesPerCluster;

						//increment the seek position when we read the cluster
						start_sector = (start_sector + BootDesc.SectorPerCluster);

						//increment cluster entry into the FAT
						FirstCluster++;
					}

				}
				else if(ZeroFlag == 1 && SkipFlag == 0) //SkipFlag takes precedence
				{
					//printf("now zeroing good but used cluster\n");
					bzero( ClusterData, BytesPerCluster);

					if ( filesize > BytesPerCluster )
					{
						write ( fid2, ClusterData, BytesPerCluster );

					}
					else
					{
						write ( fid2, ClusterData, filesize );
						//printf("bytes_read: %i\n", bytes_read);
						//printf("filesize: %i\n", filesize);
					}

					//decrement the filesize by the # of bytes in the used cluster
					filesize = filesize - BytesPerCluster;

					//increment the seek position when we read the cluster
					start_sector = (start_sector + BootDesc.SectorPerCluster);

					//increment cluster entry into the FAT table
					FirstCluster++;
				}
				else //default to skip
				{	//printf("now skipping good but used cluster\n");
					//decrement the filesize by the # of bytes in the used cluster
					//filesize = filesize - BytesPerCluster;

					//increment the seek position when we read the cluster
					start_sector = (start_sector + BootDesc.SectorPerCluster);

					//increment cluster entry into the FAT
					FirstCluster++;
				}
			}
			else //cluster not used
			{

				read_cluster( start_sector, ClusterData );

				//printf("start_sector: %i\n", start_sector);

				//if the file does not end within this cluster
				if ( filesize > BytesPerCluster )
				{
					write ( fid2, ClusterData, BytesPerCluster );

				}
				else
				{
					write ( fid2, ClusterData, filesize );
					//printf("bytes_read: %i\n", bytes_read);
					//printf("filesize: %i\n", filesize);

				}
				filesize = filesize - BytesPerCluster;
				//reading the clusters sequentially
				start_sector = (start_sector + BootDesc.SectorPerCluster);
				//increment the Cluster index into the FAT table
				FirstCluster++;

			}
		}
	}

	outofbound = 0;
	free(ClusterData);
	close(fid2);
	//exit(0);
	return;

}



int read_cluster ( int sector_offset, char * buffer )
{
	int offset, length;

	// Move to selected possition in the file
	offset = lseek ( fid, sector_offset * BYTES_PER_SECTOR, SEEK_SET );

	if ( offset != sector_offset * BYTES_PER_SECTOR ) {
		printf("Error: lseek failure.\n");
		exit(0);
		return -1;
	}

	// Read one sector into buffer
	length = read (fid, buffer, BytesPerCluster);

	if ( length != BytesPerCluster )
	{
		printf("Error: file read failure.\n");
		exit(0);
		return -1;
	}

	return length;
}











/*
	This fucntion read a stream of bytes from a sector
	start pointer into buffer.
*/
int read_sector ( int sector_offset, char * buffer )
{
	int offset, length;

	if ( sector_offset > BootDesc.NumOfLogSector )
		return -1;

	// Move to selected possition in the file
	offset = lseek ( fid, sector_offset * BYTES_PER_SECTOR, SEEK_SET );

	if ( offset != sector_offset * BYTES_PER_SECTOR ) {
		printf("Error: lseek failure.\n");
		exit(0);
	}

	// Read one sector into buffer
	length = read (fid, buffer, BYTES_PER_SECTOR);

	if ( length != BYTES_PER_SECTOR )
	{
		printf("Error: file read failure.\n");
		printf("Error: lenght = %d\n", length );
		printf("Error: offset = %d\n", offset );
	}

	return length;
}



void FATtype( )
{
	int DataSec = 0;

	DataSec = ( ( BootDesc.NumOfLogSector) - (  BootDesc.NumOfHidSector + ( BootDesc.NumOfFat * BootDesc.SectorPerFat ) +( (			BootDesc.BPB_RootEntCnt * 32) / BootDesc.BytePerSector) ) );

	//printf("DataSec: %d\n", DataSec);

	//number of cluster in the volume
	CountofClusters = ( DataSec / BootDesc.SectorPerCluster );

	//printf("CountofClusters: %d\n", CountofClusters);

	if( CountofClusters < 4085)
	{
		//Volume is FAT12
		FAT12Flag = 1;
	}
	else
	{
		//Volume is FAT16
		FAT12Flag = 0;
	}
	//printf("FAT12flag: %d\n", FAT12Flag);

	return;

}





unsigned int getClusterValue ( unsigned int NumCluster )
{
	char*  FatData;
	char uv, wx, yz;
	unsigned int RetValue = 0;
	int FATsectoroffset;
	int buffersize;

	unsigned int temp = 0;



	int i;
	float float_i;

	uv = 0;
	wx = 0;
	yz = 0;

	//int temp;

	if(NumCluster > CountofClusters)
	{
		printf("Error: cluster %u is out of bound\n", NumCluster);
		exit(0);
		return -1;
	}

	if( AltFatFlag == 1)
	{
		//read the secondary FAT
		//calculate sector of secondary FAT
		FATsectoroffset = BootDesc.SectorForBoot + BootDesc.SectorPerFat; //skip the first FAT
	}
	else
	{
		//read the first FAT
		FATsectoroffset = BootDesc.SectorForBoot;
	}

	//calculate the buffer that will hold all of the entries in the FAT
	buffersize = BootDesc.SectorPerFat * 512;

	//allocate memory for FAT
	FatData = malloc( buffersize );

	//read the entire FAT
	lseek ( fid, FATsectoroffset * BYTES_PER_SECTOR, SEEK_SET );

	read (fid, FatData, buffersize);

	if(FAT12Flag == 1) //this is a FAT12
	{

		//Index of where the Cluster is stored in FAT
		//printf("NumCluster: %i \n", NumCluster);

		float_i = NumCluster * 1.5;

		//printf("floating: %f\n", float_i);

		i = (int) float_i;
		//printf("i = %i\n", i);


		if ( (NumCluster % 2) == 0 ) {	// We are using the first byte and second half

			wx = (char) FatData[i+1];		//wx is second by
			//printf("wx: %c\n", wx);
			wx = wx & 0x0F; 			//Mask out w, so know we have _x
			uv = (char) FatData[i];
			//printf("uv: %c\n", uv);
			RetValue = (unsigned int) wx;		//RetValue = __,__,__,_x
			RetValue = RetValue << 8;		//RetValue = __,__,_x,__
			temp = (unsigned int) uv;
			temp = temp & 0x000000FF;
			RetValue = RetValue |  temp;		//RetValue = __,__,_x,uv
			RetValue = RetValue & 0x00000FFF;
			free( FatData );
			return RetValue;
		}
		else  {
			yz = (char) FatData[i+1];
			//printf("yz: %u\n", (unsigned int) yz);
			wx = (char) FatData[i];
			//printf("wx: %u\n", (unsigned int) wx);
			wx = (wx >> 4);					//wx = _w
			//printf("wx(>>4): %u\n", (unsigned int) wx);
			wx = (wx & 0x0F);
			//printf("wx(&0x0F): %u\n", (unsigned int) wx);
			RetValue = (unsigned int) yz;			//RetValue = __,__,__,yz
			//printf("RetValue(yz): %i\n", RetValue);
			RetValue = (RetValue << 4);			//RetValue = __,__,_y,z_
			//printf("RetValue(<<4): %i\n", RetValue);
			RetValue = RetValue & 0x00000FF0;
			RetValue = (RetValue | (unsigned int) wx);	//RetValue = __,__,_y,zw
			//printf("unsigned %u\n", RetValue);
			RetValue = RetValue & 0x00000FFF;
			free( FatData );
			return RetValue;
	}

	}
	else //this is a FAT16 (it works 100%)
	{
		i = ( NumCluster * 2);
		//printf("The bye offset is: %i\n", i);
		//yz contains the most significant byte
		yz = (char) FatData[i+1];
		//printf("(most sig) yz: %c\n", yz);
		//wx contains the least significant byte
		wx = (char) FatData[i];
		//printf("(least sig)wx: %c\n", wx);
		RetValue = ((unsigned int) yz) << 8;
		RetValue = RetValue & 0x0000FF00;
		temp = (unsigned int) wx;
		temp = temp & 0x000000FF;
		RetValue = RetValue | temp;
		free( FatData );
		return RetValue;
	}
}















int GetBootData (  )
{
	int i;
	char bootInfo [ BYTES_PER_SECTOR ];

	// Read Data
	read_sector ( 0, bootInfo );

	i = (( bootInfo[0x0c] & 0xff) << 8)|( bootInfo[0x0b] & 0xff);
	BootDesc.BytePerSector = (int) i;
	BytesPerSector = (int) i;
	if ( (( BytesPerSector % 512 ) != 0 ) || ( BytesPerSector < 0 ) ) {
		printf ( "Sector Size appears to be corrupted.\n");
		printf ( "Using default value of 512.\n");
		BytesPerSector = 512;
	}

	BootDesc.SectorPerCluster = bootInfo[0x0d];
	if ( BootDesc.SectorPerCluster < 0 ) {
		printf ( "Sectors per clusters appears to be corrupted.\n");
		printf ( "Using default value of 1.\n");
		BootDesc.SectorPerCluster = 1;
	}

	i = (( bootInfo[0x0f] & 0xff) << 8)|( bootInfo[0x0e]);
	BootDesc.SectorForBoot = (int)i;

	BootDesc.NumOfFat = (int) bootInfo[0x10];

	i = (( bootInfo[0x12] & 0xff) << 8)|( bootInfo[0x11] & 0xff);
	BootDesc.BPB_RootEntCnt = (int) i;

	i = (( bootInfo[0x14] & 0xff) << 8)|( bootInfo[0x13] & 0xff);
	BootDesc.NumOfLogSector = (int) i;

	BootDesc.MedDesByte =  bootInfo[0x15];
	BootDesc.MedDesByte = BootDesc.MedDesByte & 0xff;

	i = (( bootInfo[0x17] & 0xff) << 8)|( bootInfo[0x16] & 0xff);
	BootDesc.SectorPerFat = (int) i;

	i = (( bootInfo[0x19] & 0xff) << 8)|( bootInfo[0x18] & 0xff);
	BootDesc.SectorPerTrack = (int)i;

	i = (( bootInfo[0x1b] & 0xff) << 8)|( bootInfo[0x1a] & 0xff);
	BootDesc.NumOfSurface = (int)i;

	i = (( bootInfo[0x1d] & 0xff) << 8)|( bootInfo[0x1c] & 0xff);
	BootDesc.NumOfHidSector = (int) i;

	return 0;
}


void DisplayBootData ( )
{
	printf ("\n");
	printf ("Geometry of FAT File System:\n");
	printf ("============================\n");
	printf ("Bytes per sector:	%d\n", BootDesc.BytePerSector);
	printf ("Sectors Per Cluster:	%d\n", BootDesc.SectorPerCluster);
	printf ("Reserved Sectors:	%d\n", BootDesc.SectorForBoot);
	printf ("Copies of the FAT:	%d\n", BootDesc.NumOfFat);
	printf ("Entries in Root Directory:	%d\n", BootDesc.BPB_RootEntCnt);
	printf ("Logical Sectors:	%d\n", BootDesc.NumOfLogSector);
	printf ("Medium Descriptor Byte:	%x\n", BootDesc.MedDesByte);
	printf ("Sectors per FAT:	%d\n", BootDesc.SectorPerFat);
	printf ("Sectors per Track:	%d\n", BootDesc.SectorPerTrack);
	printf ("Sides:	%d\n", BootDesc.NumOfSurface);
	printf ("Hide Sectors:	%d\n", BootDesc.NumOfHidSector);
	printf ("\n\n");
}



void CommandLineArgs ( int argc, char **argv )
{
	int i,j;
	char tempchar[120];
	char tempDir[400];

	//Reset Value by Default
	strcpy ( FileImg, "");
	strcpy ( DestDir, "");

	// Skip argv[0] (program name)
	for (i = 1; i < argc; i++)
	{
		// Check for Regular Flags
		if (strcmp(argv[i], "--skip")   == 0) SkipFlag   = 1;
		if (strcmp(argv[i], "--zero")   == 0) ZeroFlag   = 1;
		if (strcmp(argv[i], "--altfat") == 0) AltFatFlag = 1;
		if (strcmp(argv[i], "--nobad")  == 0) NoBadFlag  = 1;

		// Check for Destinantion dir
		if (strcmp(argv[i], "-d")  == 0) {
			//Copy next argument
			strcpy ( DestDir, argv [ i + 1 ] );
			i++; // Increment argument to skip check for DestDir
		}
	}

	// Store last argument as image to read
	if ( argc > 1 ) strcpy ( FileImg, argv [ argc -1 ] );
	else {
		printf ("Error: File Image not specified.\n");
		exit(0);
	}


	// Forcing no arguments --delete when program is complete
	//strcpy ( FileImg, "deleted.img");

	// Set Default Directory
	//strcpy ( DestDir, "Recovered");

	// Create the directory to store recovered entries
	if (strcmp(DestDir, "") != 0) {
		if ( mkdir ( DestDir, S_IRWXU|S_IRWXG|S_IRWXO ) == -1 ) {
			for ( j=1;;j++) {
				// Create the naming for the n_dirs recovered
				sprintf (tempchar, "%d", j);
				strcat  (tempchar, "_");
				strcat  (tempchar, DestDir);
				strcpy  (tempDir, tempchar);
				// Create the next file
				if ( mkdir ( tempDir, S_IRWXU|S_IRWXG|S_IRWXO ) == 0 ) {
					strcpy ( DestDir, tempDir );
					break;
				}
			}
		}
	}
	else {
		printf ("Destination Directory not specified.\n");
		getcwd ( DestDir, sizeof (DestDir) );
		printf ("Ussing Current Working Directory: %s\n", DestDir);
	}

	return;
}
