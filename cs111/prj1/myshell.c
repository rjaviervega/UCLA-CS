/*
 *
 * Shell Project
 *
 * CS111 Spring 2004
 *
 *
 * Author: R. Javier Vega 003-110-717
 * 	   Eddie Esquivel 103-016-644
 *
 *
 *
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <unistd.h>
#include <signal.h>

#define MaxArgSize 30
#define MaxArg 100
#define MaxPathLength 255
#define MAX_PIDS 100

/* Structures */
typedef struct Command {
        char *name;
        int argc;
        char *argv[MaxArg];
	int input;
	int output;
	char *inputfile;	// pointer to input file
	char *outputfile;	//pointer to output file
} Command;

typedef struct Path {
        int numPaths;
        char *path[MaxPathLength];
} Path;


/* Function List */
int    GetCmdLine( char * cmd );
int    ExecCommand( char * cmd, int * bGround );
int    paths(char *envpath, Path *User);
int    GetRemoveCommand( char *cmd, char *cmd1, char *cmd2, int * background );
void   ProcessCmd ( char * cmd, int prev_cmd, int prev_cmd_ret );
void   ShowPrompt();
void   Signal_Wait( int signum );
void   InitSignal();


// Global variables to control sleeping process
int PIDList[MAX_PIDS];
int PIDListNum = 0;

int main ()
{
	char *cmdLine;

	//Allocate memory
	cmdLine = (char *) malloc(120 * sizeof(char));

	//Register Signal Handler to avoid zombie process
	InitSignal();

	while (1)
	{
		ShowPrompt();
		GetCmdLine ( cmdLine );
		ProcessCmd ( cmdLine, -1, -1 );
	}

	return 0;
}

void ShowPrompt ()
{
	printf ("Simple-Shell> ");
}

int GetCmdLine ( char * cmd )
{
	fgets(cmd, 120, stdin);
	cmd[strlen(cmd)-1] = '\0';
	return 1;
}

/*
	This function executes a command and parses the rest of the commands
	following the &&, || or ; specs.

	previuos_cmd_ret is the returned value of a previous command
	execute to be able to calculate the flow of multiple commands
	sent to the function.

	-1: Means that no operation is requiered (ignore)
	0: Means previous op was successful
	1: Means previous op was not excecuted sucessfully
*/
void ProcessCmd ( char * cmd, int prev_cmd, int prev_cmd_ret )
{
	int cmdType = -1, bGround, ExecRet = 1;
	char *cmd1, *cmd2, *cmd3;

	cmd1 = (char *) malloc(120 * sizeof(char));
	cmd2 = (char *) malloc(120 * sizeof(char));
	cmd3 = (char *) malloc(120 * sizeof(char));

	cmdType = GetRemoveCommand( cmd, cmd1, cmd2, &bGround  ); //Split Cmd and perform respective calls
	strcpy ( cmd3, cmd1 );
	strcat ( cmd3, "\n");

	//printf ("Command to execute: %s, prev_cmd: %d, prev_ret: %d\n", cmd3, prev_cmd, prev_cmd_ret);
	//If there are no previous failure commands execute the and
	if ( prev_cmd == -1 )    ExecRet = ExecCommand ( cmd3, &bGround );
	if ( prev_cmd ==  2 )    ExecRet = ExecCommand ( cmd3, &bGround );
	if ( prev_cmd ==  0   && prev_cmd_ret != 1 ) ExecRet = ExecCommand ( cmd3, &bGround ); // And

	//Or case
	if ( prev_cmd ==  1   && prev_cmd_ret != 0 ) ExecRet = ExecCommand ( cmd3, &bGround );
	if ( prev_cmd ==  1   && prev_cmd_ret == 0 ) ExecRet = 0; //Assume sucesfull execution if the previous values where inheret to not execute


	//Check if there are more cmds to execute
	if ( strcmp(cmd2, "") ) {
		//Check for the process flow
		if ( cmdType == 0 ) { // AND
			//If the current Execution was sucesfull and the previous cmd was not a failure
			//proceede to execute the next && operator.
			//if ( ExecRet == 0 && prev_cmd_ret != 1 ) {
			if ( ExecRet == 0 ) { //}&& prev_cmd_ret != 1 ) {
				ProcessCmd ( cmd2, 0, 0 );  //Recursively Process the rest of the commands
			}
			else {		              //And failed so skip next cmd
				//if ( prev_cmd_ret != 1) printf ("Command not found (0): %s", cmd3);
				//prev_cmd = GetRemoveCommand ( cmd2, cmd1, cmd3, &bGround ); //Skip one command
 				//printf ("Previous command: %d\n", prev_cmd);
				//ProcessCmd ( cmd3, 0, 1 );
				ProcessCmd ( cmd2, 0, 1 );
			}
		}

		if ( cmdType == 1 ) { // OR
			if ( ExecRet == 0 ) {
				//GetRemoveCommand( cmd2, cmd1, cmd3, &bGround ); //Skip one command
				//ProcessCmd ( cmd3, cmdType, 0 );
				ProcessCmd ( cmd2, 1, 0 );
			}
			else {		              //OR failed so execute
				//printf ("Command not found (1): %s", cmd3);
				ProcessCmd ( cmd2, 1, 1 );
			}
		}

		if ( cmdType == 2 ) { // Simi-Colon
			//if ( ExecRet != 0 ) printf ("Command not found (3): %s", cmd3);
			ProcessCmd ( cmd2, 2, 0 );
		}
	}

	return;
}

