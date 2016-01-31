* MirrorAdder 						
* Version (B) No Inverters

.subckt fulladder A B Ci S Cout Vdd Vss 						

* NMOS NETWORK
M1		1		A		0	0	NMOS 	w=1u		l=.25u	ad=1p		as=1p
M2		1		B		0	0	NMOS 	w=1u		l=.25u	ad=1p		as=1p
M3		2		B		0	0	NMOS 	w=1u		l=.25u	ad=1p		as=1p
M4		Cout	Ci		1	0	NMOS 	w=1u		l=.25u	ad=1p		as=1p
M5		Cout	A		2	0	NMOS 	w=1u		l=.25u	ad=1p		as=1p
M6		6		A		0	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M7		6		B		0	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M8		6		Ci		0	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M9		S		Cout	6	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M10	9		B		0	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M11	10		A		9	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M12	S		Ci		10	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p

* PMOS NETWORK
M13	Cout	Ci		4 		Vdd	PMOS	w=2u		l=.25u	ad=2p		as=2p
M14	Cout	A		5 		Vdd	PMOS	w=2u		l=.25u	ad=2p		as=2p
M15	4		A		Vdd 	Vdd	PMOS	w=2u		l=.25u	ad=2p		as=2p
M16	4		B		Vdd 	Vdd	PMOS	w=2u		l=.25u	ad=2p		as=2p
M17	5		B		Vdd 	Vdd	PMOS	w=2u		l=.25u	ad=2p		as=2p
M18	S 		Cout	8 		Vdd	PMOS	w=.375u	l=.25u	ad=.375p	as=.375p
M19	8 		A		Vdd 	Vdd	PMOS	w=.375u	l=.25u	ad=.375p	as=.375p
M20	8 		B		Vdd 	Vdd	PMOS	w=.375u	l=.25u	ad=.375p	as=.375p
M21	8 		Ci		Vdd 	Vdd	PMOS	w=.375u	l=.25u	ad=.375p	as=.375p
M22	12 	A		Vdd 	Vdd	PMOS	w=.375u	l=.25u	ad=.375p	as=.375p
M23	11 	B		12 	Vdd	PMOS	w=.375u	l=.25u	ad=.375p	as=.375p
M24	S 		Ci		11 	Vdd	PMOS	w=.375u	l=.25u	ad=.375p	as=.375p

.ends						
