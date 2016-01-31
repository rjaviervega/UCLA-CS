* 4bit ripple carry adder

*.include "tgadder.sp"
.include "mirroradder.sp"

.subckt adder4bit 
+ A0 A1 A2 A3 B0 B1 B2 B3 Ci 
+ S0 S1 S2 S3 C3
+ Vdd GND

X1 A0 B0 Ci S0 C0 Vdd GND fulladder 
X2 A1 B1 C0 S1 C1 Vdd GND fulladder
X3 A2 B2 C1 S2 C2 Vdd GND fulladder
X4 A3 B3 C2 S3 C3 Vdd GND fulladder  

.ends