//Recursively Process the rest of the commands
//Returns the first
int GetRemoveCommand( char *cmd, char *cmd1, char *cmd2, int * background )
{
	int skip_blank = 1;
	int i, i2, index = -1, cmd_type = 2, n_skip = 2;

	bzero ( cmd1, 120 );
	bzero ( cmd2, 120 );

	//Copy original command
	strcpy( cmd1, cmd );

	(*background) = 0;

	//Search for first tokens
	for ( i = 0; i < strlen(cmd1); i++)
	{
		//if ( strcmp(cmd2, "")  ) break;

		//Set flag if the process needs to be run in the background
		if ( cmd1[i] == '&' && cmd1[i+1] != '&' && ((*background) == 0) ) {
			cmd1[i] = ' ';
			(*background) = 1;
			continue;
		}

		if ( cmd1[i] == '&' && cmd1[i+1] == '&' ) {
			index = i;
			cmd_type = 0;
			break;
		}

		if ( cmd1[i] == '|' && cmd1[i+1] == '|' ) {
			index = i;
			cmd_type = 1;
			break;
		}

		if ( cmd1[i] == ';' ) {
			index = i;
			cmd_type = 2;
			n_skip = 1;
			break;
		}
	}

	//Set base case if there is no more commands
	if (index == -1 )
	{
		strcpy (cmd2, "");
		return;
	}

	//Get only the first command
	cmd1[index] = '\0';

	//Store the rest on cmd2 for recursice call
	i2 = 0;
	for ( i = 0; i < (strlen(cmd) - n_skip - index); i++ ) {
		//Skip the first blank chars
		if ( (cmd1[ index + i + n_skip ] != ' ') || (i2 != 0) ) {
			cmd2[ i2 ] = cmd1[ index + i + n_skip ];
			i2++;
		}
	}
	return cmd_type;
}





//Initianllizate the siganl handles to avoid zombie process
void	InitSignal ()
{
	struct sigaction sa;
	//Instruct the System to ignore the return value of the
	//dead child and not create zombie process
	sa.sa_handler = SIG_IGN;
	#ifdef SA_NOCLDWAIT
	sa.sa_flags = SA_NOCLDWAIT;
	#else
	sa.sa_flags = 0;
	#endif
	sigemptyset(&sa.sa_mask);
	sigaction(SIGCHLD, &sa, NULL);
}

