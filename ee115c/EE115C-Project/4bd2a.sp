* 4BIT D2A (4bit D-to-A converter)
* Weight and sum the bits
* (Convert the 4bits to analog)
* You could post process this to 
* round to the nearest integer
* assumes Vdd=2.5V
.SUBCKT 4BD2A I0 I1 I2 I3 OUT
E0 1   0 I0 0 1
E1 2   1 I1 0 2
E2 3   2 I2 0 4
E3 SUM 3 I3 0 8
E4 OUT 0 SUM 0 0.4
.ENDS

.SUBCKT 5BD2A I0 I1 I2 I3 I4 OUT
E0 1   0 I0 0 1
E1 2   1 I1 0 2
E2 3   2 I2 0 4
E3 4   3 I3 0 8
E5 SUM 4 I4 0 16
E4 OUT 0 SUM 0 0.4
.ENDS

.SUBCKT SUMMER A B C OUT 
* Scale C to 1V (Initially 2.5V)
E2 OUT 2 C 0 0.4
E0 1 0 A 0 1
E1 2 1 B 0 1
.ENDS
