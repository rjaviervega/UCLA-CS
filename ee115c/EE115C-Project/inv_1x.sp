* INV1X

.subckt inv_1x In Out Vdd GND 
M1 Out In Vdd Vdd pmos W=2U   L=0.25U PD=1U   PS=1U   AS=3P   AD=3P
M2 Out In GND GND nmos W=0.6U L=0.25U PD=0.3U PS=0.3U AS=1.6P AD=1.6P
.ends