//Call wait when the Child process has died
//so the tables can be cleaned in the parent
//process and OS kernel.
void   Signal_Wait( int signum )
{
	int i, pid;

	i = 0;
	do {
		if ( i == PIDListNum ) i = 0;
		pid = waitpid ( PIDList[i], NULL,  WNOHANG |  WUNTRACED);
		i++;
	} while ( pid > 0 );

	/*
	//Remove the item at i and replace with the last item
	printf("Process %d\n",PIDList[i]);
	for ( i = 0; i < PIDListNum; i++ ) {
		if ( pid = PIDList[i] ) {
			PIDList[i] = PIDList[ PIDListNum - 1 ];
			PIDListNum--;
		}
	}
	*/

}



int    ExecCommand( char * cmd, int * bGround )
{
	int i, j, fd_in, fd_out;
        int numPaths;
        int status;
	int pathFoundFlag = 1;  //Sets flag for error
	char *envpath;
	char *temp;
	char tempWord[MaxPathLength];

        Path User;                                              // Different paths placed into struct
	Command Current;					// Parsed command is place into struct

	Current.input = 0; //initialize to NO redirection
	Current.output = 0;

	temp = (char *) malloc(sizeof(char));
	envpath = (char *) malloc(30 * sizeof(char));
	envpath = getenv("PATH");
	strcat(envpath, "\n");              // Return the type of command, && = 1, || = 2, ; = 0, default = 0
	numPaths = paths(envpath, &User);
	User.numPaths = numPaths;

	Current.name = (char *) malloc(MaxArgSize * sizeof(char));
	Current.inputfile = (char *) malloc(MaxArgSize * sizeof(char));
	Current.outputfile = (char *) malloc(MaxArgSize * sizeof(char));
	parse ( cmd, &Current );

	//Implement Change Directory
	if (strcmp(Current.name, "cd") == 0)
	{
		if (Current.argc == 1)
		{
			chdir(getenv("HOME"));
			pathFoundFlag = 0;
		}
		else
		{

			if (chdir(Current.argv[1]) != 0)
			{
				printf("Error: Directory not found.\n");
			}
			pathFoundFlag = 0;
		}
		return pathFoundFlag;
	}

	//Implement Exit command
	if (strcmp(Current.name, "exit") == 0)
	{
		exit(0);
	}
	//

	// Check if the command is valid as is
	if(access(Current.name, X_OK | F_OK) != -1)
	{
		pathFoundFlag = 0;
	}
	else
	{
		// Otherwise, try various PATHs to execute
		for (i=0; i < User.numPaths; i++)
		{
			strcpy(tempWord, User.path[i]);		// tempWord = /usr/bin
			strcat(tempWord, "/");                  // tempWord = /usr/bin/
			strcat(tempWord, Current.name);         // tempWord = /usr/bin/ls

			if(access(tempWord, X_OK | F_OK) != -1)
			{
				strcpy(Current.name, tempWord);
				pathFoundFlag = 0;
				break;
			}
		}
	}

	status = fork();

	if( status == 0) {
		//Implementing Redirection of input/output
		if(Current.input == 1)
		{
			fd_in = open(Current.inputfile, O_RDONLY, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH | S_IWOTH);
			close(0);
			dup(fd_in);
			close(fd_in);
		}
		if(Current.output == 1)
		{
			fd_out = open(Current.outputfile, O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR |S_IRGRP | S_IROTH | S_IWOTH);
			close(1);
			dup(fd_out);
			close(fd_out);
		}
		execv(Current.name, Current.argv);
		close(fd_in);
		close(fd_out);
		exit(0);
	}
	else
	{
		if ( *bGround == 0 ) waitpid(status, NULL, 0);
	}
	if ( pathFoundFlag == 1 )
		printf ("Command not found (4): %s\n", Current.name);	

	return pathFoundFlag;  // return 1 if not found cmd, or 0 if successful
}



