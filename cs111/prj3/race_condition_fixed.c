#include<stdio.h>
#include<sys/time.h>
#include<pthread.h>

#include"scheduler.h"

#define NUM_THREADS 9

int shared_var = 0;
int shared_count = 0;

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
	int i,j;
	int num = (int) arg;
	int tmp1, tmp2;

	printf("Work Thread [%d] is starting...\n", num);

	for(i = 0; i< 5; i++) {

		// We need to add a mutex here in order to stop the race condition.
		// We try to get the mutex lock every time
		// if we can't get it, we will get preemented by the scheduler
		// and other process will run. Next we will be scheduled again
		// to run by the scheduler.
		while ( mutex_lock(0) !=  1) ;
		//

		for (j=0; j<100; j++){
			tmp1 = shared_var;
			tmp1++;
			my_wait(1250);
			shared_var = tmp1;
			printf("Work Thread [%d] is still working...\n", num);
		}
		shared_count++;
		tmp2 = shared_count;

		// At this point we are safe with the critical section.
		mutex_unlock(0);
		//

		if (tmp1 / tmp2 != 100) {
			printf("RACE DETECTED !\n"); exit(-1);
		};
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
