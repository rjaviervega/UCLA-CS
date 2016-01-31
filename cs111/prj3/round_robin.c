#include<stdio.h>
#include<sys/time.h>
#include<pthread.h>
#include"scheduler.h"

#define NUM_THREADS 10

int my_wait(int us) {
	int i, k;
	struct timeval end, cur;

	gettimeofday(&cur, NULL);
	end.tv_usec = cur.tv_usec + us%1000000;
	end.tv_sec = cur.tv_sec + us/1000000;
	while(timercmp(&end, &cur, >)) {
		for(i=0; i< 0x1000; i++) {
			k += 3 % 42;
		}
		gettimeofday(&cur, NULL);
	}

	return k&0xFF00;
}

void * work_thread(void * arg) {
	int i;
	int num = (int) arg;

	printf("Work Thread [%d] is starting...\n", num);
	for(i = 0; i< 16; i++) {
		my_wait(125000);
		printf("Work Thread [%d] is working...\n", num);
	}
	printf("Work Thread [%d] is exiting...\n", num);
	return 0;
}

void * start_routine(void * arg) {
	pthread_t thread[NUM_THREADS];
	int i, j;

	printf("Starting %d threads\n", NUM_THREADS);
	for(i = 0; i< NUM_THREADS; i++) {
		printf("Starting thread %d\n", i);
		create_thread(&(thread[i]), work_thread, (void *)i);
		for(j = 0; j< 2; j++) {
			my_wait(10000);
			printf("Start_routine is still working...\n");
		}
	}
	printf("Start_routing is exiting\n");
	return 0;
}

int main(int argc, char * argv[]) {
	
	pthread_t main_thread;

	run_scheduler(&main_thread, start_routine, NULL);
	return 0;
}
