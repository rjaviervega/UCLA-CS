/*

	WebClient.cgi

	This program is a cgi client that acs as an interface to
	connect to the server program. It uses cgi protocol to 
	exchange information with a web browser and print out
	results obtained from a connection with a unix socket
	server client.

	The program works bassically by presenting an html form
	that can be submitted to the same cgi program. Once a
	user sends the form, the program will connect to a 
	server that is waiting for the connectin and get results
	from the execution of a unix command.
	
	The cgi program allows to add parameters to the command 
	to be executed. Also, it can connect to upto 4 different 
	machines and print out the results obtained. 

	This cgi progra uses intesibly the cgic library to support
	the parsing from the CGI connection. 

	Also, it prints out the command to be executed with some
	standard information.

	Author: R. Javier Vega	
	SID: 003-110-717
	UCLA CS118 Fall 2003
*/

#include <stdio.h>
#include "cgic.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>


//Process the submition of the form
void ProcessSubmit();

//Print basic html form for submition
void BaseRequestPage();

//Print error message
void error(char *msg);

//Send unix socket command to server
void SendCommand( int cmd, char *server_ip, char *params );

// Gobaly defined socket port for connection
int port = 12174;

int cgiMain ( )
{

	//Start contect type with the cgiclib
	cgiHeaderContentType("text/html"); 

	//Output preformatted html code
	fprintf(cgiOut, "<html><head>\n");
	fprintf(cgiOut, "<title>WebClient CS118 Project #1</title></head>\n");
	fprintf(cgiOut, "<body>\n"); 
	fprintf(cgiOut, "<h2> WebClient: cs118 Project #1</h2>");

	//Process command in case of submit
	if ( (cgiFormSubmitClicked("submit") == cgiFormSuccess) )
	 ProcessSubmit();	// Process submittion of command
	else
	 BaseRequestPage();	// Else present basic submition form

	//End of cgi window
	fprintf (cgiOut, "</body></html>");
	fprintf (cgiOut, "\n\n");

    	return (0);
}



