* TG Adder

.subckt fulladder A B C S Cout Vdd GND

* INVERTERS NETWORK 
M1 	1 	A	Vdd	Vdd	PMOS 	L=0.25u W=.25u AS=.25P AD=.25P
M2 	1	A	0 		0 		NMOS 	L=0.25u W=.25u AS=.25P AD=.25P

* RIGHT GATES
M3 	4 	3 	6 		Vdd 	PMOS 	L=0.25u W=.75u AS=.75P AD=.75P
M4 	1 	2 	6 		Vdd 	PMOS 	L=0.25u W=0.25u AS=.25P AD=.25P
M5 	C 	3 	5 		Vdd 	PMOS 	L=0.25u W=0.25u AS=.25P AD=.25P
M6 	4 	2 	6 		0 		NMOS 	L=0.25u W=.75u AS=.75P AD=.75P
M7 	1 	3 	6 		0 		NMOS 	L=0.25u W=0.25u AS=.25P AD=.25P
M8 	C 	2 	5 		0 		NMOS 	L=0.25u W=0.25u AS=.25P AD=.25P
M9 	4 	3 	5 		0 		NMOS 	L=0.25u W=0.25u AS=.25P AD=.25P
M10 	4 	2 	5 		Vdd 	PMOS 	L=0.25u W=0.25u AS=.25P AD=.25P

* LEFT GATES
M11 	3 	A 	B 		0 		NMOS 	L=0.25u W=0.25u AS=0.25P AD=0.25P
M12 	3 	1 	B 		Vdd 	PMOS 	L=0.25u W=0.25u AS=0.25P AD=0.25P
M13 	2 	1	B 		0 		NMOS 	L=0.25u W=0.25u AS=0.25P AD=0.25P
M14 	2 	A 	B 		Vdd 	PMOS 	L=0.25u W=0.25u AS=0.25P AD=0.25P

* CMOS B GATE INPUT
M15 	3 	B 	A 		0 		NMOS L=0.25u W=0.25u AS=.25P AD=.25P
M16 	3 	B 	1 		Vdd 	PMOS L=0.25u W=.25u AS=.25P AD=.25P
M17 	2 	B 	A 		Vdd 	PMOS L=0.25u W=.25u AS=.25P AD=.25P
M18 	2 	B 	1 		0 		NMOS L=0.25u W=0.25u AS=.25P AD=.25P

* INVERTER SUM
M19 	S 	5 	Vdd 	Vdd 	PMOS L=0.25u W=1u AS=1P AD=1P
M20 	S 	5 	0 		0 		NMOS L=0.25u W=1u AS=1P AD=1P

* INVERT COUT OUTPUT
M21 	Cout 	6 	Vdd 	Vdd 	PMOS L=0.25u W=2u AS=2P AD=2P
M22 	Cout	6 	0 		0 	 	NMOS L=0.25u W=2u AS=2P AD=2P

* INVERT CIN INPUT
M23 	4 	C 	Vdd 	Vdd 	PMOS L=0.25u W=2u AS=2P AD=2P
M24 	4 	C 	0 		0 		NMOS L=0.25u W=2u AS=2P AD=2P

.ends
