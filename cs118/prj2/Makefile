CFLAGS=-g 
CC=gcc
SERVER_LIBS=-L./ -lsocket -lnsl -lcorrupt
CLIENT_LIBS=-L./ -lsocket -lnsl -lcorrupt

all: crcfec.o ftwi ftwid test

ftwi: ftwi.c data_struct.h crcfec.o
	gcc ftwi.c crcfec.o -o ftwi ${CLIENT_LIBS}

ftwid: ftwid.c data_struct.h crcfec.o
	gcc ftwid.c crcfec.o -o ftwid ${SERVER_LIBS}

test: test.c crcfec.o
	gcc test.c crcfec.o -o test

crcfec.o: crcfec.c crcfec.h
	gcc -c crcfec.c

clean:
	rm -f *.o  ftwi ftwid test crcfec.o *.sent
