#include <pthread.h>
#include <signal.h>
#include <time.h>
#include <errno.h>

#define MAX_MUTEXES 10
#define TIME_QUANTA_S 0
#define TIME_QUANTA_NS 250000000

int run_scheduler( pthread_t * thread, void *(*start_routine)(void *), void * arg);
int create_thread(pthread_t * thread, void *(*start_routine)(void *), void * arg);
int mutex_lock(int mutex_number);
int mutex_unlock(int mutex_number);
void wrapper ( void * arg_v );
void rrb_schedule ();
void sighand(int signo);
