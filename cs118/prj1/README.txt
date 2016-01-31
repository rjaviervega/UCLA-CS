CS118 PROJECT 1 README FILE
===========================

Notes about the project:
========================

	The project consists of two programs that exchange information
	to present the user with the output of the execution of unix
	commands.

	Server:
	=======

	The first and simplest part is the server, which runs on the
	unix host that would execute the files.

	The server is a unix socket program that listen in a socket
	waiting for commands. 
	
	Once a request is received, it checks to see if the command
	is valid and then it executed a unix command according with
	the protocol and the specs defined in the projects. Which
	are defined in the code of the project.

	The server support simultanius connections by forking itsefl
	to a child process and executing the opperation. To store the
	results of the command executed, the server program creates
	a temporary file with the results and the it reads from that
	file the data to be sent to the client. Once done the server
	closes the connection with that client and waits for a new
	connection.

	The major details of the implementation of the server code
	are described in the server itself. And for implementation
	purposes the server will print out to the standard output
	the same chuck of data sent to the client.


	Client:
	=======

	The client is implemented as a cgi program that prints a form
	to the user. To do that the client uses cgic library for the
	parsing of the CGI protocol with the browser. 

	The client pritns the form when no form have been submitted to
	the server. In case of a submition the client will execute
	the commands found in that submition and then it would connect
	to the server part to obtain the requested part.

	The client can connect to 4 server that are running the program.
	This servers will reply with the data that is stored in a buffer
	of maximun 5kbytes. In case of a bigger chunck of data the rest
	of the data would be ignored and discarded.

	The CGI part of the client is implemented with the cgic library
	which encapsulates the adminstration of the form request.
	Also cgic provides with a file that all the output will be 
	directed to the server. The parsin of data with the cgic library
	allos the program to relay on that library for those rutines
	and not having to implement those was a relif. 

	The client will output all the data from the server and then 
	it will finish the connection.

	The details of the implementation of the client software can
	be found in mode of comments and description inside fo the source
	file.


	
	
	Personal Experience:
	====================

	In this project I learned a lot, specially about socket programming
	which is a very exiting part. Thankfully, I had experience already
	with unix, so getting started with the project wasn't that bad.
	The same thing happend with cgi programming, but my previus experience
	was using other languages like perl, which simplified the coding.

	The use of cgic library took me a while to learn, but once I got it
	it wasn't a problem. I supported my learing with the reading of tutorials
	in the internet and sample programs that I got from there too.

	I didn't read the Unix Network Programming book, I just gave it a look
	and use it as reference to support some of the tutorials of socket programming
	on the internet.

	After all, this project has been a very good and satisfiying experience
	that I think I can use later on when I get to the working field.


