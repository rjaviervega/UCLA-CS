/*

This program is a server for the unix commands:

ps
df 
finger
uptime

It executes those commands and then it sends the results
trough a unix socket connection. The program uses standard
unix socket programming and the application protocol set
for the project by the class specifications.

The construction of the project is not very complex. First,
a command is obtain from the client which can be of the type
REQUEST X Params and a program is executed outputting its 
results to a temporary file. After that, the file is complete 
read to a small buffer which is sent back to the client in 
response to the request.
 
The program forks itself to support simultanius connections
and uses the PID to create the temporary file. If an error
is encoutered, the server responds with a 0 command.


Author: R. Javier Vega
SID: 003-110-717
CS118 UCLA Fall 2003

*/


#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>


// Send data to client
void SocketResponse ( int sock );

// Print error and exit
void error (char *msg);


int main()
{
	int sockfd, newsockfd, portno, clilen, pid;
	char buffer[256];
	struct sockaddr_in serv_addr, cli_addr;

	// Create socket 
	sockfd = socket(AF_INET, SOCK_STREAM, 0); 
	
	if (sockfd < 0) 
          error("ERROR opening socket");

	bzero((char *) &serv_addr, sizeof(serv_addr));

	//Set port number for socket
	portno = 12174;

	//Create standard unix socket settings
	serv_addr.sin_family = AF_INET;
    
	serv_addr.sin_port = htons(portno);

	serv_addr.sin_addr.s_addr = INADDR_ANY;

	if (bind(sockfd, (struct sockaddr *)  &serv_addr, sizeof(serv_addr)) < 0)
        error("ERROR on binding");

	listen(sockfd,5);

	printf ("Server running on: %d\n\n", portno); 

	clilen = sizeof(cli_addr);


	// Main loop accepting connections
	while (1) {

	  newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);

	  if (newsockfd < 0) error("ERROR on accept");

	  //Fork the process to support varius connections
	  pid = fork();

	  //exit on error
	  if (pid < 0) error("ERROR on fork");

	  //if fork is succesfull
	  if (pid == 0)  {

	    // Call function 
            SocketResponse(newsockfd);

	    close(newsockfd);

            exit(0);

	  }
	  else 
	    close(newsockfd);

 	} 

	// Close connection
	close(sockfd);

	// Exit program
	return(0);
}


void SocketResponse ( int sock )
{

	FILE *f;
	int n, i, pid, errorbit;
	char command;
	char buffer[5096];
	char request[5096];
	char tempbuf[5196];
	char params[80];
	char exec_cmd[120];
	char tempfilename[48];
	char mychar;

	bzero(buffer,5096);
	bzero(request, 5096);
	bzero(tempbuf, 5196);

	//Read the REQUEST 
	n = read(sock,request,5096);

	//Print out the request
	printf("%s \n ", request);

	//Scan the request for bad chars
	for ( i = 0; i < 20; i++ ){

		if ( (request[i] == '|') || (request[i] == ';') || (request[i] == ',') || (request[i] == '>') ||
		     (request[i] == '<') || (request[i] == '\'') || (request[i] == '`') || (request[i] == '/') ||
		     (request[i] == '/') || (request[i] == '^') ) {

			//Found a bad character
			printf ("Found bad character: %c\n", request[i]);

                	strcpy ( buffer, "RESPONSE 0" );

                	n = write (sock, buffer, sizeof(buffer));

                	if ( n < 0 ) error("Error sending buffer\n");

			//Done
                	return ;
		}
	}		
	
	//Decode request, get command number.
	command = request[8];

	//Get Params
	for ( i = 9; i < 89; i++ ) 
	{
		params[i-9] = request[i];
		if ( request[i] == '\0' )
		break;
	}
	
	//Set temp file name using the pid from the fork
	pid = getpid();
	sprintf( tempfilename, "temp_%d.txt", pid );

	//Form the string for the command to be executed
	if ( command == '1' )
	strcpy ( exec_cmd, "ps " );
	else 
	if ( command == '2' )
        strcpy ( exec_cmd, "df " );
	else 
	if ( command == '3' )
        strcpy ( exec_cmd, "finger " );
	else
	if ( command == '4' )
        strcpy ( exec_cmd, "uptime " );

	strcat ( exec_cmd, params );
	strcat ( exec_cmd, "> ");
	strcat ( exec_cmd, tempfilename ); 
	

	//Output command to be executed
	printf( "%s \n", exec_cmd );

	//Execute command
	system ( exec_cmd );

	//In case of an error executing the command
	if ( (f = fopen(tempfilename,"r") ) == NULL )
	{
		printf ("Cant open file output, possible error on command recevied.");
		strcpy ( buffer, "RESPONSE 0" );
		n = write (sock, buffer, sizeof(buffer));        
        	if ( n < 0 ) error("Error sending buffer\n");  
        	close(f);
		return ;
	}


	//Read file "f" into buffer	
	n = fread(buffer, 1, 5095, f );
	
	//Format the message output
	strcpy ( tempbuf, "RESPONSE " );
	tempbuf[9] = command;

	//Copy the rest of the command
	for ( i = 10; i < 5107; i++ )
	{
		tempbuf[i] = buffer[i-10];
	}

	n = write(sock, tempbuf, sizeof(tempbuf));

	if ( n < 0 )
	  error("Error sending buffer\n");

	fprintf(stdout, "%s \n", buffer);

	//Delete temp file
	strcpy ( exec_cmd, "rm ");
	strcat ( exec_cmd, tempfilename );
	system ( exec_cmd );

	//Close open files
	fclose(f);
}



void error(char *msg)
{
    perror(msg);
    exit(1);
}



