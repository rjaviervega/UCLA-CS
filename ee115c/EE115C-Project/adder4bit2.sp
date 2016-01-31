* 4bit ripple carry adder
* Mirror Inverting Inputs

.include "mirroradder2.sp"

.subckt adder4bit 
+ A0 A1 A2 A3 B0 B1 B2 B3 Ci 
+ S0 S1 S2 S3 C3
+ Vdd GND

* Invert Inputs for 2d version of M_Adder
XA1 	A1 	A1_not 	Vdd 	GND	inv_1x
XA3 	A3 	A3_not 	Vdd	GND	inv_1x
XB1 	B1	 	B1_not 	Vdd 	GND	inv_1x
XB3 	B3 	B3_not 	Vdd 	GND	inv_1x

* Modified version of bar Inputs
X1 A0 		B0 		Ci 	S0_not 	C0 	Vdd 	GND 	fulladder 
X2 A1_not 	B1_not 	C0 	S1 		C1 	Vdd 	GND 	fulladder
X3 A2 		B2 		C1 	S2_not 	C2 	Vdd 	GND 	fulladder
X4 A3_not 	B3_not 	C2 	S3			C3 	Vdd 	GND 	fulladder  


* Inverting output
XS0	S0_not	S0		Vdd	GND	inv_1x
XS2	S2_not	S2		Vdd	GND	inv_1x


.ends