/*
Proccess command by sending request to the server and
printing back the results to the web browser.
This fucntion is called many times by process submit
form and then it prints the results on time to the 
browser. This function does all the unix socket
commands and cleans up all the connection process as well.
*/
void SendCommand( int cmd, char *server_ip, char *params )
{
        //Sockets
          
	FILE *fin, *fout;
	char c;
        int sockfd, portno, n, readbytes, buflen, i;
        struct sockaddr_in serv_addr;
        struct hostent *server;
        char buffer[5196];
	char tempbuf[5196];
	char *buffer2;

	//Set buffer size length send in the request
	buflen = 5107;
	buffer2 = buffer;
    
        portno = port;
         
        sockfd = socket(AF_INET, SOCK_STREAM, 0);
        if (sockfd < 0)
          error("ERROR opening socket");
        
	//Select the server to connect
	if ( strcmp ( server_ip, "164.67.100.27" ) == 0 )
	 server = gethostbyname("westholme.seas.ucla.edu");

	if ( strcmp ( server_ip, "164.67.100.26" ) == 0 )
	 server = gethostbyname("landfair.seas.ucla.edu");
	
	if ( strcmp ( server_ip, "164.67.100.135" ) == 0 )
	 server = gethostbyname("national.seas.ucla.edu");
	 
	if ( strcmp ( server_ip, "164.67.100.29" ) == 0 )
         server = gethostbyname("kelton.seas.ucla.edu");

        if (server == NULL) 
          fprintf(stderr,"ERROR, no such %s  host\n", server_ip);

	bzero((char *) &serv_addr, sizeof(serv_addr));

	serv_addr.sin_family = AF_INET;

	bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);

	serv_addr.sin_port = htons(portno);
    
	if (connect(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
	 fprintf( cgiOut, "ERROR connecting to %s<br>", server_ip );
        
	bzero(buffer,5096);  

	strcpy( buffer, "REQUEST");
	strcat( buffer, " ");
	if ( cmd == 1 ) strcat( buffer, "1");
        if ( cmd == 2 ) strcat( buffer, "2");
        if ( cmd == 3 ) strcat( buffer, "3");
        if ( cmd == 4 ) strcat( buffer, "4");
	strcat( buffer, " ");
	strcat( buffer, params);

	//Send request to server
	n = write(sockfd,buffer,strlen(buffer));

	if (n < 0)
	 error("ERROR writing to socket");

	bzero(buffer,5095);

	fprintf (cgiOut, "<br>");

	readbytes = 0;
	while ((n = read ( sockfd, buffer2, buflen )) > 0)
	{ 
		buffer2 += n;
		buflen  -= n;
		readbytes += n;
	}
		

	if ( n < 0 )
	 error("Error reading buffer");

//	Debuggin Option
//	fprintf(cgiOut, "Bytes read %d <br>", readbytes );

	//Check in case of error reported by the server
	if ( buffer[9] == '0' ){
		//Bad Character found by the server, reported error.
		strcpy ( tempbuf, "ERROR executing command. Bad Character found." );
	}
	else{
		//Copy the obtained buffer without the "REQUEST X" string
		//to a temporary buffer which will be outputted to the browser.	
		for ( i = 10; i < 5197; i++ ) {
			tempbuf[i-10] = buffer[i];	
			if (buffer[i] == '\0')
			break;

		}
	}
	
	//Output the results
	fprintf(cgiOut, "<pre> %s </pre>", tempbuf);

	close(sockfd);
}


void ProcessSubmit()
{
	int command;
	char params[21];
	char *Hosts[] = { "164.67.100.27", "164.67.100.26", "164.67.100.135", "164.67.100.29" }; 
	int HostChoices[4];
	int i;
	int result;
	int invalid;

	//Output the port obtained
        cgiFormInteger("port", &port, 0);
        fprintf(cgiOut, "Port Selected: <b>%d</b><br>", port);
        
	if ( port == 0 ) {
		printf ("Please select a valid port.");
		return;
	}

	//Output the CommandSelection
	cgiFormInteger("cmd", &command, 0); 
	fprintf(cgiOut, "Command: <b>");
	if (command == 1) { fprintf ( cgiOut, "ps" ); }
	else
        if (command == 2) { fprintf ( cgiOut, "df" ); }
	else
        if (command == 3) { fprintf ( cgiOut, "finger" ); }
	else
        if (command == 4) { fprintf ( cgiOut, "uptime" ); }
	else {
		fprintf(cgiOut, "Please select a command.</b");
		return;
	}
        fprintf(cgiOut,"</b> <br>\n");

	//Print the params
        cgiFormStringNoNewlines("params", params, 21);
        fprintf(cgiOut, "Parameters:<b> ");
        cgiHtmlEscape(params);
        fprintf(cgiOut,"</b> \n");

	fprintf(cgiOut, "<br>");

	//Output the list of hosts selected
	result = cgiFormCheckboxMultiple("host", Hosts, 4, HostChoices, &invalid);

	if (result == cgiFormNotFound) {
		fprintf(cgiOut, "No hosts have been selected, please choose at leats one of them!<p>\n");
		return;
	} else {	
		fprintf(cgiOut, "The selected Hosts are:\n");
		fprintf(cgiOut, "<ul>\n");
		for (i=0; (i < 4); i++) {
			if (HostChoices[i]) {
				fprintf(cgiOut, "<li>%s\n", Hosts[i]);
			}
		}
		fprintf(cgiOut, "</ul>\n");
        }
	
	//Send command to server for each of the selected hosts
	for ( i = 0; i < 4; i++ )
	{
		if ( HostChoices[i] )
		{
			SendCommand( command, Hosts[i], params );
		}
	}
 }



void BaseRequestPage()
{
        fprintf (cgiOut, "
                <form method=\"GET\" action=\"webclient.cgi\">
                        <br><b>Select some hosts:</b><br><br>
                                <input type=\"Checkbox\" name=\"host\"value=\"164.67.100.27\">Westholme<br>
                                <input type=\"Checkbox\" name=\"host\" value=\"164.67.100.26\">Landfair<br>
                                <input type=\"Checkbox\" name=\"host\" value=\"164.67.100.135\">National<br>
                                <input type=\"Checkbox\" name=\"host\" value=\"164.67.100.29\">Kelton<br>
                        <br><b>Enter the port on which your daemons are listening:
                        <input type=text name=port size=10 value=\"12174\">
                        <br><b>Select a command:</b><br><br>
                                <input type=radio name=cmd value=1>ps<br>
                                <input type=radio name=cmd value=2>df<br>
                                <input type=radio name=cmd value=3>finger<br>
                                <input type=radio name=cmd value=4>uptime<br>
                        <br><b>Add any parameters for this command:</b><br><br>
                        <input type=text name=params size=20>
                        <br>
                                <input type=\"Submit\" value=\"Submit\" name=\"submit\">
                                <input type=\"Reset\" name=\"Reset\">
                </form>
                ");
}



void error(char *msg)
{
        fprintf(cgiOut, msg);
}
