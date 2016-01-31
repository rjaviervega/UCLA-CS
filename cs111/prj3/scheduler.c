/*

	Implementation of RRB Scheduler
	CS111 Project #3

	This file implements a round robin scheduler for cs111 project 3.
	It is used to manipulate threads, activating them one at a time,
	and then switching to the next scheduled one.

	It has been implemented with an static array that holds the
	maximun number of threads that can be scheduled by the
	round robin routine, and it uses a few other integer records
	for manipulate the structures.

	Also, the scheduler implements a wrapper function on top of the
	function that is passed to the thread library to suppport and
	handle properly the termination and start process of the indi-
	vidual threads.

	Once a thread is terminanted, it signals the sleeping scheduler
	thread about the termination, so the scheduler can efficiently
	start another thread and take the terminated thread from the
	list of scheduled threads.

	A signal handler is provided for this using the SIGALRM signal,
	and a simple handler that detects its call. Since the singal is
	used only to awake the sleeping scheduler threads, it does not
	need to do any work.

*/

#include "scheduler.h"
#define MAX_THREADS 20

// Global Data
//
int thread_array [MAX_THREADS];		// Array of threads id, -1 indicates empty spot
int thread_count = 0;				// Count of active threads
int thread_done = 0;				// Flag for terminated threads
int active_thread_index = -1;		// Index of the array of last active thread, starts with -1 value


// Important Threads
//
pthread_t scheduler_thread;		// Scheduler Thread ID
pthread_t current;				// Current running thread ID


// Wrapper call Structure
//
typedef struct {
	void *  wrap_arg;		// Wrapper arguments for executing routine
	void * (*routine) (void *);	// Routine to be executed
} wrapper_str;


// Mutex Implementation
int mutex_array [MAX_MUTEXES];
int m_thread_count = 0;
int m_start_index = 0;
int m_end_index = 0;
pthread_t sleep_array [MAX_THREADS];
pthread_t lock_owner_id;
pthread_mutex_t mutex1;

// Implementation:
//


/*
	This function is the one that performs the actual scheduling
	and switching of threads in the array structure.
	This function also sends the block command to the proper
	thread and detects when a thread is terminated.
	This function works bassically with an thread array structure
	and it moves through it to find out which thread to run next.
	It uses a few global indexes and variables to manipulate the
	proper switching of threads.
*/
void rrb_schedule ()
{
	int i;
	int pkill;
	int found;
	int next_thread_index;

	pthread_t next_run;
	struct timespec timer;

	timer.tv_sec = 0;
	timer.tv_nsec = TIME_QUANTA_NS;

	// Check for boundry of array, if we reach the end of the array, start over
	while(1) {

		if ( thread_count == 0 ) return; // If there aren't threads to be ran return

		next_thread_index = active_thread_index + 1; // Get index of next thread to be ran

		if ( next_thread_index == MAX_THREADS ) {
			next_thread_index = 0;
			active_thread_index = 0;
		}

		found = 0; // Find runnable thread flag

		// Select next thread to be ran check until the end of the array
		for ( i = next_thread_index; i < MAX_THREADS; i++ ) {
			if ( ( thread_array[i] != -1 ) ) {
				next_run = thread_array[i];
				active_thread_index = i;
				found = 1;
				break;
			}
		}

		// If there aren't runnable threads until the end of the array search from the beginning
		if ( found == 0 ) {
			for ( i = 0; i < next_thread_index; i++ ) {
				if ( ( thread_array[i] != -1 ) ) {
					next_run = thread_array[i];
					active_thread_index = i;
					found = 1;
					break;
				}
			}
		}

		if ( found != 1 ) {
			return ;
		}

		pkill = pthread_kill ( next_run, SIGCONT ); 		// Weak_up that thread

		nanosleep( &timer, NULL ); 					// Sleep with nano_sleep

		// After weakup
		if ( thread_done == 0 ) {					// if the running thread is not finished
			pthread_kill ( next_run, SIGSTOP ); 	// Stop current thread and continue with while loop
		}
		else { // Thread_done = 1;
			//Reset thread_flag
			thread_done = 0;
			// Thread terminated so it needs to be removed from the list
			// Found where the thread is
			for ( i = 0; i < MAX_THREADS; i ++ ) {
				if ( thread_array[i] == current ) {
					thread_array[i] = -1;
					thread_count--;
					break;
				}
			}
		}

	} // while (1)

}



