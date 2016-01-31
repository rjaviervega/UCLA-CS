Define first 	1
Define second 	15
Define third 	20

done:	addi r1, r0, first ;6081
	addi r2, r0, second
	slt  r3, r2, r0
loop:	beq  r3, r1, done
	sla  r4, r1, r2
	sw   r4, third(r2)
	dec  r2, r2
	j    loop
	add  r1, r2, r3
	hlt	