* MirrorAdder 						
* Version A With Inverters

.subckt fulladder A B Ci S Cout Vdd Vss 						

* NMOS NETWORK
M1		1		A		0	0	NMOS 	w=1u		l=.25u	ad=1p	as=1p
M2		1		B		0	0	NMOS 	w=1u		l=.25u	ad=1p	as=1p
M3		2		B		0	0	NMOS 	w=1u		l=.25u	ad=1p	as=1p
M4		3		Ci		1	0	NMOS 	w=1u		l=.25u	ad=1p	as=1p
M5		3		A		2	0	NMOS 	w=1u		l=.25u	ad=1p	as=1p
M6		6		A		0	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M7		6		B		0	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M8		6		Ci		0	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M9		7		3		6	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M10	9		B		0	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M11	10		A		9	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p
M12	7		Ci		10	0	NMOS 	w=.375u	l=.25u	ad=.375p	as=.375p

* PMOS NETWORK
M13	3		Ci		4 		Vdd	PMOS	w=2u		l=.25u	ad=2p	as=2p
M14	3		A		5 		Vdd	PMOS	w=2u		l=.25u	ad=2p	as=2p
M15	4		A		Vdd 	Vdd	PMOS	w=2u		l=.25u	ad=2p	as=2p
M16	4		B		Vdd 	Vdd	PMOS	w=2u		l=.25u	ad=2p	as=2p
M17	5		B		Vdd 	Vdd	PMOS	w=2u		l=.25u	ad=2p	as=2p
M18	7 		3		8 		Vdd	PMOS	w=.3u		l=.25u	ad=.3p	as=.3p
M19	8 		A		Vdd 	Vdd	PMOS	w=.3u		l=.25u	ad=.3p	as=.3p
M20	8 		B		Vdd 	Vdd	PMOS	w=.3u		l=.25u	ad=.3p	as=.3
M21	8 		Ci		Vdd 	Vdd	PMOS	w=.3u		l=.25u	ad=.3p	as=.3p
M22	12 	A		Vdd 	Vdd	PMOS	w=.3u		l=.25u	ad=.3p	as=.3p
M23	11 	B		12 	Vdd	PMOS	w=.3u		l=.25u	ad=.3p	as=.3p
M24	7 		Ci		11 	Vdd	PMOS	w=.3u		l=.25u	ad=.3p	as=.3p

* INVERTERS NETWORK
XA1 3 Cout Vdd 0 inv_1x
XB2 7 S 	  Vdd 0 inv_1x

.ends						