/* Parses the Statement and sticks it into a command structure */
int parse(char *Statement, Command *Current)
{
        char *temp;
        char tempCmd[MaxArgSize];
        int i = 0;
        int argIndex = 0;
        int arg_count = 0;
	int redirecflag = 0;
	int redirec = 0; //if 1 then current redirec is input; if 2 then current redirec is output */

	temp = (char *) malloc(sizeof(char));

        *temp = Statement[i];

	// this while loop advances i to the first letter of the command, skips any initial white space */
        while (((*temp == ' ') || (*temp == '\t')) && (*temp != '\n'))
        {
		i++;
                *temp = Statement[i];
	}

        /* Parse the whole sentence until new line character is met */
        while (*temp != '\n')
        {

		strcpy(tempCmd, "");

                /* Copy one word into tempCmd */
                while ((*temp != ' ') && (*temp != '\t') && (*temp != '\n'))
                {
			if (*temp == '<')
			{
				(*Current).input = 1;
				i++;
				*temp = Statement[i];
				redirecflag = 1;
				redirec = 1;
				while (((*temp == ' ') || (*temp == '\t')) && (*temp != '\n'))
        			{
					i++;
		                	*temp = Statement[i];
				}
			}

			if (*temp == '>')
			{
				(*Current).output = 1;
				i++;
				*temp = Statement[i];
				redirecflag = 1;
				redirec = 2;
				while (((*temp == ' ') || (*temp == '\t')) && (*temp != '\n'))
        			{
					i++;
                			*temp = Statement[i];
				}
			}

	                strcat(tempCmd, temp);
                	i++;
                        *temp = Statement[i];
                }

		if(redirecflag !=1)
		{
			// if this is the first time through the loop then word parsed is the actual command
                	if (argIndex == 0)
                	{
	                        strcpy((*Current).name, tempCmd);
                	}
        	        /* Allocate memory for the new argument */
	                (*Current).argv[argIndex] = (char *) malloc(MaxArgSize * sizeof(char));
                	strcpy((*Current).argv[argIndex], tempCmd);
                	arg_count++;
                	argIndex++;
		}
		else //redirecflag == 1
		{
			//code to handle redirection
			if(redirec == 1)
			{
				strcpy((*Current).inputfile, tempCmd);
				redirec = 0;
				//printf("the file to input to is: %s\n", (*Current).inputfile);
			}
			else // we are outputing
			{
				strcpy((*Current).outputfile, tempCmd);
				redirec = 0;
				//printf("the file to output to is: %s\n", (*Current).outputfile);
			}

			redirecflag = 0;
		}

		//by going inside loop you know that temp is currently pointing to a blank line
                while (((*temp == ' ') || (*temp == '\t')) && (*temp != '\n'))
                {
			i++;
                       	*temp = Statement[i];
                }
        }

        /* The last argument should be NULL */
        (*Current).argv[argIndex] = malloc(MaxArgSize * sizeof(char));
        (*Current).argv[argIndex] = NULL;
        (*Current).argc = arg_count;
        return 0;
}


/* Parses the PATH environment variable */
int paths(char *envpath, Path *User)
{
        char *temp;
        char tempPath[MaxPathLength];
        int i;
        int argIndex = 0;
        int numPaths = 0;

        i = 0;

        temp = (char *) malloc(sizeof(char));

        *temp = envpath[i];

        /* Parse the whole sentence until new line character is met */
        while (*temp != '\n')
        {
                strcpy(tempPath, "");

                /* Copy one path into tempPath*/
                while ((*temp != ':') && (*temp != '\n'))
                {
                        strcat(tempPath, temp);
                        i++;
                        *temp = envpath[i];
                }

                /* Allocate memory for the new argument */
                (*User).path[argIndex] = (char *) malloc(MaxPathLength * sizeof(char));
                strcpy((*User).path[argIndex], tempPath);	// tempPath contains the parsed path from PATH
                numPaths++;	// we increment the number of paths we have parsed

                strcpy(tempPath, "");	// intialize tempPath to "" to clear out the old path

                argIndex++;

		// need to advance i to first letter of path
                while ((*temp == ':') && (*temp != '\n'))
                {
                        i++;
                        *temp = envpath[i];
                }
        }

        /* The last argument should be NULL */
        (*User).path[argIndex] = malloc(MaxPathLength * sizeof(char));
        (*User).path[argIndex] = NULL;

        return numPaths;
}


