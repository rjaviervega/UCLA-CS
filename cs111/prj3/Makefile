all: round race race_bad

round: round_robin.c scheduler.o
	gcc -o round round_robin.c scheduler.o -pthread

race: race_condition_fixed.c scheduler.o
	gcc -o race race_condition_fixed.c scheduler.o -pthread

race_bad: race_condition.c scheduler.o
	gcc -o race_bad race_condition.c scheduler.o -pthread


scheduler.o : scheduler.c scheduler.h
	gcc -c scheduler.c

clean:
	rm round race scheduler.o
