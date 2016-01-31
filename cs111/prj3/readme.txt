Eduardo Jose Esquivel	SID# 103-016-644
Roberto Javier Vega	SID# 003-110-717


Readme:
=======
	For this project everything is working. We implemented the
	round robin scheduler and the proper fix for the race 
	condition routine, by implementing the appropriate locks
	on the mutex calls, and by handling the return values of
	the lock. We use preemption enforced by the round robin
	scheduler routine.

	Note:
		- the thread_api.c and thread_api.h have been 
		renamed to scheduler.c and scheduler.h.

		- this means that the round_robin.c file and
		race_condition.c need to be update to include
		scheduler.h and to be compiled with scheduler.o
		file.
