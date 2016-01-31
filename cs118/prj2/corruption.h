/* Mangles buf in place and returns a pointer to it. This function will
   only sometimes corrupt packets and when it does, it will only sometimes
   corrupt more than 1 bit. It will never corrupt more than 16 bits in 
   a packet.
*/
void * mangle(void *buf, int size);

/* This function returns 0 if you should drop a packet an 1 if you should 
   keep it. 
*/
int drop();
