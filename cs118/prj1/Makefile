CFLAGS=-g 
CC=gcc
SERVER_LIBS= -lsocket -lnsl
CLIENT_LIBS=-L./ -lcgic -lsocket -lnsl

all: webclient.cgi server.cgi

webclient.cgi: webclient.c
	gcc webclient.c -o webclient.cgi ${CLIENT_LIBS}

server.cgi: server.c
	gcc server.c -o server.cgi ${SERVER_LIBS}

clean:
	rm -f *.o  webclient.cgi server.cgi
 