//
// Psudo Code
// ==========
//
// 1.- Initialize scheduler data
// 2.- Create first thread to be schedule with start routine
//
int run_scheduler( pthread_t * thread, void *(*start_routine)(void *), void * arg)
{
	int i;  //Index
	int rc; //Return value from create_thread
	struct sigaction actions;

	// Setup signal haldler for sig_alrm
	memset(&actions, 0, sizeof(actions));
	sigemptyset(&actions.sa_mask);
	actions.sa_flags = 0;
	actions.sa_handler = sighand;
	sigaction(SIGALRM,&actions,NULL);

	// Get Scheduler Thread ID
	scheduler_thread = pthread_self();

	// Setup active thread start point
	active_thread_index = -1;

	// Initialize thread_array with invalid values
	for ( i = 0; i < MAX_THREADS; i++ ) thread_array[i] = -1;

	// Initialize MUTEX_array with invalid values
	for ( i = 0; i < MAX_THREADS; i++ ) mutex_array[i] = 0;

	// Initialize sleep_array
	for ( i = 0; i < MAX_THREADS; i++ ) sleep_array[i] = -1;

	// Initialize pthread_mutex
	pthread_mutex_init ( &mutex1, NULL );


	// Initialize Mutex Circular Array
	m_start_index = 0;
	m_end_index = 0;



	// Create the main thread and put it to sleep
	rc = create_thread ( thread, start_routine, arg );

	// Start Scheduling
	rrb_schedule();


}



//
// Psudo Code
// ==========
//
// 1.- Create a new thread with start routine and arguments (wrapper)
// 2.- Setup Round Robin Scheduling data structure.
// 3.- Add the newly created thread to scheduler
//
int create_thread(pthread_t * thread, void *(*start_routine)(void *), void * arg)
{
	int i;
	int rc;
	wrapper_str * arguments; // Wrapper Structure

	// Setup arguments for wrapper
	arguments = (wrapper_str *) malloc ( sizeof(wrapper_str) );
	arguments->wrap_arg = arg;
	arguments->routine  = start_routine;

	// Create thread with wrapper routine
	rc = pthread_create ( thread, NULL, (void *) &wrapper, (void *) arguments );

	// Check for return value from pthread call
	if ( rc ) {
		printf ( "Error: calling pthread_create() errno: %d.\n", rc );
		exit(rc);
	}

	// Add thread to be scheduled

	// Increase the number of threads count
	thread_count++;

	// Find an empty spot on the array list on first fit type of algorithm
	for ( i = 0; i < MAX_THREADS; i++ ) if ( thread_array[i] == -1 ) break;

	// Check if array is full
	if ( i == MAX_THREADS -1 ) {
		printf ( "Error: Thread array is full.\n");
		exit (-1);
	}

	// Add the newly created thread id to the array list
	thread_array[i] = (int) (*thread);

	return rc;
}



//
// Psudo Code
// ==========
//
void wrapper ( void * arg_v )
{
	pthread_t self;

	// Get current running thread id
	self = pthread_self();

	// Stop the thread when it is created so it can be run by the scheduler
	pthread_kill ( self, SIGSTOP );

	// Call the original function routine(wrap_arg);
	((wrapper_str *)arg_v) -> routine (((wrapper_str*)arg_v)->wrap_arg);

	thread_done = 1; // thread_is done: ( flag, and set thread id )
	current = self;

	pthread_kill( scheduler_thread, SIGALRM ); // Weakup Scheduler
}



/*
	This is the registered signal handler to wakeup
	the running thread when completition of a task
	is done.
*/
void sighand(int signo)
{
	//printf("Signal Alarm received.\n");
	return;
}



// Psudo Code
// 1.- Gives ownership to the caller thread
// This functions runs until it can get the lock
// from the mutex.
// if not, the get_mutex_lock function will send it to sleep
// to avoid spin lock waste of resources.
//
int mutex_lock (int mutex_number)
{
	int i;
	pthread_t my_id;


	//Check for trying to get a lock hight than MAX_LOCKS
	if ( mutex_number >= MAX_MUTEXES ) {
		return EINVAL;
	}

	pthread_mutex_lock( &mutex1 );

	// we already have the lock
	if ( lock_owner_id ==  my_id ) {

		pthread_mutex_unlock ( &mutex1 );

		return EDEADLK;

	}

	my_id = pthread_self();

	// Attempt to obtain the mutex
	if ( mutex_array [mutex_number] == 0 ) {

		mutex_array [mutex_number] = 1; 	// obtain mutex

		lock_owner_id = my_id;

		pthread_mutex_unlock( &mutex1 );	// release global mutex

		return 1;
	}
	else {
		// Failed attempted to get the mutex

		pthread_mutex_unlock ( &mutex1 );

		pthread_kill ( my_id, SIGSTOP );

		return -1;
	}

	return EINVAL;
}




// Psudo Code
// 1.- Returns ownership to the caller thread
int mutex_unlock(int mutex_number)
{
	int i;
	int old_index;
	int last = 0;
	pthread_t wake_up;
	pthread_t my_id;


	// Get the lock
	pthread_mutex_lock( &mutex1 );

	// Get id
	my_id = pthread_self();

	// trying to release a lock that we don't have
	if ( lock_owner_id != my_id ) {

		pthread_mutex_unlock( &mutex1 );

		return EPERM;
	}

	// Free the lock
	mutex_array [mutex_number] = 0;

	old_index = m_start_index;

	pthread_mutex_unlock( &mutex1 );

	lock_owner_id = -1;

	// Now we preemt so the next task can be ran witout holding
	// any other threat back from running.
	pthread_kill( scheduler_thread, SIGALRM ); // Weakup Scheduler

	return 1;
}

