/*
	Author: R. Javier Vega
	SID: 003-110-717
	CS118 UCLA Fall 2003

	FTWI DEAMON
*/

#include "data_struct.h"
#include <unistd.h> /* close() */
#include <string.h> /* memset() */

#define LOCAL_SERVER_PORT 12175


int main(int argc, char *argv[]) {
  
  int sd, rc, n, cliLen, done, i, dsize, seq_number, file_created, dropped;
  int test_flag, n_send_packets, i2;
  FILE *f, *f2;
  fd_set rfd;
  fd_set c_rfd;  
  char filename[200];
  unsigned short CRC;
  struct sockaddr_in cliAddr, servAddr;
  struct timeval tv;
  struct DataAck Ack;
  struct FileData FData, FDataBuffer[5], testFEC;  

  test_flag = FALSE;
  if ( argc == 2 ) {
        if ( strcmp(argv[1], "-t") == 0) {
          printf ("*********** Test mode enabled ************\n");
          test_flag = TRUE;
        }
        else {
         printf ("usage: %s -t \n", argv[0]);
         exit(1);
        }
  }     


  /* socket creation */
  sd=socket(AF_INET, SOCK_DGRAM, 0);
  if(sd<0) {
    printf("%s: cannot open socket \n",argv[0]);
    exit(1);
  }

  /* bind local server port */
  servAddr.sin_family = AF_INET;
  servAddr.sin_addr.s_addr = htonl(INADDR_ANY);
  servAddr.sin_port = htons(LOCAL_SERVER_PORT);
  rc = bind (sd, (struct sockaddr *) &servAddr,sizeof(servAddr));
  if(rc<0) {
    printf("%s: cannot bind port number %d \n", 
	   argv[0], LOCAL_SERVER_PORT);
    exit(1);
  }

  cliLen = sizeof(cliAddr);
  
  printf("FTWID started\n");
  printf("Ready for transmition on port UDP %d\n" ,LOCAL_SERVER_PORT);

  /* start receiving data process */

  /* calculate size of file descriptors table */  
  dsize = getdtablesize();

  done = FALSE;

  tv.tv_sec = 0;
  tv.tv_usec = 80000;  	


  seq_number = 1; /* start sequence number */
  file_created = FALSE;
  bzero( &Ack, sizeof(Ack) );

  while ( !(done) ) {

	Ack.seq_n = seq_number;

	#ifdef DEBUG_MODE
	  printf ("Waiting for packets in sequence %d\n", seq_number);
	#endif

	  /* receive all packets */
	  /* test flag case */
	  if ( test_flag ) n_send_packets = 4;
	  else n_send_packets = 5; /* to include the FEC */
	  
	  for ( i = 0; i < n_send_packets; i++ ) 
	  {

	     /* read the data in the socket */
             n = recvfrom ( sd, (char *) &FData, sizeof(FData), 0, (struct sockaddr *) &cliAddr, &cliLen);

	     #ifdef DEBUG_MODE
	     //  printf("Packet number %d, seq %d received\n", FData.packet_n, FData.seq_n);
	     #endif
	

	     #ifdef SHOW_DATA_TRANS
	       printf("\n\n%s\n\n",FData.data);
	     #endif

	     /* Checking for drooped packets */
	     if ( !(test_flag) )
	     if ( drop() == 0 ) {
		#ifdef DEBUG_MODE
		  printf ("\nPacket %d, sequence %d drooped by drop\n\n", FData.packet_n, FData.seq_n);
		#endif 
		continue;
	     }

             if ( n < 0 ) {
              printf ("Fail to receive data file\n");
              exit(1);
             }

	     /* wait for next data packet or timeout */         
	     if ( !(test_flag) ) 
	     {
  		FD_ZERO(&rfd);
  		FD_SET(sd, &rfd);
  		c_rfd = rfd;	     	
                rc = select ( dsize, &c_rfd, NULL, NULL, &tv );

	       /* if time out */
	       if ( rc == 0 ) {
	  	  #ifdef DEBUG_MODE
		    printf ( "Packet number %d, seq %d timed out, skiped\n", i, seq_number);
		  #endif

		  continue; /* skip that packet */
	       }

	       #ifdef DEBUG_MODE
	         printf("Processing packet %d, seq %d\n", FData.packet_n, FData.seq_n);
	       #endif

	     } /* after obtaining the data */	     
	       
	       /* process the data */
	       /* First check for CRC error */
	       /* in case of error, skip packet */
	       
	       /* */
	       if ( !(test_flag) ) {
		  CRC = doCRC ( (char *) &FData, sizeof(FData) - sizeof(FData.CRC) );
		  if ( CRC != FData.CRC ) {
		  	
		    #ifdef DEBUG_MODE
		      printf ("CRC ERROR.\n\n");
		    #endif
		    
		    continue; 	
		  }
		}
		/* */

	       /* ignore sequence number */
	       if (test_flag) FData.seq_n = seq_number; 

	       /* if the sequence number is correct */
	       if ( FData.seq_n == seq_number ) {
	         /* copy the data into the right buffer */
	         memcpy ( FDataBuffer[FData.packet_n].p_type, FData.p_type, sizeof(FData.p_type) );
	         memcpy ( FDataBuffer[FData.packet_n].filename, FData.filename, sizeof(FData.filename) );
	         memcpy ( FDataBuffer[FData.packet_n].data, FData.data, sizeof(FData.data) );
	         FDataBuffer[FData.packet_n].file_size = FData.file_size;
                 FDataBuffer[FData.packet_n].file_mode = FData.file_mode;
                 FDataBuffer[FData.packet_n].seq_n     = FData.seq_n;
                 FDataBuffer[FData.packet_n].packet_n  = FData.packet_n;
                 FDataBuffer[FData.packet_n].data_size = FData.data_size;
                 FDataBuffer[FData.packet_n].eof       = FData.eof;

	         /* Update Ack Packet */
	         if ( FData.packet_n == 0 ) Ack.pck1 = TRUE;
                 if ( FData.packet_n == 1 ) Ack.pck2 = TRUE;
                 if ( FData.packet_n == 2 ) Ack.pck3 = TRUE;
                 if ( FData.packet_n == 3 ) Ack.pck4 = TRUE;
                 if ( FData.packet_n == 4 ) Ack.fet  = TRUE;                 
	        }
	  } /* for each Data packet */
 
	  /* after all packets have been sucessfully received or timed out */
	  /* FET */

	  /* RE-Create Packet 0 if needed */

	  if ( !(test_flag ) ){
	    if ( !Ack.pck1 && Ack.pck2 && Ack.pck3 && Ack.pck4 && Ack.fet ) {

		doFEC ( (char *) &FDataBuffer[1], (char *) &FDataBuffer[2], (char *) &FDataBuffer[0], sizeof(FDataBuffer[0]) );
                doFEC ( (char *) &FDataBuffer[3], (char *) &FDataBuffer[0], (char *) &FDataBuffer[0], sizeof(FDataBuffer[0]) );
                doFEC ( (char *) &FDataBuffer[4], (char *) &FDataBuffer[0], (char *) &FDataBuffer[0], sizeof(FDataBuffer[0]) );

		FDataBuffer[0].seq_n = seq_number;
		FDataBuffer[0].packet_n = 0;
		Ack.pck1 = TRUE;

		#ifdef DEBUG_MODE
		  printf ( "\n******* Recreating packet 1, seq %d from FEC\n", seq_number );
		#endif

		#ifdef SHOW_DATA_TRANS
		  printf ("\n\n%s\n\n", FDataBuffer[0].data);
		#endif
	    }
            if ( Ack.pck1 && !Ack.pck2 && Ack.pck3 && Ack.pck4 && Ack.fet ) {
 
                doFEC ( (char *) &FDataBuffer[0], (char *) &FDataBuffer[2], (char *) &FDataBuffer[1], sizeof(FDataBuffer[0]) );
                doFEC ( (char *) &FDataBuffer[3], (char *) &FDataBuffer[1], (char *) &FDataBuffer[1], sizeof(FDataBuffer[0]) );
                doFEC ( (char *) &FDataBuffer[4], (char *) &FDataBuffer[1], (char *) &FDataBuffer[1], sizeof(FDataBuffer[0]) );
 
                FDataBuffer[1].seq_n = seq_number;
                FDataBuffer[1].packet_n = 1;
		Ack.pck2 = TRUE;             
                
		#ifdef SHOW_DATA_TRANS
		  printf ("\n\n%s\n\n", FDataBuffer[1].data);
		#endif                
	    }          
            if ( Ack.pck1 && Ack.pck2 && !Ack.pck3 && Ack.pck4 && Ack.fet ) {
                
                doFEC ( (char *) &FDataBuffer[0], (char *) &FDataBuffer[1], (char *) &FDataBuffer[2], sizeof(FDataBuffer[2]) );
                doFEC ( (char *) &FDataBuffer[3], (char *) &FDataBuffer[2], (char *) &FDataBuffer[2], sizeof(FDataBuffer[2]) );
                doFEC ( (char *) &FDataBuffer[4], (char *) &FDataBuffer[2], (char *) &FDataBuffer[2], sizeof(FDataBuffer[2]) );
                 
                FDataBuffer[2].seq_n = seq_number;
                FDataBuffer[2].packet_n = 2;
		Ack.pck3 = TRUE;

                #ifdef DEBUG_MODE
                  printf ( "\n******* Recreating packet 3, seq %d from FEC\n", seq_number );
                #endif
             
                #ifdef SHOW_DATA_TRANS
                  printf ("\n\n%s\n\n", FDataBuffer[2].data);
                #endif
            }      
            if ( Ack.pck1 && Ack.pck2 && Ack.pck3 && !Ack.pck4 && Ack.fet ) {
                
                doFEC ( (char *) &FDataBuffer[0], (char *) &FDataBuffer[1], (char *) &FDataBuffer[3], sizeof(FDataBuffer[3]) );
                doFEC ( (char *) &FDataBuffer[2], (char *) &FDataBuffer[3], (char *) &FDataBuffer[3], sizeof(FDataBuffer[3]) );
                doFEC ( (char *) &FDataBuffer[4], (char *) &FDataBuffer[3], (char *) &FDataBuffer[3], sizeof(FDataBuffer[3]) );
                 
                FDataBuffer[3].seq_n = seq_number;
                FDataBuffer[3].packet_n = 3;
		Ack.pck4 = TRUE;

                #ifdef DEBUG_MODE
                  printf ( "\n******* Recreating packet 4, seq %d from FEC\n", seq_number );
                #endif
             
                #ifdef SHOW_DATA_TRANS
                  printf ("\n\n%s\n\n", FDataBuffer[3].data);
                #endif
            }
	  }      
	  /* END FET */

	  /* send ack for what needs to be re-transmitted that can not be recovered or has problems */
	  strcpy ( Ack.p_type, P_TYPE_ACK );
	  if ( Ack.pck1 && Ack.pck2 && Ack.pck3 && Ack.pck4 ) {
		#ifdef DEBUG_MODE
		  printf ("All packets have been ack\n");
		#endif
		Ack.seq_n = seq_number++;
	  }
	   else {
	     Ack.seq_n = seq_number -1;
	   }

	   /* if test flag ignore Acks */
	   if ( !(test_flag) )
	   n = sendto(sd, (char *) &Ack, sizeof(Ack), 0, (struct sockaddr *) &cliAddr, sizeof(cliAddr));

	   #ifdef DEBUG_MODE
	     printf ("Send Ack seq: %d\n", Ack.seq_n);	  
	   #endif


	   if ( test_flag ) {
	     Ack.pck1 = 1;
	     Ack.pck2 = 1;
	     Ack.pck3 = 1;
	     Ack.pck4 = 1;
	   }

	   /* in case all packets are fine */
	   if ( Ack.pck1 && Ack.pck2 && Ack.pck3 && Ack.pck4 ) {

		/* create file if needed */
		if ( !file_created ) {

		  /* print received message */
		  printf ("Transmition started from %s : UDP %u\n", inet_ntoa(cliAddr.sin_addr), ntohs(cliAddr.sin_port));
		  printf ("File name: %s\n", FDataBuffer[0].filename);
		  printf ("File size: %d\n", FDataBuffer[0].file_size);
		  printf ("Connection stablished.\n");

		  strcpy ( filename, FDataBuffer[0].filename );
		  strcat ( filename, ".sent");
		  f = fopen ( filename, "w" );
		  chmod ( filename, FDataBuffer[0].file_mode );
		  file_created = TRUE;
		}

		/* write buffers to file */
		for ( i = 0; i < 4; i++ ) {
		  for ( i2 = 0; i2 < 5; i2++ ) {
		   if ( FDataBuffer[i2].packet_n == i ) {
                      if ( fwrite( &FDataBuffer[i2].data, 1, FDataBuffer[i2].data_size, f ) < 0 ) {
                        printf ("Failed to write to file \n");
                        fclose(f);
                      }
		      if (FDataBuffer[i2].eof == 1)  done = 1;
		      break;    
		   }
		  }
    		}

	     bzero( &Ack, sizeof(Ack) );
	   } /* if all files are fine */
  }
    
  printf ("\nFile Transmission done.\n");

  fclose(f);

  return 0;

}



