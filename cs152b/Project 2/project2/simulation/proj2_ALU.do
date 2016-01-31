restart

####  
#### 1001   ####
#overflow (pos - neg)
force -freeze sim:/alu/a 0111111111111111 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 1001 0
run


#### 1001   ####
#overflow (neg - pos)
force -freeze sim:/alu/a 1000000000000000 0
force -freeze sim:/alu/b 0111111111111111 0
force -freeze sim:/alu/control 1001 0
run

######ADD
#S=0101010101010101 
force -freeze sim:/alu/a 0000000001010100 0
force -freeze sim:/alu/b 0101010100000001 0
force -freeze sim:/alu/control 0000 0
run

#overflow 
force -freeze sim:/alu/a 0111111111111111 0
force -freeze sim:/alu/b 0000000000000011 0
force -freeze sim:/alu/control 0000 0
run

#overflow
force -freeze sim:/alu/a 1011111111111110 0
force -freeze sim:/alu/b 1000000000000011 0
force -freeze sim:/alu/control 0000 0
run

#zero
force -freeze sim:/alu/a 0000000000000000 0
force -freeze sim:/alu/b 0000000000000000 0
force -freeze sim:/alu/control 0000 0
run

#####SUB
#S=0111111111111100
force -freeze sim:/alu/a 0111111111111111 0
force -freeze sim:/alu/b 0000000000000011 0
force -freeze sim:/alu/control 0001 0
run

#overflow (neg - pos)
force -freeze sim:/alu/a 1000000000000000 0
force -freeze sim:/alu/b 0111111111111111 0
force -freeze sim:/alu/control 0001 0
run

#overflow (pos - neg)
force -freeze sim:/alu/a 0111111111111111 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 0001 0
run

#zero
force -freeze sim:/alu/a 1000000000000000 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 0001 0
run

#### bitwise AND
#zero
force -freeze sim:/alu/a 0111111111111111 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 0010 0
run

#S=000000000000001
force -freeze sim:/alu/a 0111111111111111 0
force -freeze sim:/alu/b 1000000000000001 0
force -freeze sim:/alu/control 0010 0
run

#####bitwise OR
#zero
force -freeze sim:/alu/a 0000000000000000 0
force -freeze sim:/alu/b 0000000000000000 0
force -freeze sim:/alu/control 0011 0
run

#S=1111111111111111
force -freeze sim:/alu/a 0111111111111111 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 0011 0
run

#######Increment
#overflow
force -freeze sim:/alu/a 0111111111111111 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 0100 0
run

#S=0000000000000011
force -freeze sim:/alu/a 0000000000000010 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 0100 0
run

#overflow
force -freeze sim:/alu/a 0000000000000001 0
force -freeze sim:/alu/b 0000000000000000 0
force -freeze sim:/alu/control 0101 0
run

#S= 0000000000000001
force -freeze sim:/alu/a 0000000000000010 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 0101 0
run

#########Two's Complement
#S=1000000000000001
force -freeze sim:/alu/a 0111111111111111 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 0110 0
run

#S=0111111111111111
force -freeze sim:/alu/a 1000000000000001 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 0110 0
run

#zero
force -freeze sim:/alu/a 0000000000000000 0
force -freeze sim:/alu/b 1000000000000000 0
force -freeze sim:/alu/control 0110 0
run

#####LSL
#S= 0000000000000010
force -freeze sim:/alu/a 1000000000000001 0
force -freeze sim:/alu/b 0000000000000001 0
force -freeze sim:/alu/control 1100 0
run

#S= 0000000000000000 (zero)
force -freeze sim:/alu/a 1000000000000001 0
force -freeze sim:/alu/b 0000000000001111 0
force -freeze sim:/alu/control 1100 0
run

#########LSR
#S= 0100000000000000
force -freeze sim:/alu/a 1000000000000001 0
force -freeze sim:/alu/b 0000000000000001 0
force -freeze sim:/alu/control 1110 0
run

#S= 0000000000000000
force -freeze sim:/alu/a 1000000000000001 0
force -freeze sim:/alu/b 0000000000000001 0
force -freeze sim:/alu/control 1110 0
run
 
#########ASR
#S= overflow
force -freeze sim:/alu/a 1000000000000001 0
force -freeze sim:/alu/b 0000000000000001 0
force -freeze sim:/alu/control 1000 0
run

#S= 0010000000000000
force -freeze sim:/alu/a 1000000000000001 0
force -freeze sim:/alu/b 0000000000000010 0
force -freeze sim:/alu/control 1000 0
run

###########ASL

#S=000000000000010
force -freeze sim:/alu/a 1000000000000001 0
force -freeze sim:/alu/b 0000000000000001 0
force -freeze sim:/alu/control 1010 0
run

##LT

force -freeze sim:/alu/a 0000000000000111 0
force -freeze sim:/alu/b 0000000000000010 0
force -freeze sim:/alu/control 1001 0
run

force -freeze sim:/alu/a 0000000000000000 0
force -freeze sim:/alu/b 0000000000000000 0
force -freeze sim:/alu/control 1001 0
run

force -freeze sim:/alu/a 0000000000000000 0
force -freeze sim:/alu/b 0000000000000010 0
force -freeze sim:/alu/control 1001 0
run