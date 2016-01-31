// Roberto Javier Vega SID: 003-110-71
// Eduardo Esquivel SID: 103-016-644
//
// CS111 Spring 04
// System Signal Project
//
// File: main.c
// Compile: gcc main.c
// Execute: a.out
//
// This is the file test for the system call sys_cs111
// that searches for a list of PIDs given in an array
// and it returns in a structure the results fo the
// PID that has the most files open, the number of those
// files and the max id of all the PIDs checked.
//
// This program is a test program that creates some process
// and opens some files for each process and then in call
// the system function with the array of PIDs.
//


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <linux/unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <signal.h>
#include <errno.h>
#include <unistd.h>

#define MAX_PIDS 5
#define FDS_SIZE 20

//Structure that defines the return
//fields form the sys_cs111 call.
struct pid_strc
{
	pid_t mfdpid;
	unsigned int numfd;
	unsigned int maxfd;
};

//Stub function for sys_cs111 system call.
_syscall2(int, sys_cs111, pid_t *, pid, struct pid_strc *, st_pid);

int main ()
{
	int i, value_ret;
	int fd[FDS_SIZE];
	pid_t pids [MAX_PIDS];
	pid_t * null_pid = NULL;
	struct pid_strc s;


	//Initialize the data to null properly
	for ( i = 0; i < MAX_PIDS; i++ ) pids[i] = (int) NULL;

	//Parent opens 2 files:
	fd[0] = open ( "file.0", O_CREAT | O_APPEND );
	fd[1] = open ( "file.1", O_CREAT | O_APPEND );

	//Parent has 3 standard open files plus 2 more total 5
	pids[0] = getpid();
	printf ("Test #1:\n");

	printf ("Parent PID: %d.\n", pids[0]);
	printf ("Parent has 3 std files plus 2 files opened.\n");

	printf ("Call sys_cs111 with only the parent process id:\n");

	//First output showing
	if ( sys_cs111( pids, &s ) == 0 )
		printf ("sys_cs111: mfpid %d, numfd %d, maxfd %d\n", s.mfdpid, s.numfd, s.maxfd );
	else {
		printf ("sys_cs111 failed.\n");
		unlink("file.0");
		unlink("file.1");
		return -1;
	}
	
	printf ("\nTest #2:\n");
	printf ("Create 3 child process and call syscall with their pids.n\n");

	//Only the parent should execute this code

	//Fork process and open some files
	if ( getpid() == pids[0] ) {
		pids[1] = fork();

		if (pids[1] == 0) {		//Child process executing
			fd[2] = open ( "file.2", O_WRONLY | O_CREAT );
			fd[3] = open ( "file.3", O_WRONLY | O_CREAT );
			fd[4] = open ( "file.4", O_WRONLY | O_CREAT );
			fd[5] = open ( "file.5", O_WRONLY | O_CREAT );
			fd[6] = open ( "file.6", O_WRONLY | O_CREAT );

			sleep(3);		//Give to the parent to continue executing
			close(fd[2]);
			close(fd[3]);
			close(fd[4]);
			close(fd[5]);
			close(fd[6]);
			exit(0);
		}
		else {
			printf("Child #1 PID: %d, 5 files open. Total 10.\n", pids[1]);
		}
	}

	//Only the parent should execute this code
	//Fork process and open some files
	if ( getpid() == pids[0] ) {
		pids[2] = fork();

		if (pids[2] == 0) {		//Child process executing
			fd[7] = open ( "file.7", O_WRONLY | O_CREAT );
			fd[8] = open ( "file.8", O_WRONLY | O_CREAT );
			fd[9] = open ( "file.9", O_WRONLY | O_CREAT );
			sleep(3);		//Give to the parent to continue executing
			close(fd[7]);
			close(fd[8]);
			close(fd[9]);
			exit(0);
		} else {
			printf("Child #2 PID: %d, 3 files open. Total 7.\n", pids[2]);
		}
	}

	//Only the parent should execute this code
	//Fork process and open some files
	if ( getpid() == pids[0] ) {
		pids[3] = fork();

		if (pids[3] == 0) {		//Child process executing
			fd[10] = open ( "file.10", O_WRONLY | O_CREAT );
			fd[11] = open ( "file.11", O_WRONLY | O_CREAT );
			fd[12] = open ( "file.12", O_WRONLY | O_CREAT );
			fd[13] = open ( "file.13", O_WRONLY | O_CREAT );
			sleep(3);		//Give to the parent to continue executing
			close(fd[10]);
			close(fd[11]);
			close(fd[12]);
			close(fd[13]);
			exit(0);
		} else {
			printf("Child #3 PID: %d, 4 files open. Total 9.\n", pids[3]);
		}
	}

	sleep(2); //Give the OS time to open the files

	//Only the parent should execute this code
	if ( getpid() == pids[0] ) {
		if ( sys_cs111( pids, &s ) == 0 )
			printf("Sys_cs111 called ok.\n");
		else
			printf("Sys_cs111 failed.\n");

		//Output results
		printf ("Note: max open files is Child 1, with 10 files total.\n" );
		printf ("sys_cs111: mfpid %d, numfd %d, maxfd %d\n", s.mfdpid, s.numfd, s.maxfd );
	}

	//Only the parent should execute this code
	if ( getpid() == pids[0] ) {
		waitpid(pids[1], 0, 0);
		waitpid(pids[2], 0, 0);
		waitpid(pids[3], 0, 0);
	}

	//Next tests
	printf ("\n");

	printf ("Test #3:\n");
	
	//Test failing for a null pointer
	printf("Test failure due to null pointer:\n");

	//Null_pid is a null pointer
	value_ret = sys_cs111( null_pid, &s );
	if ( value_ret == 0 ) {
		printf("sys_cs111: return value %d.\n", value_ret);
		printf("errno: %d\n", errno);
	}
	else {
		printf("sys_cs111: return value %d.\n", value_ret);
		printf("errno: %d\n", errno);
	}

	//Next tests
	printf ("\n");

	printf ("Test #4:\n");
	
	
	//Testing due out of range memory access
	printf("Test failure due to out of range failure:\n");

	//Note we can test this by not sending an array with
	//a null terminated item.
	value_ret = sys_cs111( pids + 10000, &s );
	if ( value_ret == 0 ) {
		printf("sys_cs111: return value %d.\n", value_ret);
		printf("errno: %d\n", errno);
	}
	else {
		printf("sys_cs111: return value %d.\n", value_ret);
		printf("errno: %d\n", errno);
	}

	printf ("Run dmesg for kernel specific errors.\n");

	//Closing up files
	close(fd[0]);
	close(fd[1]);

	//Cleaning up files
	unlink ("file.0");
	unlink ("file.1");
	unlink ("file.2");
	unlink ("file.3");
	unlink ("file.4");
	unlink ("file.5");
	unlink ("file.6");
	unlink ("file.7");
	unlink ("file.8");
	unlink ("file.9");
	unlink ("file.10");
	unlink ("file.11");
	unlink ("file.12");
	unlink ("file.13");
	unlink ("file.14");

	exit(0);
}
