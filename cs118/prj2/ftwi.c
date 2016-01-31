/*
	Author: R. Javier Vega	
	SID: 003-110-717
	UCLA CS118 Fall 2003

	FTWI CLIENT


ChangeLog:


	* 11-28-2003
	Changed client port to 0, so system can work with
	local network.

*/

#include "data_struct.h"
#include <string.h> 
#include <sys/time.h>  
#include <sys/stat.h>


int main(int argc, char *argv[]) {
  
  int sd, rc, i, servLen, cliLen, n, done, dsize, count, seq_number;
  int test_flag, n_send_packets;
  unsigned short CRC;
  FILE *f, *f2;
  fd_set rfd;
  fd_set c_rfd;
  struct timeval tv;
  struct stat filestat;
  struct sockaddr_in cliAddr, remoteServAddr;
  struct hostent *h;
  struct DataAck Ack;
  struct FileData packets[5], testFEC;


  /* check command line args */
  if( argc < 3 ) {
    printf("usage : %s <filename> <servername> -t (optinal) \n", argv[0]);
    exit(1);
  }

  test_flag = FALSE;
  if ( argc == 4 ) {
	if ( strcmp(argv[3], "-t") == 0) {
	  printf ("*********** Test mode enabled ************\n");
	  test_flag = TRUE;
	}
	else {
	 printf ("usage: %s <filename> <servername> -t \n", argv[0]);
	 exit(1);
	}
  }

  /* get server IP address (no check if input is IP address or DNS name) */
  h = gethostbyname(argv[2]);
  if( h == NULL ) {
    printf("%s: unknown host '%s' \n", argv[0], argv[2]);
    exit(1);
  }


  /* open file for reading */
  f = fopen(argv[1], "r");
  if ( f == NULL ) {
    printf("%s: invalid file '%s' \n", argv[0], argv[1]);
    exit(1);
  }


  // Start UDP Setup
  remoteServAddr.sin_family = h->h_addrtype;
  memcpy((char *) &remoteServAddr.sin_addr.s_addr, h->h_addr_list[0], h->h_length);
  remoteServAddr.sin_port = htons(PORT);
  /* socket creation */
  sd = socket(AF_INET,SOCK_DGRAM,0);
  if( sd < 0 ) {
    printf("%s: cannot open socket \n",argv[0]);
    exit(1);
  }
  /* bind client */
  cliAddr.sin_family = AF_INET;
  cliAddr.sin_addr.s_addr = htonl(INADDR_ANY);
  cliAddr.sin_port = htons(0);
  rc = bind(sd, (struct sockaddr *) &cliAddr, sizeof(cliAddr));
  if ( rc < 0 ) {
    printf("%s: cannot bind port\n", argv[0]);
    exit(1);
  }
  // 

  // Read file stats
  if ( stat( argv[1], &filestat ) < 0 ) {
    printf ("Can't stat file '%s'", argv[1]);
    exit(1) ;
  }

  //Output information
  printf ("Starting FTWI:\n");
  printf ("Sending file '%s' to '%s'\n", argv[1] ,h->h_name);
 
  /* calculate size of file descriptors table */
  dsize = getdtablesize();

  #ifdef DEBUG_MODE
  printf ("Starting file transmission:\n");
  #endif

  /* Starting Data Transmittion */
  seq_number = 1; /* needs to start with 1 so it sends the first bytes read from the file stream */
  bzero ( &Ack, sizeof(Ack) ); /* flush structure */
  tv.tv_sec = 0; /* change to 0 after debbugging */
  tv.tv_usec = 10000; 

  /* process the entire file */
  while ( !feof(f) ) {

	for ( i = 0; i < 4; i++ ) {
          n = fread ( (char *) &packets[i].data , 1, DATA_SIZE, f );
          strcpy(packets[i].p_type, P_TYPE_DATA);
	  strcpy(packets[i].filename, argv[1]);
	  packets[i].file_mode = filestat.st_mode;
	  packets[i].file_size = filestat.st_size;
          packets[i].data_size = n;
          packets[i].packet_n = i;
          packets[i].seq_n = seq_number;
          if ( feof(f) ) { 
	    packets[i].eof = 1; 
	  } 
	   else packets[i].eof = 0;

	  if ( !test_flag ) {	   
	    /* do CRC check */
	    /* */
	    packets[i].CRC = 0;
	    CRC = doCRC ( (char *) &packets[i], sizeof(packets[i]) - sizeof(packets[i].CRC) );
	    packets[i].CRC = CRC;
	    /* */
	    /* call mangle to scramble the data */
	    mangle( (void *) &packets[i], sizeof(packets[i])-sizeof(packets[i].CRC) );
	    #ifdef DEBUG_MODE
	    //printf("CRC calculated: %d\n", packets[i].CRC);
	    //doCRC ( (char *) &packets[i], sizeof(packets[i]));
	    #endif
	  }
	} /* for */
	
	
	/* After reading the packets create the pFET */
	/* XOR the 4 previus packets and store them into the 5th one */
	if ( !(test_flag) ) {
          doFEC ( (char *) &packets[0], (char *) &packets[1], (char *) &packets[4], sizeof(packets[4])); 
          doFEC ( (char *) &packets[2], (char *) &packets[4], (char *) &packets[4], sizeof(packets[4]));
          doFEC ( (char *) &packets[3], (char *) &packets[4], (char *) &packets[4], sizeof(packets[4]));

	  /* Hard Code the packet number to recognize it as a FEC */
	  packets[4].packet_n = 4;
	  packets[4].seq_n    = seq_number;
	  
	  /*
	  packets[4].CRC = 0;
	  CRC = doCRC ( (char *) &packets[4], sizeof(packets[4]));
	  packets[4].CRC = CRC;
	  */
	   /* call mangle to scramble the data */
	  //mangle( (void *) &packets[4], sizeof(packets[4])-2 );
	  #ifdef DEBUG_MODE
	    //printf("CRC calculated: %d\n", packets[i].CRC);
	    //doCRC ( (char *) &packets[i], sizeof(packets[i]));
	  #endif
	}
	/* */

	/* Test that works */
	/*
          doFEC ( (char *) &packets[0], (char *) &packets[2], (char *) &testFEC, sizeof(packets[1])); 
          doFEC ( (char *) &packets[3], (char *) &testFEC, (char *) &testFEC, sizeof(packets[1]));
          doFEC ( (char *) &packets[4], (char *) &testFEC, (char *) &testFEC, sizeof(packets[1]));
	  printf("This is the data recontructed:\n\n%s\n\n\n\n", testFEC.data);
	  printf("This is the data to be compared:\n\n%s\n\n",   packets[1].data);
	*/
	
	/* while the packet has not been completly acknowledge */

	/* if test flag enabled loop for ever */ 
	if ( test_flag ) { 
		seq_number = 1; 
		Ack.seq_n  = 0; 
	}

	while ( seq_number > Ack.seq_n ) {
		
	  /* send the packets packets */
	  
	  /* in flang send 5 packets  */
	  if (test_flag) 
	    n_send_packets = 4;
	  else 
	    n_send_packets = 5;
	  /* send the four packets */
	  
	  for ( i = 0; i < n_send_packets; i++ ) {

	    /* if test_flag disbled, send only selected packets */
	    if ( !(test_flag) ) {
	      if ( Ack.pck1 && (i == 0)) continue;
              if ( Ack.pck2 && (i == 1)) continue;
              if ( Ack.pck3 && (i == 2)) continue;
              if ( Ack.pck4 && (i == 3)) continue;
	    }

	    rc = sendto ( sd, (char *) &packets[i], sizeof(packets[i]), 0, (struct sockaddr *) &remoteServAddr, sizeof(remoteServAddr));

	    #ifdef SHOW_DATA_TRANS
	      printf("\n\n%s\n\n", packets[i].data);
	    #endif

	    #ifdef DEBUG_MODE
	      printf("Sending seq %d, packet %d\n", packets[i].seq_n,packets[i].packet_n);
	    #endif	

	  }

	  /* wait for acknoledge */
          FD_ZERO(&rfd);
          FD_SET(sd, &rfd);
          c_rfd = rfd;

	  if ( !(test_flag) ) {
            rc = select(dsize, &c_rfd, NULL, NULL, &tv);

            if ( rc < 0 ) {
              printf ("select() error\n");
              exit(1);
            }  

            /* if timeout retransmit packet */
            if (rc == 0) {
		  #ifdef DEBUG_MODE
		   printf ("\nAck Timeout, retransmiting\n");
		  #endif
		 continue;
	    }

            /* in case that there is data on the socket */
            if ( rc > 0 ) {
              rc = recvfrom ( sd, (char *) &Ack, sizeof(Ack), 0, (struct sockaddr *) &remoteServAddr, &servLen);

	      #ifdef DEBUG_MODE
	        printf ("\nReceived Ack for seq %d, p1 %d, p2 %d, p3 %d, p4 %d\n", Ack.seq_n, Ack.pck1, Ack.pck2, Ack.pck3, Ack.pck4);
	      #endif

              if ( rc < 0 ) {
                printf("%s: cannot send data to start transmition %d \n",argv[0],i-1);
                close(sd);
                exit(1);
              } 

	      if ( (strcmp ( Ack.p_type,  P_TYPE_ACK)) != 0 ) continue;  //incorrect packet type received
	    
	      /* else check if packets need to be retransmited */
	      if ( Ack.pck1 && Ack.pck2 && Ack.pck3 && Ack.pck4 ) {

		 #ifdef DEBUG_MODE
		   printf ("Ack for sequence %d completed\n", Ack.seq_n);
		 #endif

		 break;
	      }
	    }
	  } /* test flag */
	  /* end after sending the 4 packets */
	  if ( test_flag ) break; 
      } /* seq while */

      seq_number++;			// increase sequence number
      bzero( &Ack, sizeof(Ack) );	// clear Acknoledge packet

  } /* eof while */

  printf ("\nFile Transmission done.\n");

  fclose(f); 
  
  return 0;

}


