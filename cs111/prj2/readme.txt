CS111 Project #2

Authors:
	R. Javier Vega
	Eduardo Esquivel

File: readme.txt


1.- To compile the program: 
	bash>gcc -isystem ./linux/include -Wall userprogram.c

	The output executable is ./a.out

	Note: ./linux/include is the path where the patched
	kernel is located.

2.- Last minute info:
	All is working on the project. 
	It has been tested under many scenarios and all of
	them have been sucessful.

3.- Documentation:
	This project was bassically implementing a system call
	in the linux kernel. The file kernelchanges.diff is 
	a patch for the kernel tree 2.4.26 that implements 
	the new system call. Additional files have been 
	included to show how the call works and the results
	obtained. As example the program userprogram.c is 
	provided and properly documented.
	Bassically, the userprogram.c runs the parent process
	that first opens 2 files, then it spanws 3 child 
	processes. The first child will open 5 more files, 
	having a total of 10, and the other child process
	will open less files. 
	Later the system call is called with the 4 pids
	and it shows the proper results.
	Next the test of failure of the system call
	are performed, the call with the null pointer and
	the call that goes out of range with an invalid
	memory address of a pointer.
	Both errors are handled properly and they output
	the corrent errno to the OS. Finally, we each
	child process and the parent performs the proper
	closing and delition of the files.

4.- Assumptions:
	Our basic assumotions were that there is always 
	3 std files open with every process (stdin, stdout,
	stderror) and after opening files those files were
	inherent by child processes.
	Also, our assumptions were that the files open
	are open with sequential numbers for the file 
	descriptors. 



